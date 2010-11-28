package Geleca.View.Loading 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import Geleca.Events.ProcessEvent;
	import Geleca.View.View;
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
			
			addEventListener(ProcessEvent.START, process_start);
		}
		
		private function process_start(e:ProcessEvent):void 
		{
			_view.addEventListener(ProgressEvent.PROGRESS, 	view_progress);
			_view.addEventListener(Event.COMPLETE, 			view_complete);
			
			_view.loadUp();
			
			//trace(this, _view, _view.initialized);
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