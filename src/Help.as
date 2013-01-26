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
		private var background:CachedSprite;
		
		public function Help() 
		{
			background = new CachedSprite(images.HELP_PAGE);
			addChild(background);

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