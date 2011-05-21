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
		private var _view				:Class;
		private var _model				:*;
		private var _loader				:GLoader;
		
		public function ActionResult(view:Class, model:*=null, loadingItems:Array=null)
		{
			_view 		= view;
			_model 		= model;
			
			_loader 	= new GLoader();
			
			for each (var item:LoaderItem in loadingItems) 
				_loader.addLoaderItem(item);
		}
		
		public function get view()		:Class 		{ return _view; }
		public function get model()		:* 			{ return _model; }
		public function get loader()	:GLoader 	{ return _loader; }
		
		override public function destroy():void 
		{
			super.destroy();
			
			_loader.destroy();
			
			_view 		= null;
			_model 		= null;
			_loader 	= null;
		}
		
	}

}