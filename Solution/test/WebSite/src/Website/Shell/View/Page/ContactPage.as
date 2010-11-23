package Website.Shell.View.Page 
{
	import Geleca.Website.View.Page;
	import Website.Domain.Pages;
	import Website.Pages.Contact.View.ContactView;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContactPage extends Page
	{
		private var _view				:ContactView;
		
		public function ContactPage() 
		{
			
		}
		
		override public function checkRoute(pathNames:Array):Boolean 
		{
			return pathNames[0] == "contact";
		}
		
		override public function getPageName():String 
		{
			return Pages.CONTACT;
		}
		
		override public function navigate(pathNames:Array):void 
		{
			super.navigate(pathNames);
			
			
		}
		
		override public function show(onComplete:Function = null):void 
		{
			
		}
		
		override public function hide(onComplete:Function = null):void 
		{
			if (_view)
			{
				
			}
		}
		
	}

}