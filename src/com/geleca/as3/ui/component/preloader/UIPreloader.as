package com.geleca.as3.ui.component.preloader
{
	import com.geleca.as3.ui.component.UIComponent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class UIPreloader extends UIComponent
	{
		private var _progress						:Number;
		
		public function UIPreloader(skin:Class=null) 
		{
			super(skin);
		}
		
		public function get progress():Number { return _progress; }
		
		public function set progress(value:Number):void 
		{
			_progress = value;
			
			updateProgress();
		}
		
		protected function updateProgress():void 
		{
			
		}
		
	}

}