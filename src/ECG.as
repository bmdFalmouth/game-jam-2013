package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author James Simpson
	 */
	public class ECG extends Sprite
	{
		private var back:CachedSprite;
		private var clock:TextField;
		
		private var wavePanel:CachedSprite;
		
		private var line1:Sprite;
		private var lastX:Number, lastY:Number, newX:Number, newY:Number;
		private var frameCounter:int=0;
		private var progressError:int=10;
		private var averageError:int=15;
		private var badError:int=20;
		private var frameRate:int = 30;
		private var shouldvePressed:int;
		private var frequencyOfCalls:int =5; //on every (frequencyOfCalls) frames, the metronome will fire.
		
		private var waveInt:int;
		private var amplitude:int;
				
		public function ECG() 
		{
			back = new CachedSprite(images.BACK);
			addChild(back);	
			
			wavePanel = new CachedSprite(images.WAVE_PANEL);
			addChild(wavePanel);
			wavePanel.x = 2;
			wavePanel.y = 600;
			
			clock = new TextField();
			clock.defaultTextFormat = Main.font;
			clock.embedFonts = true;
			clock.width = 720;
			clock.height = 200;
			clock.y = 218;
			clock.x = 255;
			clock.text = "00:30";
			addChild(clock);
			
			line1 = new Sprite();
			addChild(line1);

			

			waveInt = 10;
			amplitude = 100;
			drawWave();
			addEventListener(Event.ENTER_FRAME, incrementCounter);
		}
		
		private function animWave(e:Event):void
		{					
			var ang:Number = 2 * Math.PI * 3 * waveInt / Main.theStage.stageWidth;
			var ypoint:Number = amplitude * Math.sin(ang)
			line1.graphics.lineTo(waveInt, 875 - ypoint);
			
			if (waveInt == (Main.theStage.stageWidth - 10))
			{
				waveInt = 10;
				line1.graphics.clear();				
				line1.graphics.lineStyle(5, 0xff0000);
				line1.graphics.moveTo(10, 875);
			}
			else
			{
				waveInt += 5;
			}
			
			if (-1 > ypoint ? false : ( 1 < ypoint ? false : true ))
			{
				amplitude = Math.floor(Math.random() * (300 - 100 + 1)) + 100;  
			}
		}		
		private function drawWave():void
		{  
			line1.graphics.clear();
			line1.graphics.lineStyle(5, 0xff0000);
			line1.graphics.moveTo(10, 875);
			
			addEventListener(Event.ENTER_FRAME, animWave);
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
				shouldvePressed = frameCounter;
			}
		}
		
		private function drawRandom(event:Event):void
		{  
			line1.graphics.clear();
			line1.graphics.lineStyle(5, 0xff0000);
			line1.graphics.moveTo(10, 875);
			
			addEventListener(Event.ENTER_FRAME, animWave);
		}  
	}

}