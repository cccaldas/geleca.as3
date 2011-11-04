package com.geleca.as3.display
{	
	import flash.display.Loader;
	import com.geleca.as3.events.EventManager;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.system.ApplicationDomain;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	public class SimpleLoader extends SimpleSprite
	{
		private var _loader					:Loader;
		
		private var _progress				:Number = 0;

		public function SimpleLoader()
		{
			super();
			
			setup();
		}
		
		protected function setup():void
		{
			_loader = new Loader();
			
			addChild(_loader);
		}
		
		private function loader_progress(e:ProgressEvent):void
		{
			_progress = _loader.contentLoaderInfo.bytesLoaded / _loader.contentLoaderInfo.bytesTotal;
			
			dispatchEvent(e);			
		}
		
		private function loader_complete(e:Event):void
		{
			_progress = 1;
			
			dispatchEvent(e);
			
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, 	loader_progress);
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, 			loader_complete);
		}
		
		public function get progress():Number { return _progress; }
		
		public function load(url:String, context:Boolean=false):void
		{
			_loader.unload();
			
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, 	loader_progress);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, 			loader_complete);
			
			var _context:LoaderContext;
			
			if(context)
				_context = new LoaderContext(false, ApplicationDomain.currentDomain);
				
			_loader.load(new URLRequest(url), _context);
			dispatchEvent(new Event(Event.INIT));
		}
		
		public function get content():* { return _loader.content; }

	}
}