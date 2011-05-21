package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.loading.GLoader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ViewModel extends SimpleEventDispatcher
	{
		public var app							:MVCApp;
		private var _loader						:GLoader;
		
		public function ViewModel(app:MVCApp)
		{
			this.app = app;
		}
		
		public function load():void 
		{
			_loader.addEventListener(ProgressEvent.PROGRESS, 	loader_progressEvent);
			_loader.addEventListener(Event.COMPLETE, 			loader_complete);
			
			_loader.load();
		}
		
		private function loader_progressEvent(e:ProgressEvent):void 
		{
			loader_progress();
		}
		
		private function loader_complete(e:Event):void 
		{
			_loader.removeEventListener(Event.COMPLETE, loader_complete);
			load_complete();
		}
		
		protected function loader_progress():void 
		{
			
		}
		
		protected function load_complete():void 
		{
			
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_loader.destroy();
			
			app 	= null;
			_loader = null;
		}
		
	}

}