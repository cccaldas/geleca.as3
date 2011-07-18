package com.geleca.as3.collection.parse
{
	import com.geleca.as3.collection.List;

	public class XmlParse
	{
		public static const NAVIGATION_ATTRIBUTES		:String = "NAVIGATION_ATTRIBUTES";
		public static const NAVIGATION_NODES			:String = "NAVIGATION_NODES";
		
		public function XmlParse()
		{
			
		}
		
		public function parse(data:XMLList, factory:Class, map:Object, navigation:String):List
		{
			var list:List = new List();
			
			var length:uint = data.length();
			var item:Object;
			for (var i:int = 0; i < length; i++) 
			{
				item = new factory();
				
				if(navigation == NAVIGATION_ATTRIBUTES)
				{
					for (var key:String in map) 
						item[key] = data[i]["@" + map[key]];
				}
				
				if(navigation == NAVIGATION_NODES)
				{
					
				}
				
				list.add(item);
			}
			
			return list;
		}
	}
}