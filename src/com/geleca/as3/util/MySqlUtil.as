package com.geleca.as3.util
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MySqlUtil
	{
		
		public function MySqlUtil() 
		{
			
		}
		
		public static function dateToBase(date:Date):String
		{
			return String(date.fullYear.toString() + "-" + String(date.month + 1) + "-" + date.getDate());
		}
		
	}

}