package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author James Simpson
	 */
	public class LevelSelect extends Sprite
	{
		private var back:CachedSprite;
		private var clock:Clock;
		
		private var ecgLevelSelect:CachedSprite;
		private var simonLevelSelect:CachedSprite;
		private var operationLevelSelect:CachedSprite;
		private var verbalLevelSelect:CachedSprite;
		private var puzzleLevelSelect:CachedSprite;
		private var slidingLevelSelect:CachedSprite;
		
		private var padlock1:CachedSprite;
		private var padlock2:CachedSprite;
		private var padlock3:CachedSprite;
		private var padlock4:CachedSprite;
		
		private var isDragging:Boolean;
		private var hasDragged:Boolean;
		
		private var mouseDownTime:Number;
		
		private var clickedFactor:Number;
		
		
		public function LevelSelect() 
		{
			clickedFactor = 100;
			
			padlock1 = new CachedSprite(images.PADLOCK);
			padlock2 = new CachedSprite(images.PADLOCK);
			padlock3 = new CachedSprite(images.PADLOCK);
			padlock4 = new CachedSprite(images.PADLOCK);
			
			createBackground();
			createClock();

			createECGLevelSelect();
			createSimonLevelSelect();
			createOperationLevelSelect();
			createVerbalLevelSelect();
			createPuzzleLevelSelect();
			createSlidingLevelSelect();
		}
		
		private function createBackground():void
		{
			back = new CachedSprite(images.BACK);
			addChild(back);
		}
		
		private function createClock():void
		{
			clock = new Clock();
			clock.y = 218;
			clock.x = 255;
			addChild(clock);
		}
		
		private function showECGGame(e:MouseEvent):void 
		{
			if (!hasDragged)
			{
				clock.stop();
				Main.sm.display("ECG");
			}
		}
		
		private function showSimonGame(e:MouseEvent):void 
		{
			if (!hasDragged)
			{
				clock.stop();
				Main.sm.display("Simon");
			}
		}
		
		private function createECGLevelSelect():void
		{
			ecgLevelSelect = new CachedSprite(images.ECG_LEVEL_SELECT);
			ecgLevelSelect.x = 0;
			ecgLevelSelect.y = 600;
			
			addChild(ecgLevelSelect);
			
			ecgLevelSelect.addEventListener(MouseEvent.CLICK, showECGGame);
			ecgLevelSelect.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			ecgLevelSelect.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			ecgLevelSelect.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function createSimonLevelSelect():void
		{
			simonLevelSelect = new CachedSprite(images.SIMON_LEVEL_SELECT);
			simonLevelSelect.x = ecgLevelSelect.x + 720;
			simonLevelSelect.y = 600;
			
			addChild(simonLevelSelect);
			
			simonLevelSelect.addEventListener(MouseEvent.CLICK, showSimonGame);
			simonLevelSelect.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			simonLevelSelect.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			simonLevelSelect.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function createOperationLevelSelect():void
		{
			operationLevelSelect = new CachedSprite(images.OPERATE_LEVEL_SELECT);
			operationLevelSelect.x = simonLevelSelect.x + 720;
			operationLevelSelect.y = 600;
			
			padlock1.x = (operationLevelSelect.width / 2) - (padlock1.width / 2 );
			padlock1.y =  (operationLevelSelect.height / 2) - (padlock1.height / 2 );
			
			addChild(operationLevelSelect);
			operationLevelSelect.addChild(padlock1);
			
			operationLevelSelect.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			operationLevelSelect.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			operationLevelSelect.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function createVerbalLevelSelect():void
		{
			verbalLevelSelect = new CachedSprite(images.VERBAL_LEVEL_SELECT);
			verbalLevelSelect.x = operationLevelSelect.x + 720;
			verbalLevelSelect.y = 600;
			
			padlock2.x = (verbalLevelSelect.width / 2) - (padlock2.width / 2 );
			padlock2.y =  (verbalLevelSelect.height / 2) - (padlock2.height / 2 );
			
			addChild(verbalLevelSelect);
			verbalLevelSelect.addChild(padlock2);
			
			verbalLevelSelect.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			verbalLevelSelect.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			verbalLevelSelect.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function createPuzzleLevelSelect():void
		{
			puzzleLevelSelect = new CachedSprite(images.PUZZLE_LEVEL_SELECT);
			puzzleLevelSelect.x = verbalLevelSelect.x + 720;
			puzzleLevelSelect.y = 600;
			
			padlock3.x = (puzzleLevelSelect.width / 2) - (padlock3.width / 2 );
			padlock3.y =  (puzzleLevelSelect.height / 2) - (padlock3.height / 2 );
			
			addChild(puzzleLevelSelect);
			puzzleLevelSelect.addChild(padlock3);
			
			puzzleLevelSelect.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			puzzleLevelSelect.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			puzzleLevelSelect.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function createSlidingLevelSelect():void
		{
			slidingLevelSelect = new CachedSprite(images.SLIDING_LEVEL_SELECT);
			slidingLevelSelect.x = puzzleLevelSelect.x + 720;
			slidingLevelSelect.y = 600;
			
			padlock4.x = (slidingLevelSelect.width / 2) - (padlock4.width / 2 );
			padlock4.y =  (slidingLevelSelect.height / 2) - (padlock4.height / 2 );
			
			addChild(slidingLevelSelect);
			slidingLevelSelect.addChild(padlock4);
			
			slidingLevelSelect.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			slidingLevelSelect.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			slidingLevelSelect.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseDown(event:MouseEvent):void 
		{
			hasDragged = false;
			mouseDownTime = getTimer();
			var sprite:Sprite = Sprite(event.target);
			sprite.startDrag(false, new Rectangle( -720, 600, 10000, 0));
			isDragging = true;
		}
		
		private function onMouseUp(event:MouseEvent):void 
		{
			var currentTime:Number = getTimer();
			var diff:Number = currentTime - mouseDownTime;
			if (diff > clickedFactor)
			{
				hasDragged = true;
			}
			
			var sprite:Sprite = Sprite(event.target);
			sprite.stopDrag();
			isDragging = false;
		}
		
		private function onMouseMove(event:MouseEvent):void 
		{
			var object:Object = event.currentTarget;
			if (isDragging)
			{
				if (object == ecgLevelSelect)
				{
					simonLevelSelect.x = ecgLevelSelect.x + 720;
					operationLevelSelect.x = simonLevelSelect.x + 720;
					verbalLevelSelect.x = operationLevelSelect.x + 720;
					puzzleLevelSelect.x = verbalLevelSelect.x + 720;
					slidingLevelSelect.x = puzzleLevelSelect.x + 720;
				}
				else if (object == simonLevelSelect)
				{
					ecgLevelSelect.x = simonLevelSelect.x - 720;

					operationLevelSelect.x = simonLevelSelect.x + 720;
					verbalLevelSelect.x = operationLevelSelect.x + 720;
					puzzleLevelSelect.x = verbalLevelSelect.x + 720;
					slidingLevelSelect.x = puzzleLevelSelect.x + 720;
				}
				else if (object == operationLevelSelect)
				{
					simonLevelSelect.x = operationLevelSelect.x - 720;
					ecgLevelSelect.x = simonLevelSelect.x - 720;

					verbalLevelSelect.x = operationLevelSelect.x + 720;
					puzzleLevelSelect.x = verbalLevelSelect.x + 720;
					slidingLevelSelect.x = puzzleLevelSelect.x + 720;
				}
				else if (object == verbalLevelSelect)
				{
					operationLevelSelect.x = verbalLevelSelect.x - 720;
					simonLevelSelect.x = operationLevelSelect.x - 720;
					ecgLevelSelect.x = simonLevelSelect.x - 720;
					
					puzzleLevelSelect.x = verbalLevelSelect.x + 720;
					slidingLevelSelect.x = puzzleLevelSelect.x + 720;
				}
				else if (object == puzzleLevelSelect)
				{
					verbalLevelSelect.x = puzzleLevelSelect.x - 720;
					operationLevelSelect.x = verbalLevelSelect.x - 720;
					simonLevelSelect.x = operationLevelSelect.x - 720;
					ecgLevelSelect.x = simonLevelSelect.x - 720;
					
					slidingLevelSelect.x = puzzleLevelSelect.x + 720;
				}
				else if (object == slidingLevelSelect)
				{
					puzzleLevelSelect.x = slidingLevelSelect.x - 720;
					verbalLevelSelect.x = puzzleLevelSelect.x - 720;
					operationLevelSelect.x = verbalLevelSelect.x - 720;
					simonLevelSelect.x = operationLevelSelect.x - 720;
					ecgLevelSelect.x = simonLevelSelect.x - 720;
				}
				else 
				{
					var sprite:Sprite = Sprite(event.target);
					sprite.stopDrag();
					isDragging = false;
				}
			}
		}
	}
}