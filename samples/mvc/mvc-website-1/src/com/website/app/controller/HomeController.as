package com.website.app.controller 
{
	import com.geleca.as3.mvc.core.ActionResult;
	import com.geleca.as3.mvc.core.Controller;
	import com.website.app.view.HomeView;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class HomeController extends Controller
	{
		
		public function HomeController() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			
		}
		
		public function index():ActionResult 
		{
			return new ActionResult(HomeView);
		}
		
	}

}