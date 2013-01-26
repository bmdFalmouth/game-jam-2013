package  
{
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.MouseEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	
	/**
	 * ...
	 * @author gnarles
	 */
	public class Intro extends Sprite 
	{
		private var video:Video;
		private var videoURL:String = "Splash.f4v";
        private var connection:NetConnection;
        private var stream:NetStream;
		
		public function Intro() 
		{
			video = new Video();
			video.height = 1280;
			video.width = 720;
			
			connection = new NetConnection();
			connection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            connection.connect(null);
			
			//Run video, if user touches the screen or the video ends then proceed to the Scanner screen.
			video.addEventListener(MouseEvent.CLICK, showIntro);
		}
		
		public function showIntro(e:MouseEvent):void
		{
			changeScreen();
		}
		
		private function changeScreen():void
		{
			Main.sm.display("MainMenu");
		}
		
		private function netStatusHandler(event:NetStatusEvent):void
		{
            switch (event.info.code) {
                case "NetConnection.Connect.Success":
                    connectStream();
                    break;
                case "NetStream.Play.StreamNotFound":
                    trace("Unable to locate video: " + videoURL);
                    break;
            }
        }

        private function connectStream():void
		{
            stream = new NetStream(connection);
            stream.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            stream.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
            video.attachNetStream(stream);
            stream.play(videoURL);
            addChild(video);
			stream.addEventListener(NetStatusEvent.NET_STATUS, NCListener); 
        }	
		
		public function NCListener(e:NetStatusEvent):void
		{ 
			if (e.info.code == "NetStream.Buffer.Empty")
			{
				changeScreen();
			}
		}
		
		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
            trace("securityErrorHandler: " + event);
        }
        
        private function asyncErrorHandler(event:AsyncErrorEvent):void
		{
            // ignore AsyncErrorEvent events.
        }
	}

}