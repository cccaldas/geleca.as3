package com.website.app.controller 
{
	import com.geleca.as3.mvc.core.ActionResult;
	import com.geleca.as3.mvc.core.Controller;
	import com.website.app.model.ContatoModel;
	import com.website.app.model.entity.ContatoEntity;
	import com.website.app.view.ContatoView;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContatoController extends Controller
	{
		
		public function ContatoController() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			view = ContatoView;
		}
		
		public function index():void 
		{
			
		}
		
		public function send():void 
		{			
			viewData["status"] = "error";
		}
		
	}

}