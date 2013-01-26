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
		private var timePanel:CachedSprite;
		
		public function LevelSelect() 
		{
			back = new CachedSprite(images.BACK);
			timePanel = new CachedSprite(images.TIME_PANEL);
			addChild(back);
			addChild(timePanel);
			
			timePanel.scaleY = 0.6666;
			timePanel.scaleY = 0.6666;
			timePanel.y = 190;
			
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