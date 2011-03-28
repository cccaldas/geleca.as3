package com.geleca.as3.loading 
{
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class CallBackLoaderItem extends LoaderItem
	{
		private var _callBack							:Function;
		
		public function CallBackLoaderItem(callBack:Function, id:String="callback") 
		{
			super(id);
			
			_callBack = callBack;
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
			_callBack(this);
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_callBack = null;
		}
		
	}

}