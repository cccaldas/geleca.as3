package com.geleca.as3.util 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class BooleanUtil 
	{
		
		public function BooleanUtil() 
		{
			
		}
		
		public static function parse(value:String):Boolean
		{
			return value == "true";
		}
		
	}

}