package com.geleca.as3.events
{
	import flash.events.Event;

	public class EntitySetEvent extends Event
	{
		public static const REMOVE				:String = "REMOVE";
		public static const REMOVED				:String = "REMOVED";
		
		public static const INSERT				:String = "INSERT";
		public static const INSERTED			:String = "INSERTED";
		
		public static const UPDATE				:String = "UPDATE";
		public static const UPDATED				:String = "UPDATED";
		
		private var _data						:*;
		
		public function EntitySetEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_data = data;
			
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new EntitySetEvent(type, _data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("EntitySetEvent", "data", "type", "bubbles", "cancelable", "eventPhase"); 
		}

		public function get data():*
		{
			return _data;
		}

	}
}