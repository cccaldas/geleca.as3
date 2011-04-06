package com.geleca.as3.loading
{
	import com.geleca.as3.core.Process;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LoaderItem extends Process
	{
		private var _loader					:GLoader;
		private var _cache					:Boolean;
		
		public function LoaderItem(id:String, cache:Boolean=false) 
		{
			this.id 	= id;
			_cache 		= cache;
		}
		
		public function get content():* { return result; }
		
		public function get loader():GLoader { return _loader; }
		
		public function set loader(value:GLoader):void 
		{
			_loader = value;
		}
		
		public function get cache():Boolean { return _cache; }
		
		override protected function process_start():void 
		{
			super.process_start();
		}
		
		override protected function process_finish():void 
		{
			super.process_finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_loader = null;
		}
		
	}

}