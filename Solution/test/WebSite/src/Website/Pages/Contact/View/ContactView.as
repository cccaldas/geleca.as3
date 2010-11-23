package Website.Pages.Contact.View 
{
	import Asset.Contact.ContactPageAsset;
	import caurina.transitions.Tweener;
	import Domain.PageNames;
	import Geleca.View.View;
	import Geleca.Website.View.Page;
	
	public class ContactView extends View
	{
		private var _asset				:ContactPageAsset;
		
		public function ContactView() 
		{
			
		}
		
		override protected function setVariables():void 
		{
			super.setVariables();
			
			this.visible = false;
			this.alpha = 0;
		}
		
		override public function show(onComplete:Function=null):void 
		{
			this.visible = true;
			
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