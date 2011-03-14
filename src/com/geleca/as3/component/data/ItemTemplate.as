package com.geleca.as3.component.data
{
	import flash.display.Sprite;
	import com.geleca.as3.asset.AssetNav;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ItemTemplate extends DataView
	{
		private var _itemIndex						:int = 0;
		
		private var _itens							:Vector.<ItemTemplate> = new Vector.<ItemTemplate>();
		
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
		
		public function get itens():Vector.<ItemTemplate> { return _itens; }
		
		public function set itens(value:Vector.<ItemTemplate>):void 
		{
			_itens = value;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_itens = null;
		}
		
	}

}