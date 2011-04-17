package util 
{
	import com.geleca.as3.util.FunctionUtil;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FunctionUtilTest extends Sprite
	{
		
		public function FunctionUtilTest() 
		{
			FunctionUtil.executeSequential([func1, func2, func3], complete);
			
			function complete():void 
			{
				trace("complete");
			}
		}
		
		private function func1(onComplete:Function):void 
		{
			trace("fun1");
			FunctionUtil.functionDelay(onComplete, 1.5);
		}
		
		private function func2(onComplete:Function):void 
		{
			trace("fun2");
			FunctionUtil.functionDelay(onComplete, 1.5);
		}
		
		private function func3(onComplete:Function):void 
		{
			trace("fun3");
			FunctionUtil.functionDelay(onComplete, 1.5);
		}
	}

}