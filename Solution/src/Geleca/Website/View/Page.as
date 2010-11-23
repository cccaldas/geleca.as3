package Geleca.Website.View 
{
	import Geleca.View.View;
	
	public class Page extends View
	{
		private var _pathNames		:Array = [];
		
		public function Page() 
		{
			
		}
		
		public function getPageName():String
		{
			return null;
		}
		
		/**Verificação da URL para exibição da Página.*/
		public function checkRoute(pathNames:Array):Boolean
		{
			return false;
		}
		
		public function navigate():void 
		{
			
		}
		
		public function get percentLoaded()		:Number 	{ return 0; }
		public function get isLoaded()			:Boolean 	{ return false; }
		
		public function get pathNames():Array { return _pathNames; }
		
		public function set pathNames(value:Array):void 
		{
			_pathNames = value;
		}
	}

}