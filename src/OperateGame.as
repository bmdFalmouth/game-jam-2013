package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author me
	 */
	public class OperateGame extends Sprite 
	{
		private var bg:CachedSprite;
		private var gutWings:CachedSprite;
		private var brainWings:CachedSprite;
		private var kidneyWings:CachedSprite;
		private var heartWings:CachedSprite;
		private var boneWings:CachedSprite;
		
		private var guts:CachedSprite;
		private var brain:CachedSprite;
		private var kidney:CachedSprite;
		private var heart:CachedSprite;
		private var bone:CachedSprite;
				
		private var bottle1:CachedSprite;
		private var bottle2:CachedSprite;
		private var bottle3:CachedSprite;
		private var bottle4:CachedSprite;
		private var bottle5:CachedSprite;
		
		private var bottles:Array;
		
		private var winCounter:int;
		
		private var clock:Clock;
		
		public function OperateGame() 
		{
			bg = new CachedSprite(images.OPERATE_GAME_BACKGROUND);
			addChild(bg);			
			
			createClock();
			
			gutWings = new CachedSprite(images.WING_BUTTON, true);
			addChild(gutWings);
			gutWings.x = 465;
			gutWings.y = 530;
			
			brainWings = new CachedSprite(images.WING_BUTTON, true);
			addChild(brainWings);
			brainWings.x = 570;
			brainWings.y = 670;
			
			kidneyWings = new CachedSprite(images.WING_BUTTON, true);
			addChild(kidneyWings);
			kidneyWings.x = 460;
			kidneyWings.y = 820;
			
			heartWings = new CachedSprite(images.WING_BUTTON, true);
			addChild(heartWings);
			heartWings.x = 565;
			heartWings.y = 980;
			
			boneWings = new CachedSprite(images.WING_BUTTON, true);
			addChild(boneWings);
			boneWings.x = 410;
			boneWings.y = 1100;
			
			guts = new CachedSprite(images.OPERATION_GUTS, true);
			brain = new CachedSprite(images.OPERATION_BRAIN, true);
			kidney = new CachedSprite(images.OPERATION_KIDNEY, true);
			heart = new CachedSprite(images.OPERATION_HEART, true);
			bone = new CachedSprite(images.OPERATION_BONE, true);
			
			addChild(guts);
			guts.x = 465;
			guts.y = 525;
			
			addChild(brain);
			brain.x = 570;
			brain.y = 660;
			
			addChild(kidney);
			kidney.x = 460;
			kidney.y = 810;
			
			addChild(heart);
			heart.x = 565;
			heart.y = 975;
			
			addChild(bone);
			bone.x = 410;
			bone.y = 1080;
			
			guts.addEventListener(MouseEvent.MOUSE_DOWN, gutsDrag);
			brain.addEventListener(MouseEvent.MOUSE_DOWN, brainDrag);
			kidney.addEventListener(MouseEvent.MOUSE_DOWN, kidneyDrag);
			heart.addEventListener(MouseEvent.MOUSE_DOWN, heartDrag);
			bone.addEventListener(MouseEvent.MOUSE_DOWN, boneDrag);
			
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
			
			winCounter = 0;
		}		
		
		private function createClock():void
		{
			clock = new Clock();
			clock.y = 218;
			clock.x = 255;
			addChild(clock);
		}
		
		private function gutsDrag(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
			guts.removeEventListener(MouseEvent.MOUSE_DOWN, gutsDrag);
			guts.addEventListener(MouseEvent.MOUSE_UP, gutsStopDrag);
		}
		
		private function gutsStopDrag(e:MouseEvent):void
		{
			guts.stopDrag();
			guts.removeEventListener(MouseEvent.MOUSE_UP, gutsStopDrag);
			if ((179 > guts.x ? false : ( 187 < guts.x ? false : true )) && (826 > guts.y ? false : ( 834 < guts.y ? false : true )))
			{
				guts.x = 183;
				guts.y = 830;
				winCounter++;
				showBottle();	
			}
			else
			{
				guts.x = 465;
				guts.y = 525;
				guts.addEventListener(MouseEvent.MOUSE_DOWN, gutsDrag);
			}
		}
		
		private function brainDrag(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
			brain.removeEventListener(MouseEvent.MOUSE_DOWN, brainDrag);
			brain.addEventListener(MouseEvent.MOUSE_UP, brainStopDrag);
		}
		
		private function brainStopDrag(e:MouseEvent):void
		{
			brain.stopDrag();
			brain.removeEventListener(MouseEvent.MOUSE_UP, gutsStopDrag);
			if ((122 > brain.x ? false : ( 130 < brain.x ? false : true )) && (481 > brain.y ? false : ( 489 < brain.y ? false : true )))
			{
				brain.x = 126;
				brain.y = 485;
				winCounter++;
				showBottle();
			}
			else
			{
				brain.x = 570;
				brain.y = 660;
				brain.addEventListener(MouseEvent.MOUSE_DOWN, gutsDrag);
			}
		}
		
		private function kidneyDrag(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
			kidney.removeEventListener(MouseEvent.MOUSE_DOWN, kidneyDrag);
			kidney.addEventListener(MouseEvent.MOUSE_UP, kidneyStopDrag);
		}
		
		private function kidneyStopDrag(e:MouseEvent):void
		{
			kidney.stopDrag();
			kidney.removeEventListener(MouseEvent.MOUSE_UP, kidneyStopDrag);
			if ((204 > kidney.x ? false : ( 212 < kidney.x ? false : true )) && (751 > kidney.y ? false : ( 759 < kidney.y ? false : true )))
			{
				kidney.x = 208;
				kidney.y = 745;
				winCounter++;
				showBottle();
			}
			else
			{
				kidney.x = 460;
				kidney.y = 810;
				kidney.addEventListener(MouseEvent.MOUSE_DOWN, kidneyDrag);
			}
		}
		
		private function heartDrag(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
			heart.removeEventListener(MouseEvent.MOUSE_DOWN, heartDrag);
			heart.addEventListener(MouseEvent.MOUSE_UP, heartStopDrag);
		}
		
		private function heartStopDrag(e:MouseEvent):void
		{
			heart.stopDrag();
			heart.removeEventListener(MouseEvent.MOUSE_UP, heartStopDrag);
			if ((160 > heart.x ? false : ( 168 < heart.x ? false : true )) && (631 > heart.y ? false : ( 639 < heart.y ? false : true )))
			{
				heart.x = 164;
				heart.y = 635;
				winCounter++;
				showBottle();	
			}
			else
			{
				heart.x = 565;
				heart.y = 975;				
				heart.addEventListener(MouseEvent.MOUSE_DOWN, heartDrag);
			}
		}
		
		private function boneDrag(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
			bone.removeEventListener(MouseEvent.MOUSE_DOWN, boneDrag);
			bone.addEventListener(MouseEvent.MOUSE_UP, boneStopDrag);
		}
		
		private function boneStopDrag(e:MouseEvent):void
		{
			bone.stopDrag();
			bone.removeEventListener(MouseEvent.MOUSE_UP, boneStopDrag);
			if ((115 > bone.x ? false : ( 123 < bone.x ? false : true )) && (1066 > bone.y ? false : ( 1074 < bone.y ? false : true )))
			{				
				bone.x = 119;
				bone.y = 1070;
				winCounter++;
				showBottle();
			}
			else
			{
				bone.x = 410;
				bone.y = 1080;
				bone.addEventListener(MouseEvent.MOUSE_DOWN, boneDrag);
			}
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
				clock.stop();
				Main.sm.display("QRS");
			}
		}
		
	}

}