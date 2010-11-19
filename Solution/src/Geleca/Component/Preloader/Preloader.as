package Geleca.Component.Preloader
{
	import flash.display.Sprite;
	import Geleca.Component.Component;
	
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