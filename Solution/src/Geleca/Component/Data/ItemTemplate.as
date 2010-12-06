package Geleca.Component.Data
{
	import flash.display.Sprite;
	import Geleca.Asset.AssetNav;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ItemTemplate extends DataView
	{
		private var _itemIndex						:int = 0;
		
		public function ItemTemplate() 
		{
			super(null);
		}
		
		public function setAsset(asset:Sprite):void 
		{
			_asset = asset;
			_nav = new AssetNav(asset);
		}
		
		public function get itemIndex()		:int 		{ return _itemIndex; }
		
		public function set itemIndex(value:int):void 
		{
			_itemIndex = value;
		}
		
	}

}