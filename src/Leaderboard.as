package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ... 
	 * @author ...
	 */
	public class Leaderboard extends Sprite 
	{
		private var back:CachedSprite;
		
		private var textField1:TextField = new TextField();
		private var textField2:TextField = new TextField();
		private var textField3:TextField = new TextField();
		private var textField4:TextField = new TextField();
		private var textField5:TextField = new TextField();
		
		
		private static var entry1:LeaderboardEntry = new LeaderboardEntry("Dave", 3000);
		private static var entry2:LeaderboardEntry = new LeaderboardEntry("Shplem", 447);
		private static var entry3:LeaderboardEntry = new LeaderboardEntry("Elvis", 330);
		private static var entry4:LeaderboardEntry = new LeaderboardEntry("Bob", 301);
		private static var entry5:LeaderboardEntry = new LeaderboardEntry("Drunk Guy", 298);
		private static var row1:Array = [];
		private static var row2:Array = [];
		private static var row3:Array = [];
		private static var row4:Array = [];
		private static var row5:Array = [];
		private static var row6:Array = [];
		
		private var entry1text:String;
		private var entry2text:String;
		private var entry3text:String;
		private var entry4text:String;
		private var entry5text:String;
		
		private static var leaderboardArray:Array = [];
		
		
		public function Leaderboard() 
		{
			back = new CachedSprite(images.LEADERBOARD_SCREEN);
			textField1.x = 165;
			textField1.y = 562;
			textField1.defaultTextFormat = Main.lbFont;
			textField1.embedFonts = true;
			
			textField2.x = 165;
			textField2.y = 672;
			textField2.defaultTextFormat = Main.lbFont;
			textField2.embedFonts = true;
			textField3.x = 165;
			textField3.y = 782;
			textField3.defaultTextFormat = Main.lbFont;
			textField3.embedFonts = true;
			textField4.x = 165;
			textField4.y = 892;
			textField4.defaultTextFormat = Main.lbFont;
			textField4.embedFonts = true;
			textField5.x = 165;
			textField5.y = 1002;
			textField5.defaultTextFormat = Main.lbFont;
			textField5.embedFonts = true;
			
			row1.push(entry1.name);
			row1.push(entry1.timeSurvived);
			
			row2.push(entry2.name);
			row2.push(entry2.timeSurvived);
			
			row3.push(entry3.name);
			row3.push(entry3.timeSurvived);
			
			row4.push(entry4.name);
			row4.push(entry4.timeSurvived);
			
			row5.push(entry5.name);
			row5.push(entry5.timeSurvived);
			
			leaderboardArray.push(row1);	
			leaderboardArray.push(row2);
			leaderboardArray.push(row3);
			leaderboardArray.push(row5);
			leaderboardArray.push(row4);
			
			entry1text = row1[0] + " survived " + row1[1] + " seconds";
			entry2text = row2[0] + " survived " + row2[1] + " seconds";
			entry3text = row3[0] + " survived " + row3[1] + " seconds";
			entry4text = row4[0] + " survived " + row4[1] + " seconds";
			entry5text = row5[0] + " survived " + row5[1] + " seconds";
			
			
			textField1.text = entry1text;
			textField1.width = textField1.textWidth;
			
			addChild(back);	
			addChild(textField1);
			addChild(textField2);
			addChild(textField3);
			addChild(textField4);
			addChild(textField5);
			var passedEntry:LeaderboardEntry = new LeaderboardEntry("test", 9001);
			iDied(passedEntry);
		}	
		
		//check score against current leaders
		public function iDied(entry:LeaderboardEntry):void {
			var newEntry:LeaderboardEntry = new LeaderboardEntry(entry.name,entry.timeSurvived);
			row6.push(newEntry.name);
			row6.push(newEntry.timeSurvived);
			leaderboardArray.push(row6);
			leaderboardArray.sortOn(["1", Array.NUMERIC]);
			leaderboardArray.reverse();
			
			
			
			drawLeaderboard();
		}
		
		
		public function drawLeaderboard():void {	
			

			textField1.text = entry1text;
			textField1.width = textField1.textWidth;
			textField2.text = entry2text;
			textField2.width = textField1.textWidth;
			textField3.text = entry3text;
			textField3.width = textField3.textWidth; 
			textField4.text = entry4text;
			textField4.width = textField4.textWidth;
			textField5.text = entry5text;
			textField5.width = textField5.textWidth;
			}
			
			
		}
		
	}

	