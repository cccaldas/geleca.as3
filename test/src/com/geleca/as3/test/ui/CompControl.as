package com.geleca.as3.test.ui 
{
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.ui.component.Component;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class CompControl extends Component
	{
		
		public function CompControl(skin:Class) 
		{
			super(skin);
			hitArea =  new HitArea(200, 50, .5);
			buttonMode = true;
			mouseChildren = false;
		}
		
		override protected function setup():void 
		{
			super.setup();
		}
		
	}

}