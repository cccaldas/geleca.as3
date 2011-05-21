package com.geleca.as3.util 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DictionaryUtil
	{
		
		public function DictionaryUtil() 
		{
			
		}
		
		public static function clear(dic:Dictionary):void 
		{
			for (var key:String in dic) 
				delete dic[key];
		}
	}

}