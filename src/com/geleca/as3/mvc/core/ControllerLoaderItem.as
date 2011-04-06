package com.geleca.as3.mvc.core
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.LoaderItem;
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
		private var _result							:ActionResult;
		private var _switcher						:ViewSwitcher;
		
		public function ControllerLoaderItem(id:String, controller:Controller, switcher:ViewSwitcher) 
		{
			super(id);
			
			this.id 			= id;
			this._controller 	= controller;
			this._switcher 		= switcher;
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
			//GLog.log("");
			
			controller_load();
		}
		
		private function controller_load():void 
		{
			_controller.loader.addEventListener(ProgressEvent.PROGRESS, 	controller_progress);
			_controller.loader.addEventListener(Event.COMPLETE, 			controller_complete);
			
			_controller.load();
			
			function controller_progress(e:ProgressEvent):void 
			{
				//20%
				updateProgress(_controller.loader.progress * .3);
			}
			
			function controller_complete(e:Event):void 
			{
				_controller.loader.removeEventListener(ProgressEvent.PROGRESS, 	controller_progress);
				_controller.loader.removeEventListener(Event.COMPLETE, 			controller_complete);
				
				controller_render();
				
				
				//process_progress(1);
				
				/*_controller.removeEventListener(ProgressEvent.PROGRESS, 	controller_progress);
				_controller.removeEventListener(Event.COMPLETE, 			controller_complete);*/
				
				//this.result = _controller;
				
				//this.finish();
			}
		}
		
		private function controller_render():void 
		{
			_result = _controller.render();
			_result.loader.addEventListener(ProgressEvent.PROGRESS,	result_progress);
			_result.loader.addEventListener(Event.COMPLETE, 			result_complete);
			_result.loader.load();
			
			//GLog.log(result.loader.length);
			
			function result_progress(e:ProgressEvent):void 
			{
				updateProgress((_result.loader.progress * .5) + .3);
			}
			
			function result_complete(e:Event):void 
			{
				_result.loader.removeEventListener(ProgressEvent.PROGRESS,	result_progress);
				_result.loader.removeEventListener(Event.COMPLETE, 			result_complete);
				
				controller_view(_result);
			}
		}
		
		private function controller_view(result:ActionResult):void 
		{
			var view:View;
			
			if (_switcher.getCurrent() is result.view)
			{
				view = _switcher.getCurrent();
				view.loader.removeAll();
			}
			else
				view = new result.view();
				
			view.app 	= _controller.app;
			view.model 	= _result.model;
			
			view.loader.addEventListener(ProgressEvent.PROGRESS, 	view_progress);
			view.loader.addEventListener(Event.COMPLETE, 			view_complete);
			view.load();
			
			//GLog.log(view);
			
			function view_progress(e:ProgressEvent):void 
			{
				updateProgress((view.loader.progress * .2) + .8);
			}
			
			function view_complete(e:Event):void 
			{
				view.loader.removeEventListener(ProgressEvent.PROGRESS, 	view_progress);
				view.loader.removeEventListener(Event.COMPLETE, 			view_complete);
				
				//GLog.log("");
				updateProgress(1);
				
				view.viewData = _controller.viewData;
				_switcher.swap(view, swap_complete);
				
				function swap_complete():void 
				{
					view[_controller.action.route.action].call();
					finish();
				}
				//GLog.log("call view action", view, _controller.action.route.action);
				
			}
			
			/*if (app.view.viewRender.getCurrent() is value)
			{
				view = app.view.viewRender.getCurrent();
				view.loader.removeAll();
				_update = true;
			}*/
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_controller.destroy();
			_result.destroy();
			
			_controller = null;
			_result = null;
		}
		
	}

}