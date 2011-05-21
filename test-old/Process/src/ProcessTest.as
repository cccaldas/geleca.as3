package  
{
	import Geleca.Core.Process;
	import Geleca.Events.ProcessEvent;
	import Geleca.Util.FunctionUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProcessTest extends Process
	{
		
		public function ProcessTest() 
		{
			addEventListener(ProcessEvent.START, process_start);
		}
		
		private function process_start(e:ProcessEvent):void 
		{
			FunctionUtil.functionDelay(process_progress, .2);
			FunctionUtil.functionDelay(process_progress, .3);
			FunctionUtil.functionDelay(process_progress, .4);
			
			FunctionUtil.functionDelay(process_finish, .5);
		}
		
		private function process_progress():void 
		{
			updateProgress(progress + .2);
		}
		
		private function process_finish():void 
		{
			trace(this.id, "finish");
			this.finish();
		}
		
	}

}