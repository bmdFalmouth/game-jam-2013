package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author James Simpson
	 */
	public class ECG extends Sprite
	{
		private var back:CachedSprite;
		private var timePanel:CachedSprite;
		
		private var line:Sprite;
		
		private var lastX:Number, lastY:Number, newX:Number, newY:Number;
		private var frameCounter:int=0;
		private var progressError:int=10;
		private var averageError:int=15;
		private var badError:int=20;
		private var frameRate:int = 30;
		private var shouldvePressed:int;
		
		public function ECG() 
		{
			back = new CachedSprite(images.BACK);
			timePanel = new CachedSprite(images.TIME_PANEL);
			addChild(back);
			addChild(timePanel);
			
			timePanel.scaleY = 0.6666;
			timePanel.scaleY = 0.6666;
			timePanel.y = 190;		
			
			line = new Sprite();
			addChild(line);
			
			lastX = 10;
			lastY = 800;
			
			line.graphics.lineStyle(2,0xb1e5f3); 
			line.graphics.moveTo(lastX,lastY);  
			line.addEventListener(Event.ENTER_FRAME, drawRandom);
		}
		
		private function incrementCounter():void {
			if (frameCounter >= frameRate)
			{
				frameCounter = 0;
			}
			else {
				frameCounter++;
			}
			
		}

		private function buttonPressed(pressedTime:int):String {
			if ((pressedTime >= (shouldvePressed - progressError) && (pressedTime <= (progressError+progressError))) {
				return "good"
			}
			else if ((pressedTime >= (shouldvePressed - averageError) && (pressedTime <= averageError))) {
				return "average"
			}
			else {
				return "bad"
			}
		
		}
		
		private function drawRandom(event:Event):void
		{  
			newX = lastX + Math.random() * 2;  
			newY = Math.tan(lastY + Math.random() * 800);  
			line.graphics.lineTo(newX,newY);  
			lastX = newX;  
			lastY = newY;  
		}  
	}

}