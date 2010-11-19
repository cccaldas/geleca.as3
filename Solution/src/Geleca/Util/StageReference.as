package Geleca.Util
{
	import flash.display.Stage;
	
	public class StageReference
	{
		private static	var _stage		:Stage;
		
		public function StageReference() 
		{
			
		}
		
		public static function setStage(stage:Stage):void 
		{
			if(_stage != stage) _stage = stage;
		}
		
		public static function getStage():Stage
		{
			return _stage;
		}
		
	}

}