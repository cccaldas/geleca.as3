package Geleca.View.Loading 
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import Geleca.Events.ProcessEvent;
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