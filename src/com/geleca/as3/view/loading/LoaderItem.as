package com.geleca.as3.view.loading
{
	import com.geleca.as3.core.Process;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LoaderItem extends Process
	{
		private var _loader					:ViewLoader;
		
		public function LoaderItem(id:String) 
		{
			this.id = id;
		}
		
		public function get content():* { return result; }
		
		public function get loader():ViewLoader { return _loader; }
		
		public function set loader(value:ViewLoader):void 
		{
			_loader = value;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_loader = null;
		}
		
	}

}