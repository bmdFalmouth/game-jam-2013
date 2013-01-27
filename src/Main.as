package 
{
	import flash.desktop.NativeApplication;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author James Simpson
	 */
	public class Main extends Sprite 
	{
		[Embed(source="Assets/Fonts/Ringlet.ttf", 
			fontName = "HQR", 
			mimeType = "application/x-font", 
			unicodeRange = 'U+0020-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E',
			fontWeight="normal", 
			fontStyle="normal",  
			advancedAntiAliasing="true", 
			embedAsCFF = "false")]
			
		public var fontface:String;
		
		public static var font:TextFormat;
		public static var lbFont:TextFormat;
		public static var theStage:Stage;
		public static var sm:StateManager;
		
		public static var qrCodeArray:Array;
		
		public function Main():void 
		{	
			font = new TextFormat();
			font.font = "HQR";
			font.color = 0x000000;
			font.size = 100;
			
			lbFont = new TextFormat();
			lbFont.font = "HQR";
			lbFont.color = 0x000000;
			lbFont.size = 35;
			theStage = stage;
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			qrCodeArray = [];
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			sm = new StateManager();
			sm.defineState("MainMenu", MainMenu);
			
			sm.defineState("Intro", Intro);
			sm.defineState("Help", Help);
			sm.defineState("About", About);
			
			sm.defineState("QRS", Scanner);
			
			sm.defineState("Levels", LevelSelect);
			sm.defineState("Leaderboards", Leaderboard);
			
			sm.defineState("ECG", ECG);
			sm.defineState("Operate", OperateGame);
			sm.defineState("Verbal", VerbalGame);
			sm.defineState("Simon", SimonGame);
					
			sm.display("Intro");
			
			addChild(sm);			
		}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
		
		public static function validateQrCode(code:String):Boolean
		{
			var found:Boolean = false;
			for (var i:int = 0; i < qrCodeArray.length; i++ )
			{
				var temp:String = qrCodeArray[i];
				if (temp == code)
				{
					found = true;
					break;
				}
			}
			
			if (found)
			{
				return false;
			}
			else
			{
				qrCodeArray.push(code);
				return true;
			}
		}
		
	}
	
}