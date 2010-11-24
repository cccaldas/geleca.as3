package Website.Pages.Contact.View 
{
	import caurina.transitions.Tweener;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	import Geleca.Effects.Transition.FadeTransition;
	import Geleca.View.View;
	import Geleca.Website.View.Page;
	import Geleca.Website.View.PageView;
	
	public class ContactView extends PageView
	{
		private var _asset					:Sprite;
		
		public function ContactView() 
		{
			
		}
		
		override protected function setAssets():void 
		{
			super.setAssets();
			
			var cl:Class = getDefinitionByName("Website.Contact.Asset.ContactAsset") as Class;
			
			_asset = new cl() as Sprite;
			addChild(_asset);
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
			
			FadeTransition.fadeIn(this, 0, 1, .7, onComplete);
		}
		
		override public function hide(onComplete:Function=null):void 
		{
			FadeTransition.fadeOut(this, 0, 0, .7, hide_complete);
			
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