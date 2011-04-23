package com.geleca.as3.ui.component.preloader
{
	import com.geleca.as3.ui.component.Component;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Preloader extends Component
	{
		private var _progress						:Number;
		
		public function Preloader(skin:Class) 
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