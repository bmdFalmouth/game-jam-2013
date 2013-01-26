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
		private var line2:Sprite;
		private var line3:Sprite;
		private var line4:Sprite;
		
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
			line2 = new Sprite();
			addChild(line2);
			line3 = new Sprite();
			addChild(line3);
			line4 = new Sprite();
			addChild(line4);
			
			waveInt = 10;
			amplitude = 100;
			drawWave();
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
	}

}