package Geleca.Util
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class NumberUtil
	{
		
		public function NumberUtil() 
		{
			
		}
		
		public static function isNumber(value:*):Boolean 
		{
			if (String(value) == "undefined") 	return false;
			if (String(value).length == 0) 		return false;
			if (isNaN(Number(value))) 			return false;
			
			return true;
		}
		
	}

}