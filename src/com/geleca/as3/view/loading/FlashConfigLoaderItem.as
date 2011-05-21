package com.geleca.as3.view.loading 
{
	import flash.events.Event;
	import com.geleca.as3.configuration.FlashConfig;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FlashConfigLoaderItem extends FileLoaderItem
	{
		private var _onComplete						:Function;
		
		public function FlashConfigLoaderItem(id:String="config", src:String="flash-config.xml", onComplete:Function=null) 
		{
			super(id, src);
			
			_onComplete = onComplete;
		}
		
		override protected function process_finish():void 
		{
			this.result = new FlashConfig(XML(this.result));
			
			if (_onComplete != null)
				_onComplete();
			
			super.process_finish();
		}
		
		public function getConfig():FlashConfig
		{
			return FlashConfig(this.result);
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_onComplete = null;
		}
		
	}

}