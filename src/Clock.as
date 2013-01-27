package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author gnarles
	 */
	public class Clock extends Sprite 
	{
		private var clock:TextField;
		private var clockCounterMinutes:int;
		private var clockCounterSeconds:int;
		
		public static var timerSurvived:int;
		public static var timerRemaining:int = 180;
		public var frameCount:int;
		
		public function Clock() 
		{
			createClock();
			
			addEventListener(Event.ENTER_FRAME, updateClock);
		}
		
		private function createClock():void
		{
			clock = new TextField();
			clock.defaultTextFormat = Main.font;
			clock.embedFonts = true;
			clock.width = 720;
			clock.height = 200;
			
			addChild(clock);
			
			updateClock();
		}
		
		private function updateClock(e:Event=null):void
		{
			frameCount++;
			
			if (frameCount == 30)
			{
				timerSurvived++;
				timerRemaining--;
				frameCount = 0;
				
				clockCounterMinutes = timerRemaining / 60;
				clockCounterSeconds = timerRemaining % 60;
			
				clock.text =  getClockText(clockCounterMinutes) + ":" + getClockText(clockCounterSeconds);
			}
		}
		
		public function getClockText(value:int):String 
		{
			var clockText:String;
			
			if (value < 10)
			{
				clockText = "0" + value.toString();
			}
			else
			{
				clockText = value.toString();
			}
			
			return clockText;
		}
		
		public function stop()
		{
			removeEventListener(Event.ENTER_FRAME, updateClock);
		}
	}
}