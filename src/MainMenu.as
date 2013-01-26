package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author gnarles
	 */
	public class MainMenu extends Sprite 
	{		
		private var text:TextField;
		
		public function MainMenu() 
		{
			text = new TextField();
			text.x = 20;
			text.y = 20;
			text.scaleX = 4;
			text.scaleY = 4;
			text.text = "Main Menu";
			addChild(text);
			
			addEventListener(MouseEvent.CLICK, showIntro);
		}
		
		public function showIntro(e:MouseEvent)
		{
			text.text = "Clicked";
			Main.sm.display("Intro");
		}
	}
}