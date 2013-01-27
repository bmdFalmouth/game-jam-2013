package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author gnarles
	 */
	public class MainMenu extends Sprite 
	{		
		private var background:CachedSprite;
		private var playMenuButton:CachedSprite;
		private var aboutMenuButton:CachedSprite;
		private var helpMenuButton:CachedSprite;
		
		public function MainMenu() 
		{
			background = new CachedSprite(images.MENU_BACKGROUND);
			
			playMenuButton = new CachedSprite(images.PLAY_MENU_BUTTON);
			playMenuButton.y = 82;
			
			aboutMenuButton = new CachedSprite(images.ABOUT_MENU_BUTTON);
			aboutMenuButton.y = 466;
			
			helpMenuButton = new CachedSprite(images.HELP_MENU_BUTTON);
			helpMenuButton.y = 852;
			
			addChild(background);
			addChild(playMenuButton);
			addChild(aboutMenuButton);
			addChild(helpMenuButton);
			
			playMenuButton.addEventListener(MouseEvent.CLICK, showIntro);
			aboutMenuButton.addEventListener(MouseEvent.CLICK, showAbout);
			helpMenuButton.addEventListener(MouseEvent.CLICK, showHelp);
		}
		
		public function showIntro(e:MouseEvent):void
		{
			Clock.timerRemaining = Clock.defaultTimerRemaining;
			Main.sm.display("QRS");
		}
		
		public function showAbout(e:MouseEvent):void
		{
			Main.sm.display("About");
			var clickRequest:URLRequest = new URLRequest("click_1.mp3");
			var sound:Sound = new Sound();
			sound.load(clickRequest);
			sound.play();  
		}
		
		public function showHelp(e:MouseEvent):void
		{
			Main.sm.display("Help");
			var clickRequest:URLRequest = new URLRequest("click_1.mp3");
			var sound:Sound = new Sound();
			sound.load(clickRequest);
			sound.play(); 
		}
	}
}