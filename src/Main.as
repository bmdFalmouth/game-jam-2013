package 
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author James Simpson
	 */
	public class Main extends Sprite 
	{
		private var text:TextField;
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			text = new TextField();
			text.text = "TEST";
			var format5:TextFormat = new TextFormat("Courier", 1000, 0xFFFFFF, true);
			text.x = 100;
			text.y = 100;
			text.defaultTextFormat = format5;
			
			graphics.lineStyle(10, 0x000000);
			graphics.drawRect(0, 0, stage.width, stage.height);
			
			stage.addChild(text);
			
			// new to AIR? please read *carefully* the readme.txt files!
		}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
		
	}
	
}