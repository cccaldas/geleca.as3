package com.geleca.as3.mvc.core
{
	public class AbstractPreloaderView extends MVCView
	{
		private var _progress					:Number = 0;
		
		public function AbstractPreloaderView()
		{
			super();
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