package com.geleca.as3.util 
{
	import com.adobe.utils.NumberFormatter;
	import com.geleca.as3.debugger.GLog;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DateUtil
	{
		
		public function DateUtil() 
		{
			
		}
		
		public static function toString(date:Date, format:String="mm/dd/yyyy"):String
		{
			//GLog.log(date, "year:", date.fullYear, "month:", date.month, "day:", date.date);
			
			format = format.replace("mm", 		NumberFormatter.addLeadingZero(Number(date.month.toString()) + 1));
			format = format.replace("dd", 		NumberFormatter.addLeadingZero(Number(date.date.toString())));
			format = format.replace("yyyy", 	date.fullYear.toString());
			
			return format;
		}
		
		public static function fromString(date:String, format:String="mm/dd/yyyy"):Date 
		{
			
			
			var day		:Number = Number(String(date.charAt(format.indexOf("d"))) + String(date.charAt(format.indexOf("d") + 1)));
			var month	:Number = Number(String(date.charAt(format.indexOf("m"))) + String(date.charAt(format.indexOf("m") + 1)));
			
			
			
			//day --;
			month --;
			
			var year	:* = (
								String(date.charAt(format.indexOf("y"))) + 
								String(date.charAt(format.indexOf("y") + 1)) + 
								String(date.charAt(format.indexOf("y") + 2)) + 
								String(date.charAt(format.indexOf("y") + 3))
							);
							
			//GLog.log(date, "day:", day, "month", month);
			
			//GLog.log(year, month, day);
			
			return new Date(year, month, day);
		}
		
	}

}