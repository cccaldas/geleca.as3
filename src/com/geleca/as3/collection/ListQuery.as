package com.geleca.as3.collection 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ListQuery 
	{
		private var _list		:List;
		private var _items		:Array;
		
		public function ListQuery(list:List) 
		{
			_list 	= list;
			_items 	= list.items;
		}
		
		public function where(property:*, compare:String, value:*):ListQuery
		{
			var tmpItems	:Array = [];
			
			for each (var obj:Object in _items) 
			{
				if (propertyCompare(obj[property], compare, value))
					tmpItems.push(obj);
			}
			
			this._items = tmpItems;
			
			return this;
		}
		
		public function orderBy(order:String, property:*=null):ListQuery
		{
			function orderBy_asc(a:Object, b:Object):Number
			{
				if(a[property] <= b[property])
					return -1;
				else 
					return 1;
			}
			
			function orderBy_desc(a:Object, b:Object):Number
			{
				if(a[property] <= b[property])
					return 1;
				else 
					return -1;
			}
			
			function orderBy_random(a:Object, b:Object):Number
			{
				return Math.round(Math.random()*2)-1;
			}
				
			switch (order) 
			{
				case "asc":
					_items.sort(orderBy_asc);
				break;
				
				case "desc":
					_items.sort(orderBy_desc);					
				break;
				
				case "random":
					_items.sort(orderBy_random);
				break;
			}
			
			return this;
		}
		
		private function propertyCompare(value1:*, compare:String, value2:*):Boolean 
		{
			switch (compare) 
			{
				case "=":
					return value1 == value2;
				break;
				
				case "!=":
					return value1 != value2;
				break;
				
				case ">":
					return value1 > value2;
				break;
				
				case ">=":
					return value1 >= value2;
				break;
				
				case "<":
					return value1 < value2;
				break;
				
				case "<=":
					return value1 <= value2;
				break;
				
				case "like":
					return value1.indexOf(value2) != -1;
				break;
			}
			
			return false;
		}
		
		public function get items():Array 
		{
			return _items;
		}
		
		public function first():*
		{
			return _items.length != 0 ? _items[0] : null;
		}
		
		public function firstOrDefault():*
		{
			var obj:* = this.first();
			obj = (obj == null) ? _list.items[0] : obj;
		
			return obj;
		}
		
		public function last():*
		{
			return _items.length != 0 ? _items[_items.length - 1] : null;
		}
		
	}

}