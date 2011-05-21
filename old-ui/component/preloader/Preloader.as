package simbionte.ui.component.preloader 
{
	import simbionte.ui.component.Component;
	
	public class Preloader extends Component
	{
		private var _progress						:Number;
		
		public function Preloader() 
		{
			
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