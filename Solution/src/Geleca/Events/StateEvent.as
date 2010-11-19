package Geleca.Events
{
	import flash.events.Event;
	
	public class StateEvent extends Event 
	{
		private static const NAME			:String = "StateEvent";
		public static const CHANGE			:String = NAME + "CHANGE";
		
		private var _oldState				:String;
		private var _newState				:String;
		
		public function StateEvent(type:String, oldState:String, newState:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			_oldState = oldState;
			_newState = newState;
			
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new StateEvent(type, oldState, newState, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("StateEvent", "oldState", "newState", "type", "bubbles", "cancelable", "eventPhase");
		}
		
		public function get newState()	:String { return _newState; }
		public function get oldState()	:String { return _oldState; }
		
	}
	
}