package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author gnarles
	 */
	public class Game extends Sprite 
	{
		public function Game() 
		{			
			addEventListener(Event.ADDED_TO_STAGE, init);
			//addEventListener(Event.ENTER_FRAME, GameLoop);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

}