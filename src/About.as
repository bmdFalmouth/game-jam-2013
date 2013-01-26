package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author gnarles
	 */
	public class About extends Sprite 
	{
		private var background:CachedSprite;
		
		public function About() 
		{
			background = new CachedSprite(images.ABOUT_PAGE);
			addChild(background);
			
			//Run video, if user touches the screen or the video ends then proceed to the Scanner screen.
			background.addEventListener(MouseEvent.CLICK, showMainMenu);
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