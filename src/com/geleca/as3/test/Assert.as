package com.geleca.as3.test
{
	import com.geleca.as3.debugger.GLog;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Assert
	{
		private static const PASSED	:String = "[PASSED]";
		private static const FAILED	:String = "[FAILED]";
		
		public function Assert() 
		{
			
		}
		
		public static function assertEquals(val1:*, val2:*):void 
		{
			if (val1 == val2)
				trace(PASSED, val1, "==", val2);
			else
				trace(FAILED, val1, "!=", val2);
		}
		
		public static function assertFalse(val:Boolean):void 
		{
			if (!val)
				trace(PASSED, val, "==", "false");
			else
				trace(FAILED, val, "!=", "false");
		}
		
		public static function assertNotNull(val:*):void 
		{
			if (val)
				trace(PASSED, val, "!=", "null");
			else
				trace(FAILED, val, "==", "null");
		}
		
		public static function assertNull(val:*):void 
		{
			if (val)
				trace(PASSED, val, "!=", "null");
			else
				trace(FAILED, val, "==", "null");
		}
		
	}

}