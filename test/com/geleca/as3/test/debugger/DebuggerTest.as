package com.geleca.as3.test.debugger 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.util.FunctionUtil;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class DebuggerTest extends Sprite
	{
		
		public function DebuggerTest() 
		{
			super();
		}
		
		public function run():void
		{
			GLog.log("test", "run", "test after run");
			
			FunctionUtil.functionDelay(testStatic, 1);
			FunctionUtil.functionDelay(testStatic, 2);
			FunctionUtil.functionDelay(testStatic, 3);
			FunctionUtil.functionDelay(testStatic, 4);
			FunctionUtil.functionDelay(testStatic_2, 5);
			//log("teste", "test3");
			init();
		}
		
		private static function testStatic():void 
		{
			GLog.log("inside static");
		}
		
		private function log(...rest):void 
		{
			for each (var item:* in rest) 
			{
				trace("item", item);
			}
			
			trace(rest);
		}
		
		private function init():void
		{
			GLog.log("teste init");
		}
		
		private function testStatic_2():void
		{
			// TODO Auto Generated method stub
			GLog.log("testStatic_2");
		}
		
	}

}