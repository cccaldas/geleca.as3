package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.core.Process;
	import com.geleca.as3.core.ProcessGroup;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.loading.GLoader;
	import com.geleca.as3.loading.LoaderItem;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ActionResult extends SimpleEventDispatcher
	{
		public var view					:Class;
		public var model				:*;
		private var _loader				:GLoader;
		
		public function ActionResult(view:Class, model:*=null, loadingItems:Array=null)
		{
			super();
			
			this.view 		= view;
			this.model 		= model;
			
			_loader 		= new GLoader();
			
			for each (var item:LoaderItem in loadingItems) 
				_loader.addLoaderItem(item);
		}
		
		public function get loader()	:GLoader 	{ return _loader; }
		
		override public function destroy():void 
		{
			super.destroy();
			
			_loader.destroy();
			
			view 		= null;
			model 		= null;
			_loader 	= null;
		}
		
	}

}