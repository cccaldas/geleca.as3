package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.core.Process;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.events.ProcessEvent;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AbstractAppView extends View
	{
		public var viewRender						:ViewSwitcher;
		
		private var _controllerLoader				:ControllerLoaderItem;
		
		public function AbstractAppView(viewRender:ViewSwitcher=null) 
		{
			if (!viewRender)
				viewRender = new ViewSwitcher();
				
			this.viewRender 	= viewRender;
			
			addChild(viewRender);
		}
		
		override public function load():void 
		{
			//GLog.log("");
			
			if (_controllerLoader)
				loader.addLoaderItem(_controllerLoader);
			
			super.load();
		}
		
		override protected function loader_complete():void 
		{
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			loader.removeItem("controller");
		}
		
		public function render(controller:Controller):void 
		{
			//GLog.log(controller, "loaded", loaded);
			
			var item:ControllerLoaderItem = new ControllerLoaderItem("controller", controller, this);
			
			if (loaded)
				renderController(item);
			else 
				_controllerLoader = item;
			/*result.addEventListener(ProcessEvent.START, 	result_start);
			result.addEventListener(ProcessEvent.PROGRESS, 	result_progress);
			result.addEventListener(ProcessEvent.FINISH, 	result_finish);*/
		}
		
		public function showView(view:View, onComplete:Function=null):void 
		{
			viewRender.swap(view, onComplete);
		}
		
		private function renderController(controller:ControllerLoaderItem):void 
		{
			controller.addEventListener(ProcessEvent.START, 		start);
			controller.addEventListener(ProgressEvent.PROGRESS, 	progress);
			controller.addEventListener(ProcessEvent.FINISH, 		finish);
			
			controller.start();
			
			function start(e:ProcessEvent):void 
			{
				render_start();
			}
			
			function progress(e:ProgressEvent):void 
			{
				render_progress(controller.progress);
			}
			
			function finish(e:ProcessEvent):void 
			{
				controller.removeEventListener(ProcessEvent.START, 			start);
				controller.removeEventListener(ProgressEvent.PROGRESS, 		progress);
				controller.removeEventListener(ProcessEvent.FINISH, 		finish);
				
				controller.destroy();
			
				render_finish();
			}
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
		
		override public function show(onComplete:Function = null):void 
		{
			//GLog.log("");
			
			super.show(onComplete);
		}
		
	}

}