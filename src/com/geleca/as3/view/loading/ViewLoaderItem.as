package com.geleca.as3.view.loading 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import com.geleca.as3.events.ProcessEvent;
	import com.geleca.as3.view.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ViewLoaderItem extends LoaderItem
	{
		private var _view						:View;
		
		public function ViewLoaderItem(id:String, view:View) 
		{
			super(id);
			
			this.id = id;
			this._view = view;
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
			_view.addEventListener(ProgressEvent.PROGRESS, 	view_progress);
			_view.addEventListener(Event.COMPLETE, 			view_complete);
			
			_view.loadUp();
		}
		
		private function view_progress(e:ProgressEvent):void 
		{
			updateProgress(_view.loader.progress);
		}
		
		private function view_complete(e:Event):void 
		{
			view_progress(null);
			
			_view.removeEventListener(ProgressEvent.PROGRESS, 	view_progress);
			_view.removeEventListener(Event.COMPLETE, 			view_complete);
			
			this.result = _view;
			
			this.finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_view = null;
		}
		
	}

}