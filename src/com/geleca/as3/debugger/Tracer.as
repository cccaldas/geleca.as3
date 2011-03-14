package com.geleca.as3.debugger 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Tracer
	{
		
		public function Tracer() 
		{
			
		}
		
		public static function _trace(...rest):void 
		{
			trace(rest);
		}
		
	}

}