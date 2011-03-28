package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.core.Process;
	import com.geleca.as3.core.ProcessGroup;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.loading.GLoader;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ActionResult extends SimpleEventDispatcher
	{
		private var _view				:Class;
		private var _model				:*;
		
		private var _loader				
		
		public function ActionResult(view:Class, model:*=null)
		{
			_view 		= view;
			_model 		= model;
		}
		
	}

}