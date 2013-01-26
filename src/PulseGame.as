package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author me
	 */
	public class PulseGame extends Sprite 
	{
		private var bg:CachedSprite;
		
		public function PulseGame() 
		{
			bg = new CachedSprite(images.PULSE_GAME_BACKGROUND);
			addChild(bg);
		}
		
	}

}