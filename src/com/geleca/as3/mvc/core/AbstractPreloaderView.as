package com.geleca.as3.mvc.core
{
	public class AbstractPreloaderView extends View
	{
		private var _progress					:Number = 0;
		
		public function AbstractPreloaderView()
		{
			
		}

		public function get progress():Number
		{
			return _progress;
		}

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