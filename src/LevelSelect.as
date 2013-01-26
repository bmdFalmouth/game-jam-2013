package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author James Simpson
	 */
	public class LevelSelect extends Sprite
	{
		private var back:CachedSprite;
		
		public function LevelSelect() 
		{
			back = new CachedSprite(images.BACK);
			addChild(back);
			
			addEventListener(MouseEvent.CLICK, showIntro);
		}
		
		public function showIntro(e:MouseEvent):void
		{
			showECGGame();
		}
		
		public function showECGGame():void 
		{
			Main.sm.display("ECG");
		}
		
	}

}