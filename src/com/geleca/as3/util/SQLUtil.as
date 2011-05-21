package com.geleca.as3.util
{
	import com.adobe.utils.StringUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class SQLUtil
	{
		
		public function SQLUtil() 
		{
			
		}
		
		/**Trata a string de inputação para evitar inject.*/
		public static function str(input:String):String
		{
			input = StringUtil.replace(input, "'", "");
			input = StringUtil.replace(input, "*", "");
			input = StringUtil.replace(input, "=", "");
			
			return input;
		}		
		
	}

}