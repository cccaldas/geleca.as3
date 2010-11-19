package Geleca.Website.View 
{
	import Geleca.View.View;
	
	public class Page extends View
	{
		public function Page() 
		{
			
		}
		
		public function getPageName():String
		{
			return null;
		}
		
		public function get percentLoaded()		:Number 	{ return 0; }
		public function get isLoaded()			:Boolean 	{ return false; }
	}

}