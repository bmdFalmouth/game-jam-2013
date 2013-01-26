package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author gnarles
	 */
	public class Intro extends Sprite 
	{
		private var text:TextField;
		
		public function Intro() 
		{
			text = new TextField();
			text.x = 20;
			text.y = 20;
			text.scaleX = 4;
			text.scaleY = 4;
			text.text = "Intro Screen";
			addChild(text);
			
			//Run video, if user touches the screen or the video ends then proceed to the Scanner screen.
			addEventListener(MouseEvent.CLICK, showIntro);
		}
		
		public function showIntro(e:MouseEvent):void
		{
			changeScreen();
		}
		
		private function changeScreen():void
		{
			Main.sm.display("QRS");
		}
	}

}