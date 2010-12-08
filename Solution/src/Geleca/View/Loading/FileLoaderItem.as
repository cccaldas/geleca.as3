package Geleca.View.Loading 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import Geleca.Events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FileLoaderItem extends LoaderItem
	{
		private var _loader							:URLLoader = new URLLoader();
		private var _src							:String;
		
		public function FileLoaderItem(id:String, src:String) 
		{
			super(id);
			
			_src = src;
			
			addEventListener(ProcessEvent.START, process_start);
		}
		
		protected function process_start(e:ProcessEvent):void 
		{
			_loader.addEventListener(ProgressEvent.PROGRESS, 	loader_progress);
			_loader.addEventListener(Event.COMPLETE, 			loader_complete);
			
			_loader.load(new URLRequest(_src));
		}
		
		protected function loader_progress(e:ProgressEvent):void 
		{
			updateProgress(e.bytesLoaded / e.bytesTotal);
		}
		
		protected function loader_complete(e:Event):void 
		{
			_loader.removeEventListener(ProgressEvent.PROGRESS, 	loader_progress);
			_loader.removeEventListener(Event.COMPLETE, 			loader_complete);
			
			this.result = _loader.data;
			
			_loader = null;
			
			process_finish();
		}
		
		protected function process_finish():void 
		{
			this.finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			if (_loader)
			{
				_loader.removeEventListener(ProgressEvent.PROGRESS, 	loader_progress);
				_loader.removeEventListener(Event.COMPLETE, 			loader_complete);
			}
			
			_loader = null;
		}
		
	}

}