package Website.Shell.View.Page 
{
	import flash.events.Event;
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
		private var _view				:ContactView;
		private var _loader				:ContactLoader;
		
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
		
		override protected function page_load():void 
		{
			super.page_load();
			
			_loader = new ContactLoader();
			_loader.addEventListener(Event.COMPLETE, loader_complete);
			_loader.load();
			
			function loader_complete():void 
			{
				_view = addView(new ContactView()) as ContactView;
				
				_loader.removeEventListener(Event.COMPLETE, loader_complete);
				_view.show(show_complete);
			}
			
			function show_complete():void 
			{
				pageLoadComplete();
			}
		}
		
		override protected function page_unload():void 
		{
			super.page_unload();
			
			_loader.destroy();
			_loader = null;
			
			_view.hide(hide_complete);
			
			function hide_complete():void 
			{
				removeView(_view)
				_view = null;
				pageUnloadComplete();
			}
		}
		
	}

}