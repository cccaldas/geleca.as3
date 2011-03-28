package com.geleca.as3.loading
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AssetLoaderItem extends LoaderItem
	{
		private var _loader							:Loader = new Loader();
		private var _src							:String;
		
		public function AssetLoaderItem(id:String, src:String) 
		{
			super(id);
			
			_src = src;	
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, 	loader_progress);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, 			loader_complete);
			
			_loader.load(new URLRequest(_src), new LoaderContext(false, ApplicationDomain.currentDomain));
		}
		
		private function loader_progress(e:ProgressEvent):void 
		{
			updateProgress(e.bytesLoaded / e.bytesTotal);
		}
		
		private function loader_complete(e:Event):void 
		{
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, 	loader_progress);
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, 			loader_complete);
			
			this.result = _loader.content;
			
			_loader = null;
			
			this.finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			if (_loader)
			{
				_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, 	loader_progress);
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, 			loader_complete);
			}
			
			_loader = null;
		}
		
	}

}