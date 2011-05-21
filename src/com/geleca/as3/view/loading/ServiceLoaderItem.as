package com.geleca.as3.view.loading 
{
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ServiceLoaderItem extends LoaderItem
	{
		private var _call							:Function;
		
		public function ServiceLoaderItem(id:String, call:Function) 
		{
			super(id);
			
			_call = call;
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
			_call(callBack);
		}
		
		private function callBack(result:*=null):void
		{
			this.result = result;
			
			this.finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_call = null;
		}
		
	}

}