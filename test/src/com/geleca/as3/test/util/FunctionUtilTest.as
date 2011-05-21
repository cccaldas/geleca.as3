package com.geleca.as3.test.util 
{
	import com.geleca.as3.util.FunctionUtil;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FunctionUtilTest
	{
		
		public function run():void 
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