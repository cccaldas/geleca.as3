package util 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.util.ArrayUtil;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ArrayUtilTest extends Sprite
	{
		
		public function ArrayUtilTest() 
		{
			concatenate();
		}
		
		private function concatenate():void 
		{
			GLog.log();
			
			var numbers:Array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
			var letters:Array = ["a", "e", "i", "o", "u"];
			
			GLog.log(ArrayUtil.concatenate([letters, numbers]));
		}
		
	}

}