package 
{
	import com.google.zxing.qrcode.QRCodeReader;
	import flash.desktop.NativeApplication;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Matrix;
	import flash.media.Video;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import flash.media.Camera;
	
	import flash.events.*;
	import flash.utils.Timer;
	import flash.geom.Rectangle;
	
	import com.google.zxing.BarcodeFormat;
	import com.google.zxing.BinaryBitmap;
	import com.google.zxing.BufferedImageLuminanceSource;
	import com.google.zxing.DecodeHintType;
	import com.google.zxing.Result;
	import com.google.zxing.client.result.ParsedResult;
	import com.google.zxing.client.result.ResultParser;
	import com.google.zxing.common.BitMatrix;
	import com.google.zxing.common.ByteMatrix;
	import com.google.zxing.common.GlobalHistogramBinarizer;
	import com.google.zxing.common.flexdatatypes.HashTable;
	import com.google.zxing.qrcode.QRCodeReader;
	import com.google.zxing.qrcode.detector.Detector;
	
	
	/**
	 * ...
	 * @author James Simpson
	 */
	public class Main extends Sprite 
	{
		//private var text:TextField;
		//private var text2:TextField;
		//private var qrReader:QRCodeReader;
		//
		//private var detectionRate:int = 10;
		//
		//private var qrDecodedDataOld:String; 
		//
		//private var markerArea;
		//private var markerAreaRect:Rectangle;
		//
		//private var markerGuide:Sprite;
		//private var refreshTimer:Timer;
		//private var timesCompleted:int = 0;
		//
		//protected var camera:Camera;
        //private var videoDisplay:Video=new Video(360, 360);
        //private var bmd:BitmapData;
        //private var cameraStarted:Boolean = false;
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var game:Game = new Game();
			addChild(game);
			
			// entry point
			//text = new TextField();
			//text.text = "TEST";
			//
			//text2 = new TextField();
			//text2.text = "";
			//
			//var format5:TextFormat = new TextFormat("Courier", 1000, 0xFFFFFF, true);
			//text.x = 100;
			//text.y = 100;
			//
			//text2.x = 100;
			//text2.y = 200;
			//text.defaultTextFormat = format5;
			//addChild(text);
			//addChild(text2);
			//
			//if(Camera.isSupported)
			//{	
				//camera = Camera.getCamera();
				//camera.setMode(300, 300, 25);
				//
				//videoDisplay = new Video(camera.width, camera.height);
				//videoDisplay.attachCamera(camera);
				//
				//videoDisplay.rotation = 90;
				//
				//videoDisplay.x = 600;
				//videoDisplay.y = 300;
				//videoDisplay.scaleX = 2;
				//videoDisplay.scaleY = 2;
				//
				//qrReader = new QRCodeReader;
						//
				//addChild(videoDisplay);
				//
				//refreshTimer = new Timer(1000); 	
				//refreshTimer.addEventListener(TimerEvent.TIMER, refresh);
				//refreshTimer.start();
			//}
			//
			//text.text = "Blah";
		}
		
		//private function refresh( event:Event ):void
		//{	// process webcam image and check for QRcode
			//decodeSnapshot();
		//}
		//
		//public function decodeSnapshot():void
         //{
            //text2.text="checking...";
            //bmd=new BitmapData(300, 300);
            //bmd.draw(videoDisplay, null, null, null, null, true);
            //videoDisplay.cacheAsBitmap=true;
            //videoDisplay.cacheAsBitmapMatrix=new Matrix;
            //decodeBitmapData(bmd, 300, 300);
            //bmd.dispose();
            //bmd=null;
            //System.gc();
         //}
         //
         //public function decodeBitmapData(bmpd:BitmapData, width:int, height:int):void
         //{
            //var lsource:BufferedImageLuminanceSource=new BufferedImageLuminanceSource(bmpd);
            //var bitmap:BinaryBitmap=new BinaryBitmap(new GlobalHistogramBinarizer(lsource));
            //
            //var ht:HashTable=null;
            //ht=this.getAllHints();
            //
            //var res:Result=null;
            //try {
               //res=qrReader.decode(bitmap, ht);
            //}
            //catch (event:Error) {
            //}
            //
            //if (res == null) {
               //videoDisplay.clear();
               //text2.text="nothing decoded";
            //}
            //else {
               //var parsedResult:ParsedResult=ResultParser.parseResult(res);
               //text2.text=parsedResult.getDisplayResult();
               //sv.removeChild(videoDisplay);
               //cameraStarted = false;
               //btn.label = "Start Camera";
			   //text.text = "FOUND";
            //}
         //}
         //
         //public function getAllHints():HashTable
         //{
            //var ht:HashTable=new HashTable;
            //ht.Add(DecodeHintType.POSSIBLE_FORMATS, BarcodeFormat.QR_CODE);
            //return ht;
         //}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
		
	}
	
}