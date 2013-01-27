package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author me
	 */
	public class SimonGame extends Sprite 
	{
		private var bg:CachedSprite;
		
		private var red:CachedSprite;
		private var blue:CachedSprite;
		private var yellow:CachedSprite;
		private var green:CachedSprite;
		
		private var currentLight:Object;
		
		private var buttons:Array = new Array(); 
		private var playOrder:Array = new Array();
		private var repeatOrder:Array = new Array();
		
		private var onTimer:Timer;
		private var offTimer:Timer;
		private var onTime:uint = 500;
		private var offTime:uint = 300;
		
		private var gameMode:String;
		
		private static var GREEN_LIGHT:int = 0;
		private static var YELLOW_LIGHT:int = 1;
		private static var BLUE_LIGHT:int = 2;
		private static var RED_LIGHT:int = 3;
		
		private var winCounter:int;		
		
		private var bottle1:CachedSprite;
		private var bottle2:CachedSprite;
		private var bottle3:CachedSprite;
		private var bottle4:CachedSprite;
		private var bottle5:CachedSprite;
		private var bottles:Array;
		
		private var heartBack:CachedSprite;
		private var heartFront:CachedSprite;
		
		private var heartScale:Number;
		private var heartScaleDir:int;
		
		private var clock:Clock;
		
		public function SimonGame() 
		{
			init();
		}
		
		private function init():void
		{
			heartScale = 1;
			heartScaleDir = 1;
			bg = new CachedSprite(images.SIMON_GAME_BACKGROUND);
			addChild(bg);
			
			createClock();
			
			heartBack = new CachedSprite(images.SIMON_HEART_BACK,true);
			addChild(heartBack);
			heartBack.x = 350;
			heartBack.y = 780;
			
			heartFront = new CachedSprite(images.SIMON_HEART_FRONT,true);
			addChild(heartFront);
			heartFront.x = 350;
			heartFront.y = 790;
			heartFront.mouseEnabled = false;
			
			winCounter = 0;
			
			red = new CachedSprite(images.SIMON_RED,true);
			blue = new CachedSprite(images.SIMON_BLUE,true);
			yellow = new CachedSprite(images.SIMON_YELLOW,true);
			green = new CachedSprite(images.SIMON_GREEN,true);
			
			addChild(red);
			addChild(blue);
			addChild(yellow);
			addChild(green);
			
			addChild(heartFront);
			
			red.x = 455;
			red.y = 870;
			red.alpha = 0.75;
			yellow.x = 450;
			yellow.y = 675;
			yellow.alpha = 0.75;
			blue.x = 260;
			blue.y = 900;
			blue.alpha = 0.75;
			green.x = 215;
			green.y = 720;
			green.alpha = 0.75;
			
			var greenLight:Object = new Object();
			greenLight.sprite = green;
			greenLight.id = 0;
			var yellowLight:Object = new Object();
			yellowLight.sprite = yellow;
			yellowLight.id = 1;
			var blueLight:Object = new Object();
			blueLight.sprite = blue;
			blueLight.id = 2;
			var redLight:Object = new Object();
			redLight.sprite = red;
			redLight.id = 3;
			
			buttons.push(greenLight);
			buttons.push(yellowLight);
			buttons.push(blueLight);
			buttons.push(redLight);
			
			currentLight = null;
			gameMode = "play";
						
			red.addEventListener(MouseEvent.CLICK, clickLight);
			yellow.addEventListener(MouseEvent.CLICK, clickLight);
			blue.addEventListener(MouseEvent.CLICK, clickLight);
			green.addEventListener(MouseEvent.CLICK, clickLight);
			
			onTimer = new Timer(1000, 1);
			onTimer.addEventListener(TimerEvent.TIMER, beginGame);			
			onTimer.start();
			
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
			
			this.addEventListener(Event.ENTER_FRAME, pulse);
		}
		
		private function createClock():void
		{
			clock = new Clock();
			clock.y = 218;
			clock.x = 255;
			addChild(clock);
		}
		
		private function pulse(e:Event):void
		{
			trace("pulse");
			if (heartScale <= 1)
			{
				heartScaleDir = 1;
			}
			else if (heartScale >= 1.05)
			{
				heartScaleDir = -1;
			}
			trace(heartScaleDir);
			heartScale += (heartScaleDir * 0.001);
			trace(heartScale);
			
			heartBack.scaleX = heartScale;
			heartBack.scaleY = heartScale;
			heartFront.scaleX = heartScale;
			heartFront.scaleY = heartScale;
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
		
		private function nextTurn():void
		{			
			onTimer.stop();
			gameMode = "play";
			var r:uint = Math.floor(Math.random() * (4));
			playOrder.push(r);
			
			onTimer = new Timer(onTime, playOrder.length+1);
			onTimer.addEventListener(TimerEvent.TIMER, lightSequence);
			onTimer.start();
		}
		
		private function beginGame(e:TimerEvent):void
		{
			onTimer.stop();
			var r:uint = Math.floor(Math.random() * (4));
			playOrder.push(r);
			r = Math.floor(Math.random() * (4));
			playOrder.push(r);
			r =Math.floor(Math.random() * (4));
			playOrder.push(r);
			
			onTimer = new Timer(onTime, playOrder.length+1);
			onTimer.addEventListener(TimerEvent.TIMER, lightSequence);			
			onTimer.start();
		}
		
		private function lightSequence(event:TimerEvent):void
		{
			var playStep:uint = event.target.currentCount - 1;
			if (playStep < playOrder.length)//if its not the lat time the time runs
			{
				lightOn(playOrder[playStep]);
			}
			else
			{				
				startPlayerRepeat();
			}
		}//end Light Sequence
		
		private function startPlayerRepeat():void
		{
			currentLight = null;
			gameMode = "replay"
			repeatOrder = playOrder.concat();//copy the playOrder Sequence
		}
		
		private function clickLight(event:MouseEvent):void
		{
			if (gameMode != "replay")
			{
				return;
			}
			
			for (var l:int = 0; l < buttons.length; l++)
			{
				if (buttons[l].sprite == event.target)
				{
					currentLight = buttons[l];					
				}
			}
						
				trace("pressed "+currentLight.id);
				trace("should be "+repeatOrder[0]);
			//correct match
			if (currentLight.id == repeatOrder[0])
			{
				
				repeatOrder.shift();
				lightOn(currentLight.id);
				//no more lights to click
				if (repeatOrder.length == 0)
				{
					winCounter++;
					showBottle();
					if (winCounter == 5)
					{
						clock.stop();
						Clock.timerRemaining += 10;
						Main.sm.display("QRS");
					}
					nextTurn();
				}
			}
				
			//incorrect match
			else
			{
				winCounter = 0;
				showBottle();
				playOrder = [];
				onTimer = new Timer(1000, 1);
				onTimer.addEventListener(TimerEvent.TIMER, beginGame);			
				onTimer.start();
			}
		}
		
		private function lightOn(lightNumber:int):void
		{
			currentLight = buttons[lightNumber];
			currentLight.sprite.alpha = 1;
			
			offTimer = new Timer(offTime, 1)//remember to turn it off
			offTimer.addEventListener(TimerEvent.TIMER, lightOff)
			offTimer.start();
		}
		
		private function lightOff(event:TimerEvent):void
		{
			if (currentLight != null)
			{//check to see if a light is on
				currentLight.sprite.alpha = 0.75;
				currentLight = null;
				offTimer.stop();
			}
		}
	}

}