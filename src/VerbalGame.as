package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author me
	 */
	public class VerbalGame extends Sprite 
	{
		private var bg:CachedSprite;
		
		public function VerbalGame() 
		{
			bg = new CachedSprite(images.VERBAL_GAME_BACKGROUND);
			addChild(bg);
		}
		
	}

}