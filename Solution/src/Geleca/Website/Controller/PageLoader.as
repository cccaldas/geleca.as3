package Geleca.Website.Controller 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Geleca.Core.ProcessGroup;
	import Geleca.Events.PageLoaderEvent;
	import Geleca.Events.ProcessEvent;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Util.SimpleTimer;
	import Geleca.Website.Controller.Loading.LoaderItem;
	import Geleca.Website.View.Page;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PageLoader extends SimpleEventDispatcher
	{
		private var _timer						:SimpleTimer 	= new SimpleTimer(1);
		private var _percentLoaded				:Number 		= 0;
		private var _page						:Page;
		
		private var _processGroup				:ProcessGroup = new ProcessGroup();
		
		public function PageLoader() 
		{
			setup();
		}
		
		protected function setup():void 
		{
			_timer.addEventListener(TimerEvent.TIMER, 				timer_timer);
			_processGroup.addEventListener(ProcessEvent.PROGRESS, 	processGroup_progress);
			_processGroup.addEventListener(ProcessEvent.FINISH, 	processGroup_finish);
		}
		
		public function getItem(id:String):*
		{
			return LoaderItem(_processGroup.get(id)).content;
		}
		
		private function processGroup_progress(e:ProcessEvent):void 
		{
			updateProgress(_processGroup.progress);
			
			//trace(this, "progress", percentLoaded);
		}
		
		private function processGroup_finish(e:ProcessEvent):void 
		{
			//trace(this, "finish");
			loader_loadComplete();
		}
		
		protected function addLoaderItem(item:LoaderItem):void 
		{
			_processGroup.add(item);
		}
		
		public final function load():void 
		{	
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
			_processGroup.start();
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
			
			//_percentLoaded = 1;
			
			loader_complete();
			
			dispatchEvent(new PageLoaderEvent(PageLoaderEvent.COMPLETE));
		}
		
		public function get percentLoaded():Number { return _processGroup.progress; }
		
		public function get page():Page { return _page; }
		
		public function set page(value:Page):void 
		{
			_page = value;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_percentLoaded = 0;
			
			_processGroup.destroy();
			_processGroup = null;
			
			_timer.destroy();
			_timer = null;
			
			_page = null;
		}
		
	}

}