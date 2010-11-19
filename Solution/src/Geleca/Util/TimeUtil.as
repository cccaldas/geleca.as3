package Geleca.Util
{
	
	public class TimeUtil
	{
		
		public function TimeUtil() 
		{
			
		}
		
		/* 
		 Formata um número de segundos em tempo, exemplo: 90 segundos em 1:30
		*/
		public static function formatTime(seconds:int):String
		{
			var t:int = seconds;
			var s:int = Math.round(t);
			var m:int = 0;
			if (s > 0) {
				while (s > 59) {
					m++;
					s -= 60;
				}
				return String((m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s);
			} else {
				return "00:00";
			}
		}
		
	}
	
}