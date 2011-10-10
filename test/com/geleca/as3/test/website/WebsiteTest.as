package com.geleca.as3.test.website 
{
	
	import flash.display.Sprite;
	import com.geleca.as3.test.website.App;
	import com.geleca.as3.test.website.view.AppLoaderView;
	import com.geleca.as3.mvc.core.Router;
	import com.geleca.as3.test.website.view.AppView;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class WebsiteTest
	{
		public function run(container:Sprite):void
		{			
			App.getInstance().startup(container, new AppLoaderView(), new AppView(), new Router(), null, "website/flash.yaml");
		}
		
	}
	
}