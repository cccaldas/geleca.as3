package Geleca.View.Loading 
{
	import flash.events.Event;
	import Geleca.Configuration.FlashConfig;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FlashConfigLoaderItem extends FileLoaderItem
	{
		
		public function FlashConfigLoaderItem(id:String="config", src:String="flash-config.xml") 
		{
			super(id, src);
		}
		
		override protected function process_finish():void 
		{
			this.result = new FlashConfig(XML(this.result));
			
			super.process_finish();
		}
		
	}

}