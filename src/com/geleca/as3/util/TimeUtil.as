package com.geleca.as3.util
{
	import com.adobe.utils.NumberFormatter;
	import com.geleca.as3.debugger.GLog;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TimeUtil
	{
		
		public function TimeUtil() 
		{
			super();
		}
		
		/* 
		 Formata um número de segundos em tempo, exemplo: 90 segundos em 1:30
		*/
		/*public static function formatTime(seconds:int):String
		{
			var t:int = seconds;
			var s:int = Math.round(t);
			var m:int = 0;
			if (s > 0)
			{
				while (s > 59)
				{
					m++;
					s -= 60;
				}
				trace(t, s, m);
				return String((m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s);
			}
			else
				return "00:00";
		}*/
		
		public static function formatTime(ms:int, format:String="hh:mm:ss.ms"):String
		{
			var date:Date = new Date(ms);
			
			format = format.replace("hh", NumberFormatter.addLeadingZero(date.getUTCHours()));
			format = format.replace("mm", NumberFormatter.addLeadingZero(date.getUTCMinutes()));
			format = format.replace("ss", NumberFormatter.addLeadingZero(date.getUTCSeconds()));
			format = format.replace("ms", NumberFormatter.addLeadingZero(date.getUTCMilliseconds()));
			
			return format;
		}
		
	}
	
}