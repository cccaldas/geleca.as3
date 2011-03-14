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
			
			addEventListener(ProcessEvent.START, process_start);
		}
		
		private function process_start(e:ProcessEvent):void 
		{
			_callBack(this);
			//this.finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_callBack = null;
		}
		
	}

}