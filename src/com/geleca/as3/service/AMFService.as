package com.geleca.as3.service
{
	import flash.events.AsyncErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import com.geleca.as3.events.SimpleEventDispatcher;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AMFService extends SimpleEventDispatcher
	{
		private var _gateway                 :String = null;
		private var _netConnection           :NetConnection = new NetConnection();
		private var _connected               :Boolean = false;
		
		public function AMFService(gateway:String) 
		{
			_gateway  = gateway;
			_netConnection.addEventListener(AsyncErrorEvent.ASYNC_ERROR, 	netConnection_asyncError);
			_netConnection.addEventListener(NetStatusEvent.NET_STATUS, 		netConnection_netStatus);
			_netConnection.addEventListener(IOErrorEvent.IO_ERROR, 			netConnection_ioError);
			connect();
		}
		
		private function netConnection_ioError(e:IOErrorEvent):void 
		{
			dispatchEvent(e);
			trace(this, "netConnection_ioError", e.text);
		}
		
		private function netConnection_netStatus(e:NetStatusEvent):void 
		{
			dispatchEvent(e);
			trace(this, "netConnection_netStatus", e.info);
		}
		
		private function netConnection_asyncError(e:AsyncErrorEvent):void 
		{
			dispatchEvent(e);
			trace(this, "netConnection_asyncError", e.error.message);
		}
		
		public function connect():void 
		{
			netConnection.connect(this.gateway);
			_connected = true;
		}
		
		public function disconnect():void 
		{
			netConnection.close();
			_connected = false;
		}
		
		public function get gateway()		:String				{ return _gateway; }
		public function get netConnection()	:NetConnection 		{ return _netConnection; }
		public function get connected()		:Boolean 			{ return _connected; }
		
		override public function destroy():void 
		{
			disconnect();
			_netConnection = null;
			
			super.destroy();
		}
		
	}

}