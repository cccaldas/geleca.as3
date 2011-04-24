package com.geleca.as3.util 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ArrayUtil
	{
		
		public function ArrayUtil() 
		{
			
		}
		
		public static function castAllItems(array:Array, type:Class):Array
		{
			var length:uint = array.length;
			
			for (var i:int = 0; i < length; i++) 
				array[i] = type(array[i]);
				
			return array;
		}
		
		public static function concatenate(arrays:Array):Array 
		{
			var array	:Array = [];
			var length	:uint = arrays.length;
			
			for (var i:int = 0; i < length; i++) 
				array = array.concat(arrays[i]);
			
			return array;
		}
		
	}

}