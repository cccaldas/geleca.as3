package com.geleca.as3.mvc.core 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AbstractAppView extends View
	{
		public var viewRender						:ViewSwitcher;
		
		public function AbstractAppView(viewRender:ViewSwitcher=null) 
		{
			if (!viewRender)
				viewRender = new ViewSwitcher();
				
			this.viewRender 	= viewRender;
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addChild(viewRender);
		}
		
	}

}