package Website.Shell.View.Page 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import Geleca.Website.View.Page;
	import Website.Domain.Pages;
	import Website.Pages.Contact.Controller.ContactLoader;
	import Website.Pages.Contact.View.ContactView;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContactPage extends Page
	{		
		public function ContactPage() 
		{
			super(ContactLoader, ContactView);
		}
		
		override public function checkRoute(pathNames:Array):Boolean 
		{
			return pathNames[0] == "contact";
		}
		
		override public function getPageName():String 
		{
			return Pages.CONTACT;
		}
		
	}

}