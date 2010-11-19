package simbionte.ui.component.data
{
	import simbionte.ui.component.Component;
	
	[Event(name="itemClick", 			type="simbionte.events.DataListEvent")] 
	
	public class ItemTemplate extends DataComponent
	{
		private var _itemIndex						:int = 0;
		
		public function ItemTemplate() 
		{
			
		}
		
		public function get itemIndex()		:int 		{ return _itemIndex; }
		
		public function set itemIndex(value:int):void 
		{
			_itemIndex = value;
		}
		
	}

}