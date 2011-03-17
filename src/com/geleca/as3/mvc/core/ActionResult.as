package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.core.Process;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ActionResult extends Process 
	{
		private var _view				:Class;
		private var _viewModel			:ViewModel;
		
		public function ActionResult(view:Class, viewModel:ViewModel=null)
		{
			_view 		= view;
			_viewModel 	= viewModel;
		}
		
	}

}