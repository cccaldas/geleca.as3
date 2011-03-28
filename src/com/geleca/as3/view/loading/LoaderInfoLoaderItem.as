package com.geleca.as3.view.loading 
{
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import com.geleca.as3.events.ProcessEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LoaderInfoLoaderItem extends LoaderItem
	{
		private var _loaderInfo						:LoaderInfo;
		
		public function LoaderInfoLoaderItem(loaderInfo:LoaderInfo, id:String="loaderInfo") 
		{
			super(id);
			
			this._loaderInfo = loaderInfo;
			this.id = id;
		}
		
		override protected function process_start():void 
		{
			super.process_start();
			
			_loaderInfo.addEventListener(ProgressEvent.PROGRESS, 	loaderInfo_progress);
			_loaderInfo.addEventListener(Event.COMPLETE, 			loaderInfo_complete);
		}
		
		private function loaderInfo_progress(e:ProgressEvent):void 
		{
			updateProgress(_loaderInfo.bytesLoaded / _loaderInfo.bytesTotal);
		}
		
		private function loaderInfo_complete(e:Event):void 
		{
			_loaderInfo.removeEventListener(ProgressEvent.PROGRESS, 	loaderInfo_progress);
			_loaderInfo.removeEventListener(Event.COMPLETE, 			loaderInfo_complete);
			
			this.result = _loaderInfo;
			this.finish();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_loaderInfo.removeEventListener(ProgressEvent.PROGRESS, 	loaderInfo_progress);
			_loaderInfo.removeEventListener(Event.COMPLETE, 			loaderInfo_complete);
			
			_loaderInfo = null;
		}
		
		
	}

}