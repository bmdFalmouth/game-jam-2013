package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author me
	 */
	public class SimonGame extends Sprite 
	{
		private var bg:CachedSprite;
		
		public function SimonGame() 
		{
			bg = new CachedSprite(images.SIMON_GAME_BACKGROUND);
			addChild(bg);
		}
		
	}

}