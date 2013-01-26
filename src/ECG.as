package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author James Simpson
	 */
	public class ECG extends Sprite
	{
		private var back:CachedSprite;
		private var clock:TextField;
		private var clockCounter:int;
		
		private var wavePanel:CachedSprite;
		
<<<<<<< HEAD
		private var line1:Sprite;
		private var lastX:Number, lastY:Number, newX:Number, newY:Number;
=======
		private var indicator1:CachedSprite;
		private var indicator2:CachedSprite;
		private var indicator3:CachedSprite;
		
		private var line1:Sprite;
		/*private var lastX:Number, lastY:Number, newX:Number, newY:Number;
>>>>>>> ECG v0.1
		private var frameCounter:int=0;
		private var progressError:int=10;
		private var averageError:int=15;
		private var badError:int=20;
		private var frameRate:int = 30;
		private var shouldvePressed:int;
<<<<<<< HEAD
		private var frequencyOfCalls:int =5; //on every (frequencyOfCalls) frames, the metronome will fire.
=======
		private var frequencyOfCalls:int =30; //on every (frequencyOfCalls) frames, the metronome will fire.*/
>>>>>>> ECG v0.1
		
		private var waveInt:int;
		private var amplitude:int;
		
		private var indicator1display:Number;
		private var indicator2display:Number;
		private var indicator3display:Number;
		
		private var indicator1pressed:Number;
		private var indicator2pressed:Number;
		private var indicator3pressed:Number;
		
		private var bottle1:CachedSprite;
		private var bottle2:CachedSprite;
		private var bottle3:CachedSprite;
		private var bottle4:CachedSprite;
		private var bottle5:CachedSprite;
		
		private var bottles:Array;
		
		private var winCounter:int;
				
		public function ECG() 
		{
			winCounter = 0;
			back = new CachedSprite(images.PULSE_GAME_BACKGROUND);
			addChild(back);	
			
			indicator1 = new CachedSprite(images.PULSE_INDICATOR);
			indicator2 = new CachedSprite(images.PULSE_INDICATOR);
			indicator3 = new CachedSprite(images.PULSE_INDICATOR);
			addChild(indicator1);
			addChild(indicator2);
			addChild(indicator3);
			
			clockCounter = 30;
			
			clock = new TextField();
			clock.defaultTextFormat = Main.font;
			clock.embedFonts = true;
			clock.width = 720;
			clock.height = 200;
			clock.y = 218;
			clock.x = 255;
			clock.text = "00:"+clockCounter;
			addChild(clock);
			
			line1 = new Sprite();
			addChild(line1);
			
			indicator1.x = 225;
			indicator2.x = 345;
			indicator3.x = 465;
			
			indicator1.visible = false;
			indicator2.visible = false;
			indicator3.visible = false;
			
			indicator1display = 0;
			indicator2display = 0;
			indicator3display = 0;
			
			indicator1pressed = 0;
			indicator2pressed = 0;
			indicator3pressed = 0;	
			
			waveInt = 10;
			amplitude = 100;
			drawWave();
			
			indicator1.addEventListener(MouseEvent.CLICK, indicator1clicked);
			indicator2.addEventListener(MouseEvent.CLICK, indicator2clicked);
			indicator3.addEventListener(MouseEvent.CLICK, indicator3clicked);
			
			bottle1 = new CachedSprite(images.BOTTLE);
			bottle2 = new CachedSprite(images.BOTTLE);
			bottle3 = new CachedSprite(images.BOTTLE);
			bottle4 = new CachedSprite(images.BOTTLE);
			bottle5 = new CachedSprite(images.BOTTLE);
			
			addChild(bottle1);
			addChild(bottle2);
			addChild(bottle3);
			addChild(bottle4);
			addChild(bottle5);
			
			bottle1.y = 1196;
			bottle2.y = 1196;
			bottle3.y = 1196;
			bottle4.y = 1196;
			bottle5.y = 1196;
			bottle1.x = 146;
			bottle2.x = 236;
			bottle3.x = 328;
			bottle4.x = 418;
			bottle5.x = 508;
			
			bottles = [];
			bottles[0] = bottle1;
			bottles[1] = bottle2;
			bottles[2] = bottle3;
			bottles[3] = bottle4;
			bottles[4] = bottle5;
			
			bottle1.visible = false;
			bottle2.visible = false;
			bottle3.visible = false;
			bottle4.visible = false;
			bottle5.visible = false;
		}
		
		private function showBottle():void
		{
			if (winCounter == 0)
			{
				bottle1.visible = false;
				bottle2.visible = false;
				bottle3.visible = false;
				bottle4.visible = false;
				bottle5.visible = false;
			}
			else if (winCounter == 1)
			{				
				bottle1.visible = true;
				bottle2.visible = false;
				bottle3.visible = false;
				bottle4.visible = false;
				bottle5.visible = false;
			}
			else if (winCounter == 2)
			{				
				bottle1.visible = true;
				bottle2.visible = true;
				bottle3.visible = false;
				bottle4.visible = false;
				bottle5.visible = false;
			}
			else if (winCounter == 3)
			{				
				bottle1.visible = true;
				bottle2.visible = true;
				bottle3.visible = true;
				bottle4.visible = false;
				bottle5.visible = false;
			}
			else if (winCounter == 4)
			{				
				bottle1.visible = true;
				bottle2.visible = true;
				bottle3.visible = true;
				bottle4.visible = true;
				bottle5.visible = false;
			}
			else if (winCounter == 5)
			{				
				bottle1.visible = true;
				bottle2.visible = true;
				bottle3.visible = true;
				bottle4.visible = true;
				bottle5.visible = true;
			}
		}
		
		private function score(time:Number):void
		{
			if (time < 600)
			{
				winCounter++;
				if (winCounter > 5)
				{
					winCounter = 5;
				}
			}
			else if (600 > time ? false : ( 1000 < time ? false : true ))
			{
				
			}
			else if (time > 1000)
			{
				winCounter--;
				if (winCounter < 0)
				{
					winCounter = 0;
				}
			}
			
			showBottle();
		}
		
		private function indicator1clicked(e:MouseEvent):void
		{
			indicator1pressed = (new Date().getTime()) - indicator1display;
			indicator1.visible = false;
			score(indicator1pressed);
		}
		
		private function indicator2clicked(e:MouseEvent):void
		{
			indicator2pressed = (new Date().getTime()) - indicator2display;
			indicator2.visible = false;
			score(indicator1pressed);
		}
		
		private function indicator3clicked(e:MouseEvent):void
		{
			indicator3pressed = (new Date().getTime()) - indicator3display;	
			indicator3.visible = false;
			score(indicator1pressed);	
		}
		
		private function animWave(e:Event):void
		{					
			var ang:Number = 2 * Math.PI * 3 * waveInt / Main.theStage.stageWidth;
			var ypoint:Number = amplitude * Math.sin(ang)
			var peakPoint:Number = 100 * Math.sin(ang);
			
			if (waveInt < 220 || waveInt > 560)
			{				
				line1.graphics.lineTo(waveInt, 857);
			}
			else
			{
				line1.graphics.lineTo(waveInt, 857 - ypoint);				
			
				if (peakPoint % 100 == 0 && (ypoint > 100|| ypoint < -100))
				{
					if (waveInt == 300)
					{
						indicator1.visible = true;
						indicator1.y = 860 - ypoint -75;
						indicator1display = new Date().getTime();
					}
					if (waveInt == 420)
					{
						indicator2.visible = true;
						indicator2.y = 860 - ypoint -75;
						indicator2display = new Date().getTime();
					}
					if (waveInt == 540)
					{
						indicator3.visible = true;
						indicator3.y = 860 - ypoint -75;
						indicator3display = new Date().getTime();
					}
				}
			}
			
			if (waveInt == (Main.theStage.stageWidth - 10))
			{
				waveInt = 10;
				line1.graphics.clear();				
				line1.graphics.lineStyle(5, 0xff0000);
				line1.graphics.moveTo(10, 857);
				if (indicator1.visible)
				{
					indicator1.visible = false;
					score(1100);
				}
				if (indicator2.visible)
				{
					indicator2.visible = false;
					score(1100);
				}
				if (indicator3.visible)
				{
					indicator3.visible = false;
					score(1100);
				}
			}
			else
			{
				waveInt += 10;
			}
			
			if (-1 > ypoint ? false : ( 1 < ypoint ? false : true ))
			{
				amplitude = (Math.floor(Math.random() * (3 - 1 + 1)) * 100)+100; 
			}
		}		
		
		private function drawWave():void
		{  
			line1.graphics.clear();
			line1.graphics.lineStyle(5, 0xff0000);
			line1.graphics.moveTo(10, 857);		
			
			addEventListener(Event.ENTER_FRAME, animWave);
		}  		
	}

}