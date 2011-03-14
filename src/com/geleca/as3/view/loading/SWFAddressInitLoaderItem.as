package com.geleca.as3.view.loading 
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class SWFAddressInitLoaderItem extends LoaderItem
	{
		
		public function SWFAddressInitLoaderItem(id:String="SWFAddress") 
		{
			super(id);
			
			addEventListener(ProcessEvent.START, process_start);
		}
		
		private function process_start(e:ProcessEvent):void 
		{
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, SWFAddress_change);
		}
		
		private function SWFAddress_change(e:SWFAddressEvent):void 
		{
			SWFAddress.removeEventListener(SWFAddressEvent.CHANGE, SWFAddress_change);
			
			this.finish();
		}
		
	}

}