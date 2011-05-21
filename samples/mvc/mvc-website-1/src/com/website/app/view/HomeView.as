package com.website.app.view 
{
	import com.geleca.as3.mvc.core.View;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class HomeView extends View
	{
		
		public function HomeView() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			var txt:TextField = new TextField();
			txt.text = "HOME";
			addChild(txt);
		}
		
	}

}