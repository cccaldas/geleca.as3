package Shell.View.Button 
{
	import Asset.PageButtonAsset;
	import Geleca.Component.Button.Button;
	
	public class PageButton extends Button
	{
		
		public function PageButton(asset:PageButtonAsset) 
		{
			super(asset);
		}
		
		override protected function setVariables():void 
		{
			asset.mouseChildren = false;
			
			super.setVariables();
		}
		
		protected function get asset():PageButtonAsset { return PageButtonAsset(_asset); }
		
	}

}