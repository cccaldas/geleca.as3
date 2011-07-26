package com.geleca.as3.ui.component.data
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class UIItemTemplate extends UIDataView
	{
		private var _itemIndex						:int = 0;
		
		private var _items							:Vector.<UIItemTemplate> = new Vector.<UIItemTemplate>();
		
		public function UIItemTemplate(skin:Class=null) 
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