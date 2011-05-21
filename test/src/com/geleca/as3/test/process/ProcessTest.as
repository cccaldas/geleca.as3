package com.geleca.as3.test.process 
{
	import com.geleca.as3.core.Process;
	import com.geleca.as3.core.ProcessGroup;
	import com.geleca.as3.core.ProcessManager;
	import com.geleca.as3.events.ProcessEvent;
	import com.geleca.as3.util.FunctionUtil;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProcessTest extends Sprite
	{
		private var _group					:ProcessManager = new ProcessManager();
		
		public function ProcessTest() 
		{
			init();
			
			
		}
		
		private function init():void
		{
			trace(this, _group.create());
			
			/*var process:Process;
			for (var i:int = 0; i < 10; i++) 
			{
				process = _group.create();
				process.addEventListener(ProcessEvent.START, process_start);
				_group.add(process);
			}
			
			
			FunctionUtil.functionDelay(init, 3);*/
			
		}
		
		private function process_start(e:ProcessEvent):void 
		{
			FunctionUtil.functionDelay(function():void {
				trace(e.currentTarget, "finish", Process(e.currentTarget).id, "length", _group.length);
				Process(e.currentTarget).finish();
			}, 1);
		}
		
	}

}