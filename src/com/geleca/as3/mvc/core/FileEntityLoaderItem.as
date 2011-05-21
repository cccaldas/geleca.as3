package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.data.entity.AbstractFileEntity;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.loading.FileLoaderItem;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FileEntityLoaderItem extends AssetLoaderItem
	{
		private var _file						:AbstractFileEntity;
		
		public function FileEntityLoaderItem(file:AbstractFileEntity) 
		{
			_file = file;
			
			//GLog.log(_file.src, _file.data, "isNull", _file.data == null);
			
			super(file.src, file.src);
		}
		
		override protected function process_start():void 
		{
			if (_file.data != null)
			{
				finish();
				return;
			}
			
			//GLog.log("not return", _file.data == null, _file.src);
			
			//GLog.log(_file.src);
			
			super.process_start();
		}
		
		override protected function process_finish():void 
		{
			super.process_finish();
			
			if(this.result != null)
				_file.data = this.result;
			
			//this.result = _file;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_file = null;
		}
		
	}

}