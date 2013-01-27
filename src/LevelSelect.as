package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author James Simpson
	 */
	public class LevelSelect extends Sprite
	{
		private var back:CachedSprite;
		private var clock:Clock;
		
		private var ecgLevelSelect:CachedSprite;
		
		public function LevelSelect() 
		{
			createBackground();
			createClock();

			createECGLevelSelect();
		}
		
		private function createBackground():void
		{
			back = new CachedSprite(images.BACK);
			addChild(back);
		}
		
		private function createClock():void
		{
			clock = new Clock();
			clock.y = 218;
			clock.x = 255;
			addChild(clock);
		}
		
		private function showECGGame(e:MouseEvent):void 
		{
			Main.sm.display("ECG");
		}
		
		private function createECGLevelSelect():void
		{
			ecgLevelSelect = new CachedSprite(images.ECG_LEVEL_SELECT);
			ecgLevelSelect.x = 0;
			ecgLevelSelect.y = 600;
			
			addChild(ecgLevelSelect);
			
			ecgLevelSelect.addEventListener(MouseEvent.CLICK, showECGGame);
		}
		
	}

}