package Geleca.Util 
{
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TestUtil
	{
		
		public function TestUtil() 
		{
			
		}
		
		public static function calcSpeed(fun:Function):int
		{
			var time:int = getTimer();
			fun();
			
			return getTimer() - time;
		}
		
	}

}