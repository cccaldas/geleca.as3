package com.geleca.as3.loading 
{
	import com.geleca.as3.configuration.FlashConfig;
	import com.geleca.as3.i18n.Lang;
	
	import flash.events.Event;

	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LangLoaderItem extends FileLoaderItem
	{
		
		public function LangLoaderItem(src:String, id:String="lang") 
		{
			super(id, src);
		}
		
		override protected function process_finish():void 
		{
			this.result = new Lang(XML(this.result));
			
			super.process_finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			
		}
		
	}

}