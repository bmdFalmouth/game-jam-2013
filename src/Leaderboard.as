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
		
		var textField1:TextField = new TextField();
		var textField2:TextField = new TextField();
		var textField3:TextField = new TextField();
		var textField4:TextField = new TextField();
		var textField5:TextField = new TextField();
		
		var entry1:LeaderboardEntry = new LeaderboardEntry("Dave", 3000);
		var entry2:LeaderboardEntry = new LeaderboardEntry("Shplem", 300);
		var entry3:LeaderboardEntry = new LeaderboardEntry("Elvis", 200);
		var entry4:LeaderboardEntry = new LeaderboardEntry("Bob", 100);
		var entry5:LeaderboardEntry = new LeaderboardEntry("Drunk Guy", 2);
		
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

				
			addChild(back);	
			addChild(textField1);
			addChild(textField2);
			addChild(textField3);
			addChild(textField4);
			addChild(textField5);
			drawLeaderboard();
		}	
		
		//check score against current leaders
		public function iDied():void {
			
		}
		
		//replaces array entry
		public function addEntry():void {
			
		}
		
		public function drawLeaderboard():void {
			textField1.text = entry1.createString();
			textField1.width = textField1.textWidth;
			textField2.text = entry2.createString();
			textField2.width = textField2.textWidth;
			textField3.text = entry3.createString();
			textField3.width = textField3.textWidth;
			textField4.text = entry4.createString();
			textField4.width = textField4.textWidth;
			textField5.text = entry5.createString();
			textField5.width = textField5.textWidth;	
			
			}
			
			
			
		}
		
	}

	