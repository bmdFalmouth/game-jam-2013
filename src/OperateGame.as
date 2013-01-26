package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author me
	 */
	public class OperateGame extends Sprite 
	{
		private var bg:CachedSprite;
		
		public function OperateGame() 
		{
			bg = new CachedSprite(images.OPERATE_GAME_BACKGROUND);
			addChild(bg);
			
		}
		
	}

}