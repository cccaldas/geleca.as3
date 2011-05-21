package com.geleca.as3.test.util 
{
	import com.adobe.utils.NumberFormatter;
	import com.geleca.as3.util.DateUtil;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DateUtilTest
	{
		public function run():void
		{	
			for (var i:int = 0; i < 10; i++) 
			{
				var d:String = "2009-12-" + NumberFormatter.addLeadingZero(i + 3);
				var date:Date = DateUtil.fromString(d, "yyyy-mm-dd");
				
				trace(d, ">", date, ">", DateUtil.toString(date, "yyyy-mm-dd"));
			}
		}
		
	}

}