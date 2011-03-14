package com.geleca.as3.component.preloader
{
	import flash.display.Sprite;
	import com.geleca.as3.component.Component;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Preloader extends Component
	{
		private var _progress						:Number;
		
		public function Preloader(asset:Sprite) 
		{
			super(asset);
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