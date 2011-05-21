package com.geleca.as3.events
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DataListEvent extends Event 
	{
		public static const ITEM_CREATED        :String = "itemCreated";
		public static const ITEM_CLICK          :String = "itemClick";
		public static const BIND                :String = "bind";
		public static const BINDED              :String = "binded";
		
		private var _item                       :* = null;
		
		public function DataListEvent(type:String, item:*=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_item = item;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new DataListEvent(type,_item, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("DataListEvent","item", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get item():* { return _item; }
		
	}
	
}