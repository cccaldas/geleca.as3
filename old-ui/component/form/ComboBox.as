package simbionte.ui.component.form 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import simbionte.asset.form.combobox.DisplayBackgroundAsset;
	import simbionte.asset.form.combobox.DisplayButtonAsset;
	import simbionte.events.DataListEvent;
	import simbionte.ui.component.button.Button;
	import simbionte.ui.component.Component;
	import simbionte.ui.component.data.DataComponent;
	import simbionte.ui.component.data.DataList;
	import simbionte.ui.component.data.ItemTemplate;
	import simbionte.ui.component.label.Label;
	
	public class ComboBox extends DataComponent
	{
		public static const STATE_OPEN			:String = "STATE_OPEN";
		public static const STATE_CLOSE			:String = "STATE_CLOSE";
		
		protected var displayLabel				:Label;
		protected var displayBackground			:Sprite;
		protected var displayButton				:Button;
		protected var dataList					:DataList;
		
		private var _itemSelected				:ItemTemplate;
		
		private var _width						:Number = 0;
		private var _height						:Number = 0;
		
		public function ComboBox(displayLabel:Label=null, displayBackground:Sprite=null, displayButton:Button=null, itemTemplate:Class=null) 
		{
			this.displayLabel 		= displayLabel;
			this.displayBackground 	= displayBackground;
			this.displayButton 		= displayButton;
			
			if (!displayLabel)
				this.displayLabel = new Label();
			if (!displayBackground)
				this.displayBackground = new DisplayBackgroundAsset();
			if (!displayButton)
			{
				var displayButton	:Button = new Button();
				displayButton.addChild(new DisplayButtonAsset());
				this.displayButton = displayButton;
			}
			if (itemTemplate)
				dataList = new DataList(itemTemplate);
			else
				dataList = new DataList(ComboBoxItemTemplate);
		}
		
		override protected function setAssets():void 
		{
			addChild(displayBackground);
			addChild(displayLabel);
			addChild(displayButton);
			
			addChild(dataList);
			dataList.visible = false;
			dataList.columns = 1;
			dataList.itemSpacingX = dataList.itemSpacingY = 0;
			
			super.setAssets();
		}
		
		override protected function setVariables():void 
		{
			displayLabel.enabled = false;
			
			super.setVariables();
		}
		
		override protected function setListeners():void 
		{
			dataList.addEventListener(DataListEvent.ITEM_CREATED, 		dataList_itemCreated);
			dataList.addEventListener(DataListEvent.BINDED, 			dataList_binded);
			displayBackground.addEventListener(MouseEvent.CLICK, 		display_click);
			displayButton.addEventListener(MouseEvent.CLICK,			display_click);
			
			super.setListeners();
		}
		
		override protected function initialize():void 
		{
			displayLabel.initializeComponent();
			dataList.initializeComponent();
			displayButton.initializeComponent();
			
			if (width == 0)
				width = 120;
			if (height == 0)
				height = 30;
				
			state = STATE_CLOSE;
			
			super.initialize();
		}
		
		protected function align():void 
		{
			displayBackground.width = width;
			displayBackground.height = height;
			displayButton.x = width - displayButton.width - 2;
			dataList.y = displayBackground.y + displayBackground.height;
			
			for (var i:int = 0; i < length; i++) 
			{
				dataList.getItemAt(i).width = width;
			}
		}
		
		override protected function bind():void 
		{
			dataList.clear();
			dataList.dataSource = dataSource;
			dataList.dataBind();
			
			super.bind();
		}
		
		override public function get width():Number { return _width; }
		
		override public function set width(value:Number):void 
		{
			_width = value;
			
			align();
		}
		
		override public function get height():Number { return _height; }
		
		override public function set height(value:Number):void 
		{
			_height = value;
			
			align();
		}
		
		private function selectItem(index:uint):void 
		{
			if (_itemSelected) _itemSelected.enabled = true;
			_itemSelected = dataList.getItemAt(index);
			_itemSelected.enabled = false;
			
			updateLabel(selectedLabel);
		}
		
		protected function updateLabel(label:String):void
		{
			displayLabel.text = label;
		}
		
		private function dataList_itemCreated(e:DataListEvent):void 
		{
			e.item.addEventListener(MouseEvent.CLICK, dataList_itemClick);
		}
		
		private function dataList_binded(e:DataListEvent):void 
		{
			align();
			selectItem(0);
		}
		
		public function get selectedData()		:Object 	{ return _itemSelected.dataSource.data; }
		public function get selectedLabel()		:String 	{ return String(_itemSelected.dataSource.label); }
		public function get selectedIndex()		:int 		{ return _itemSelected.itemIndex; }
		public function get length()			:uint 		{ return dataList.length; }
		
		public function set selectedIndex(value:int):void 
		{
			selectItem(value);
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		private function dataList_itemClick(e:MouseEvent):void 
		{
			selectItem(ItemTemplate(e.currentTarget).itemIndex);
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function open():void
		{
			state = STATE_OPEN;
			dataList.visible = true;
		}
		
		public function close():void 
		{
			state = STATE_CLOSE;
			dataList.visible = false;
		}
		
		private function display_click(e:MouseEvent):void 
		{
			if (length > 0) 
			{
				if (state != STATE_OPEN)
				{
					open();
					e.stopImmediatePropagation();
					stage.addEventListener(MouseEvent.CLICK, stage_click, false, 0, true);
				}
				else
					close();
			}
		}
		
		private function stage_click(e:MouseEvent):void 
		{			
			if (e.currentTarget is Stage) 
			{
				close();
				stage.removeEventListener(MouseEvent.CLICK, stage_click);
			}
		}
		
		override public function destroy():void 
		{
			stage.removeEventListener(MouseEvent.CLICK, stage_click);
			
			displayLabel.destroy();
			displayButton.destroy();
			dataList.destroy();
			
			displayLabel 		= null;
			displayBackground 	= null;
			displayButton 		= null;
			dataList 			= null;
			_itemSelected 		= null;
			
			super.destroy();
		}
		
	}

}