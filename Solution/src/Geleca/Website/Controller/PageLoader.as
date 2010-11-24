package Geleca.Website.Controller 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Geleca.Events.PageLoaderEvent;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Util.SimpleTimer;
	import Geleca.Website.View.Page;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PageLoader extends SimpleEventDispatcher
	{
		private var _timer						:SimpleTimer = new SimpleTimer(1);
		private var _percentLoaded				:Number = 0;
		private var _page						:Page;
		
		public function PageLoader() 
		{
			
		}
		
		public final function load():void 
		{
			_timer.addEventListener(TimerEvent.TIMER, timer_timer);
			
			dispatchEvent(new PageLoaderEvent(PageLoaderEvent.LOAD));
			
			loader_load();
			
			_timer.start();
		}
		
		private function timer_timer(e:TimerEvent):void 
		{
			dispatchEvent(new PageLoaderEvent(PageLoaderEvent.PROGRESS));
		}
		
		protected function loader_load():void 
		{
			
		}
		
		protected function loader_complete():void 
		{
			
		}
		
		protected final function updateProgress(percent:Number):void 
		{
			_percentLoaded = percent;
		}
		
		protected final function loader_loadComplete():void 
		{
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER, timer_timer);
			
			_percentLoaded = 1;
			
			dispatchEvent(new PageLoaderEvent(PageLoaderEvent.COMPLETE));
			
			loader_complete();
		}
		
		public function get percentLoaded():Number { return _percentLoaded; }
		
		public function get page():Page { return _page; }
		
		public function set page(value:Page):void 
		{
			_page = value;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_percentLoaded = 0;
			
			_timer.destroy();
			_timer = null;
			
			_page = null;
		}
		
	}

}