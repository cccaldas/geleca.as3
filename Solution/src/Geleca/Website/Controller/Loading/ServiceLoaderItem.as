package Geleca.Website.Controller.Loading 
{
	import Geleca.Events.ProcessEvent;
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
			
			addEventListener(ProcessEvent.START, process_start);
		}
		
		private function process_start(e:ProcessEvent):void 
		{
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