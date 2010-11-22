package Website.Loader.Controller 
{
	import Geleca.Events.SimpleEventDispatcher;
	import flash.display.Sprite;
	import Geleca.View.View;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.utils.getDefinitionByName;
	import flash.utils.Timer;
	import Website.Domain.Facade;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ShellLoader extends SimpleEventDispatcher
	{
		private var _facade							:Facade = Facade.getInstance();
		protected var loaderInfo					:LoaderInfo;
		private var _timer							:Timer = new Timer(2);
		private var _percentLoaded					:Number = 0;
		
		public function ShellLoader(loaderInfo:LoaderInfo) 
		{
			this.loaderInfo = loaderInfo;
		}
		
		public function load():void 
		{		
			_timer.addEventListener(TimerEvent.TIMER, 		timer_timer);
			_timer.start();
		}
		
		private function timer_timer(e:TimerEvent):void 
		{
			_percentLoaded = loaderInfo.bytesLoaded / loaderInfo.bytesTotal;
			
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
			
			if (_percentLoaded == 1)
				onComplete();
		}
		
		private function onComplete():void 
		{
			_timer.removeEventListener(TimerEvent.TIMER, timer_timer);
			_timer.stop();
			
			_percentLoaded = 1;
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function getShell():View
		{
			var shell:Class = getDefinitionByName("Website.Shell.View.ShellView") as Class;
			return new shell() as View;
		}
		
		public function get percentLoaded()	:Number { return _percentLoaded; }
		
	}

}