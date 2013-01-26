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
		private var frequencyOfCalls:int =5; //on every (frequencyOfCalls) frames, the metronome will fire.
		
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
			addEventListener(Event.ENTER_FRAME, incrementCounter);
		}
		
		//increments a counter,frame by frame. It also checks to see if the metronome method should execute a function on each frame.
		private function incrementCounter():void {
			if (frameCounter >= frameRate)
			{
				frameCounter = 0;
			}
			else {
				frameCounter++;
			}
			metronome(frequencyOfCalls);
		}
		
		//when the button is pressed; call this method. It takes in when the button was pressed and compares it to when the button 
		//should've been pressed and returns a string based on how accurate the user is
		private function buttonPressed(pressedTime:int):String {
			if ((pressedTime >= (shouldvePressed - progressError) && (pressedTime <= (progressError+progressError)))) {
				return "good"
			}
			else if ((pressedTime >= (shouldvePressed - averageError) && (pressedTime <= averageError))) {
				return "average"
			}
			else {
				return "bad"	
			}
		
		}
		
		//takes in a frequency in number of frames. Method checks if the counter is divisible by the frequency given. 
		//If it is, then it executes a chosen method.
		private function metronome(frequency:int):void {
			if (frameCounter % frequency == 0)
			{
				//call method here
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