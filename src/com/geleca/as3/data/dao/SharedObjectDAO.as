package com.geleca.as3.data.dao
{
	import flash.net.SharedObject;

	public class SharedObjectDAO
	{
		public function SharedObjectDAO()
		{
			
		}
		
		public function get(name:String):*
		{
			return SharedObject.getLocal(name).data.data;
		}
		
		public function save(name:String, data:*):void
		{
			var so:SharedObject = SharedObject.getLocal(name);
			so.data.data = data;
			so.flush();
		}
	}
}