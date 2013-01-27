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
		
	}

}