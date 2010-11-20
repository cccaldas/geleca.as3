package Pages.Contact.View 
{
	import Asset.Contact.ContactPageAsset;
	import caurina.transitions.Tweener;
	import Domain.PageNames;
	import Geleca.Website.View.Page;
	
	public class ContactView extends Page
	{
		private var _asset				:ContactPageAsset;
		
		public function ContactView() 
		{
			
		}
		
		override public function checkRoute(pathNames:Array):Boolean 
		{
			return pathNames[0] == "contact";
		}
		
		override public function getPageName():String 
		{
			return PageNames.CONTACT;
		}
		
		override public function show(onComplete:Function=null):void 
		{
			_asset = new ContactPageAsset();
			
			addChild(_asset);
			
			Tweener.addTween(this, { alpha:1, time:1, onComplete:onComplete } );
		}
		
		override public function hide(onComplete:Function=null):void 
		{
			Tweener.addTween(this, { alpha:0, time:1, onComplete:hide_complete } );
			
			function hide_complete():void 
			{
				this.visible = false;
				removeChild(_asset);
				
				_asset = null;
				
				if (onComplete != null)
					onComplete();
			}
		}
		
		
	}

}