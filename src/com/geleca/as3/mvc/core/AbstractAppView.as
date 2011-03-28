package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.core.Process;
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AbstractAppView extends View
	{
		public var viewRender						:ViewSwitcher;
		
		public function AbstractAppView(viewRender:ViewSwitcher=null) 
		{
			if (!viewRender)
				viewRender = new ViewSwitcher();
				
			this.viewRender 	= viewRender;
		}
		
		public function render(controller:Controller):void 
		{
			result.addEventListener(ProcessEvent.START, 	result_start);
			result.addEventListener(ProcessEvent.PROGRESS, 	result_progress);
			result.addEventListener(ProcessEvent.FINISH, 	result_finish);
		}
		
		private function result_start(e:ProcessEvent):void 
		{
			Process(e.currentTarget).removeEventListener(ProcessEvent.START, 	result_start);
			render_start();
		}
		
		private function result_progress(e:ProcessEvent):void 
		{
			render_progress(Process(e.currentTarget).progress);
		}
		
		private function result_finish(e:ProcessEvent):void 
		{
			Process(e.currentTarget).removeEventListener(ProcessEvent.PROGRESS, 	result_progress);
			Process(e.currentTarget).removeEventListener(ProcessEvent.FINISH, 		result_finish);
			
			render_finish();
		}
		
		protected function render_start():void 
		{
			
		}
		
		protected function render_progress(progress:Number):void 
		{
			
		}
		
		protected function render_finish():void 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addChild(viewRender);
		}
		
	}

}