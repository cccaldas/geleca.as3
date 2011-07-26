package com.geleca.as3.ui.component.video
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.ui.component.UIComponent;
	
	import flash.events.NetStatusEvent;
	import flash.events.StatusEvent;
	import flash.media.SoundTransform;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	public class UIVideoPlayer extends UIComponent
	{
		private var _nc							:NetConnection;
		private var _ns							:NetStream;
		private var _sound						:SoundTransform;
		
		private var _video						:Video;
		private var _url						:String;
		
		private var _volume						:Number = 0;
		
		private var _isBuffering				:Boolean = false;
		
		public function UIVideoPlayer(width:Number, height:Number, skin:Class=null)
		{
			_video = new Video(width, height);
			
			super(skin);
		}
		
		override protected function setup():void
		{
			// TODO Auto Generated method stub
			super.setup();
			
			_nc = new NetConnection();
			_nc.connect(null);
			_ns = new NetStream(_nc);
			
			_sound = new SoundTransform(.5);
			_ns.soundTransform = _sound;
			
			_ns.addEventListener(StatusEvent.STATUS, 		ns_status);
			_ns.addEventListener(NetStatusEvent.NET_STATUS, ns_netStatus);
			
			var client:Object = { };
			client.onMetaData = onMetaData;
			
			_ns.client = client;
			
			addChild(_video);
		}
		
		private function ns_status(e:StatusEvent):void
		{
			// TODO Auto-generated method stub
			
			//GLog.log(e.code);
			
		}
		
		private function ns_netStatus(e:NetStatusEvent):void
		{
			// TODO Auto-generated method stub
			
			switch(e.info.code)
			{
				case "NetStream.Buffer.Empty":
					buffer_start();
				break;
				
				case "NetStream.Buffer.Full":
					buffer_complete();
				break;
				
				case "NetStream.Buffer.Flush":
					//
				break;
			}
		}
		
		protected function buffer_start():void
		{
			GLog.log();
		}
		
		protected function buffer_complete():void
		{
			GLog.log();
		}
		
		protected function onMetaData(data:Object):void
		{
			
		}
		
		public function mute():void
		{
			_volume = _sound.volume;
			this.volume = 0;
		}
		
		public function unmute():void
		{
			this.volume = _volume;
		}
		
		public function play():void
		{
			_ns.resume();
		}
		
		public function pause():void
		{
			_ns.pause();
		}
		
		private function stop():void
		{
			pause();
			_ns.seek(0);
		}
		
		public function isBuffering():Boolean
		{
			return _isBuffering;
		}

		public function get url():String
		{
			return _url;
		}

		public function set url(value:String):void
		{
			_url = value;
			
			_video.attachNetStream(_ns);
			_ns.play(value);
			
			play();
		}

		public function get volume():Number
		{
			return _sound.volume;
		}

		public function set volume(value:Number):void
		{
			_sound.volume = value;
			volumeUpdated();
		}
		
		protected function volumeUpdated():void
		{
			
		}
		
		public function get seek():Number { return _ns.time; }
		
		public function get percentLoaded():Number { return _ns.bytesLoaded / _ns.bytesTotal; }

	}
}