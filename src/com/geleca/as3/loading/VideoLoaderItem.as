package com.geleca.as3.loading
{
	import com.geleca.as3.util.SimpleTimer;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.Timer;

	public class VideoLoaderItem extends LoaderItem
	{
		private var _src							:String;
		private var _nc								:NetConnection;
		private	var _ns								:NetStream;

		private var _timer							:SimpleTimer;
		
		public function VideoLoaderItem(id:String, src:String, percent:Number=1)
		{
			super(id);
			
			_src = src;
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
			_nc = new NetConnection();
			_nc.connect(null);
			
			_ns = new NetStream(_nc);
			_ns.bufferTime = 7;
			
			var client:Object = { };
			client.onMetaData = function onMetaData(data:Object):void { 	};
			_ns.client = client;
			
			_timer = new SimpleTimer(50);
			_timer.addEventListener(TimerEvent.TIMER, timer_timer);
			
			_ns.play(_src);
			_ns.pause();
			_ns.seek(0);
			_timer.start();
			
		}
		
		private function timer_timer(e:Event):void
		{
			var progress:Number = _ns.bytesLoaded / _ns.bytesTotal;
			
			updateProgress(progress);
			
			if(progress == 1)
			{
				this.result = _ns;
				_timer.stop();
				_timer.removeEventListener(TimerEvent.TIMER, timer_timer);
				this.finish();
			}
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_timer = null;
		}
	}
}