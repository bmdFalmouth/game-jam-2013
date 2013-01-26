package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author James Simpson
	 */
	public class StateManager extends Sprite
	{		
		public var states:Array;
		private var currentState:State;
		private var previousState:State;
		
		public function StateManager() 
		{			
			states = [];
		}
		
		public function defineState(name:String, type:Class):void
		{
			states.push(new State(name, type));
		}
		
		public function display(tempName:String):void
		{	
			if (numChildren > 0)
			{
				previousState = currentState;
				removeChild(previousState.sprite); //TODO: remove previous state from the stage without killing game
			}
			for (var i:int = 0; i < states.length; i++)
			{
				if (states[i].name == tempName)
				{
					currentState = states[i];
					addChild(currentState.sprite);
					break;
				}
			}
		}
		
	}

}

class State
{
	public var name:String;
	public var sprite:*;
	
	public function State(tempName:String, tempClass:Class)
	{
		name = tempName;
		sprite = new tempClass();
	}
}