package com.geleca.as3.net
{
	import com.geleca.as3.debugger.GLog;
	
	import flash.events.Event;
	import flash.net.NetConnection;
	import flash.net.NetStream;

	public class SimpleNetStream extends NetStream
	{
		public var meta			:MetaData;
		
		public function SimpleNetStream(connection:NetConnection, peerID:String="connectToFMS")
		{
			super(connection, peerID);
	
			var client:Object = { };
			client.onMetaData = client_onMetaData;
			
			function client_onMetaData(data:Object):void
			{
				meta = new MetaData(data);
				
				dispatchEvent(new Event(Event.COMPLETE));
				//trace("client_onMetaData", this, meta.duration, bytesLoaded / bytesTotal);
			}
			
			//this.client = client;
			this.client = client;
			
			//trace(this, this.client);
		}
	}
}