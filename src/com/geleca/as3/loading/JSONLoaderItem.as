package com.geleca.as3.loading 
{
	import com.geleca.as3.configuration.FlashConfig;
	import com.geleca.as3.i18n.Lang;
	
	import flash.events.Event;
	import dupin.parsers.yaml.YAML;
	
	import com.adobe.serialization.json.JSON;

	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class JSONLoaderItem extends FileLoaderItem
	{
		
		public function JSONLoaderItem(id:String, src:String) 
		{
			super(id, src);
		}
		
		override protected function process_finish():void 
		{
			this.result = JSON.decode(String(this.result));
			
			super.process_finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
		}
		
	}

}