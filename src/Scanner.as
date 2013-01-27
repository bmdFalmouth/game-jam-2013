package  
{
	import com.google.zxing.BinaryBitmap;
	import com.google.zxing.BufferedImageLuminanceSource;
	import com.google.zxing.client.result.ParsedResult;
	import com.google.zxing.common.flexdatatypes.HashTable;
	import com.google.zxing.common.GlobalHistogramBinarizer;
	import com.google.zxing.qrcode.QRCodeReader;
	import com.google.zxing.Result;
	import com.google.zxing.client.result.ResultParser;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.events.VideoEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.media.Camera;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.text.TextField;
	import flash.system.Capabilities;
	import flash.media.Video;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import com.google.zxing.DecodeHintType;
	import com.google.zxing.BarcodeFormat;
	/**
	 * ...
	 * @author James Simpson
	 */
	public class Scanner extends Sprite
	{		
		private var back:CachedSprite;
		private var cameraButton:CachedSprite;
		
		private var clock:Clock;
		
		private var video:Video;
		private var videoURL:String = "heart_normal.flv";
        private var connection:NetConnection;
        private var stream:NetStream;
		
		private var qrReader:QRCodeReader;
		private var detectionRate:int = 10;
		
		private var qrDecodedDataOld:String; 
		
		private var markerGuide:Sprite;
		private var refreshTimer:Timer;
		private var timesCompleted:int = 0;
		
		protected var camera:Camera;
        private var videoDisplay:Video=new Video(360, 360);
        private var bmd:BitmapData;
        private var cameraStarted:Boolean = false;
		
		public function Scanner() 
		{			
			video = new Video();
			video.x = 1;
			video.y = 500;
			video.width = 720;
			video.height = 720;
			back = new CachedSprite(images.BACK);
			addChild(back);
			

			connection = new NetConnection();
			connection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            connection.connect(null);
			
			createClock();
			createCameraButton();
		}
		
		private function createCameraButton():void
		{
			cameraButton = new CachedSprite(images.CAMERA_BUTTON);
			cameraButton.x = 610;
			cameraButton.y = 18;
			cameraButton.addEventListener(MouseEvent.CLICK, showQRS);
			addChild(cameraButton);
		}
		
		private function createClock():void
		{
			clock = new Clock();
			clock.y = 218;
			clock.x = 255;
			addChild(clock);
		}
		
		private function showQRS(e:Event):void
		{
			cameraButton.removeEventListener(MouseEvent.CLICK, showQRS);
			
			videoDisplay.visible = true;
			
			if(Camera.isSupported)
			{	
				camera = Camera.getCamera();
				camera.setMode(300, 300, 25);
				
				videoDisplay = new Video(camera.width, camera.height);
				videoDisplay.attachCamera(camera);
				
				videoDisplay.rotation = 90;
				
				videoDisplay.x = 650;
				videoDisplay.y = 550;
				videoDisplay.scaleX = 2;
				videoDisplay.scaleY = 2;
				
				qrReader = new QRCodeReader;
						
				addChild(videoDisplay);
				
				refreshTimer = new Timer(1000); 	
				refreshTimer.addEventListener(TimerEvent.TIMER, refresh);
				refreshTimer.start();
			}
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
				stream.seek(0);
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
		
	
		private function refresh( event:Event ):void
		{	// process webcam image and check for QRcode
			decodeSnapshot();
		}
		
		public function decodeSnapshot():void
        {
            bmd=new BitmapData(300, 300);
            bmd.draw(videoDisplay, null, null, null, null, true);
            videoDisplay.cacheAsBitmap=true;
            videoDisplay.cacheAsBitmapMatrix=new Matrix;
            decodeBitmapData(bmd, 300, 300);
            bmd.dispose();
            bmd = null;
            //System.gc();
        }
		
		public function decodeBitmapData(bmpd:BitmapData, width:int, height:int):void
		{
			var lsource:BufferedImageLuminanceSource=new BufferedImageLuminanceSource(bmpd);
			var bitmap:BinaryBitmap=new BinaryBitmap(new GlobalHistogramBinarizer(lsource));

			var ht:HashTable=null;
			ht=this.getAllHints();

			var res:Result=null;
			try
			{
				res=qrReader.decode(bitmap, ht);
			}
			catch (event:Error)
			{
			}

			if (res == null)
			{
				videoDisplay.clear();
			}
			else
			{
				var parsedResult:ParsedResult=ResultParser.parseResult(res);
				removeChild(videoDisplay);
				cameraStarted = false;
				Main.sm.display("Levels");
			}
		}
		
		public function getAllHints():HashTable
		{
			var ht:HashTable=new HashTable;
			ht.Add(DecodeHintType.POSSIBLE_FORMATS, BarcodeFormat.QR_CODE);
			return ht;
		}
		
		
	}

}