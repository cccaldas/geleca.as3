package Geleca.Util
{
	import com.adobe.utils.StringUtil;

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