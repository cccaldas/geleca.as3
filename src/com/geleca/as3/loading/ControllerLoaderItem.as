package com.geleca.as3.loading 
{
	import com.geleca.as3.mvc.core.Controller;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ControllerLoaderItem extends LoaderItem
	{
		private var _controller						:Controller;
		
		public function ControllerLoaderItem(id:String, controller:Controller) 
		{
			super(id);
			
			this.id = id;
			this._controller = controller;
			
			addEventListener(ProcessEvent.START, process_start);
		}
		
		private function process_start(e:ProcessEvent):void 
		{
			_controller.loader.addEventListener(ProgressEvent.PROGRESS, 	controller_progress);
			_controller.loader.addEventListener(Event.COMPLETE, 			controller_complete);
			
			_controller.load();
			
			//trace(this, _view, _view.initialized);
		}
		
		private function controller_progress(e:ProgressEvent):void 
		{
			updateProgress(_controller.loader.progress);
		}
		
		private function controller_complete(e:Event):void 
		{
			controller_progress(null);
			
			_controller.removeEventListener(ProgressEvent.PROGRESS, 	controller_progress);
			_controller.removeEventListener(Event.COMPLETE, 			controller_complete);
			
			this.result = _controller;
			
			this.finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_controller = null;
		}
		
	}

}