package com.geleca.as3.util
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class VectorUtil
	{
		
		public static function vectorToArray(vec:*):Array
		{
			var length:uint = vec.length;
			var array:Array = [];
			
			for (var i:int = 0; i < length; i++) 
			{
				array[i] = vec[i];
			}
			
			return array;
		}
		
	}

}