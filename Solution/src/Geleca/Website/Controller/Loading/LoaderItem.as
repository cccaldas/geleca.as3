package Geleca.Website.Controller.Loading 
{
	import Geleca.Core.Process;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LoaderItem extends Process
	{
		
		public function LoaderItem(id:String) 
		{
			this.id = id;
		}
		
		public function get content():* { return result; }
		
	}

}