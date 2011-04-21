package simbionte.ui.component.cursor
{
	import simbionte.ui.component.Component;
	
	public class CustomCursor extends Component
	{		
		public function CustomCursor() 
		{
			
		}
		
		override protected function setVariables():void 
		{
			enabled = false;
			
			super.setVariables();
		}
		
	}

}