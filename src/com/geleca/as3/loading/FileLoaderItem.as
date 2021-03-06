package com.geleca.as3.loading 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FileLoaderItem extends LoaderItem
	{
		private var _loader							:URLLoader = new URLLoader();
		private var _src							:String;
		
		public function FileLoaderItem(id:String, src:String, weight:Number=1) 
		{
			super(id);
			
			_src = src;
			this.weight = weight;
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
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