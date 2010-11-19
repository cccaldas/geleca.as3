package simbionte.component.data
{
	import simbionte.component.Component;
	
	[Event(name="itemClick", 			type="simbionte.events.DataListEvent")] 
	
	public class ItemTemplate extends DataComponent
	{
		private var _itemIndex						:int = 0;
		protected var _asset						:Object = null;
		
		public function ItemTemplate() 
		{
			
		}
		
		public function setAsset(asset:Object):void 
		{
			if (_asset === null) _asset = asset;
		}
		
		public function get itemIndex()		:int 		{ return _itemIndex; }
		
		public function set itemIndex(value:int):void 
		{
			_itemIndex = value;
		}
		
	}

}