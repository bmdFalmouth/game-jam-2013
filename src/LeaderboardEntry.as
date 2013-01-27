package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class LeaderboardEntry 
	{
		public var name:String;
		public var timeSurvived:int;
		
		public function LeaderboardEntry(player:String, time:int) 
		{
			name = player;
			timeSurvived = time;
		}
		
		public function createString():String
		{
		    var stringTime:String = timeSurvived.toString();
			var finishedString:String = name+" survived " + timeSurvived +" seconds";
			
		return(finishedString);
		}	
	}

}