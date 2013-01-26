package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author gnarles
	 */
	public class Help extends Sprite 
	{
		
		private var text:TextField;
		
		public function Help() 
		{
			text = new TextField();
			text.x = 20;
			text.y = 20;
			text.scaleX = 4;
			text.scaleY = 4;
			text.text = "Help - Back to the menu";
			addChild(text);
			
			//Run video, if user touches the screen or the video ends then proceed to the Scanner screen.
			addEventListener(MouseEvent.CLICK, showMainMenu);
		}
		
		public function showMainMenu(e:MouseEvent):void
		{
			changeScreen();
		}
		
		private function changeScreen():void
		{
			Main.sm.display("MainMenu");
		}
		
	}

}