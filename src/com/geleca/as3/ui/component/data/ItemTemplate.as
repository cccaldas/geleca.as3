package com.geleca.as3.ui.component.data
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ItemTemplate extends DataView
	{
		private var _itemIndex						:int = 0;
		
		private var _items							:Vector.<ItemTemplate> = new Vector.<ItemTemplate>();
		
		public function ItemTemplate(skin:Class=null) 
		{
			super(skin);
		}
		
		public function get itemIndex()		:int 		{ return _itemIndex; }
		
		public function set itemIndex(value:int):void 
		{
			_itemIndex = value;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_items = null;
		}
		
	}

}