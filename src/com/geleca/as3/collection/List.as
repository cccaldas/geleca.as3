package com.geleca.as3.collection 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class List 
	{
		private var _items	:Array = [];
		
		public function List(items:Array=null) 
		{
			if (items)
				_items = items;
		}
		
		public function get items():Array 
		{
			return _items;
		}
		
		public function add(item:Object):void 
		{
			_items.push(item);
		}
		
		public function remove(item:Object):void 
		{
			removeAt(_items.indexOf(item));
		}
		
		public function removeAt(index:int):void 
		{
			_items.splice(index, 1);
		}
		
		public function get length():uint { return _items.length; }
		
		public function where(property:*, compare:String, value:*):ListQuery
		{
			return new ListQuery(this).where(property, compare, value);
		}
		
		public function orderBy(order:String, property:*=null):ListQuery
		{
			return new ListQuery(this).orderBy(order, property);
		}
	}

}