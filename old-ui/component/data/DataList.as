package simbionte.ui.component.data 
{
	import fl.data.DataProvider;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import simbionte.ui.component.Component;
	import simbionte.events.DataListEvent;
	import simbionte.exceptions.DataListException;
	import simbionte.utils.ContainerUtil;
	import simbionte.utils.DepthUtil;
	import simbionte.utils.Utils;
	
	[Event(name="itemCreated", 		type="simbionte.events.DataListEvent")] 
	[Event(name="bind", 			type="simbionte.events.DataListEvent")] 
	[Event(name="binded", 			type="simbionte.events.DataListEvent")] 
	
	public class DataList extends DataComponent
	{
		private var _itens						:Vector.<ItemTemplate> = new Vector.<ItemTemplate>();
		
		private var _columns					:int = 5;
		private var _itemSpacingX				:int = 3;
		private var _itemSpacingY				:int = 3;
		
		private var _itemTemplateClass			:Class;
		
		public function DataList(itemTemplateClass:Class) 
		{
			_itemTemplateClass 	= itemTemplateClass;
		}
		
		/**Configura o espaçamento do item na horizontal.*/
		public function set itemSpacingX(value:Number):void 
		{
			_itemSpacingX = value;
		}
		
		/**Retorna o espaçamento do item na horizontal.*/
		public function get itemSpacingX():Number { return _itemSpacingX; }
		
		/**Configura o espaçamento do item na vertical.*/
		public function set itemSpacingY(value:Number):void 
		{
			_itemSpacingY = value;
		}
		
		/**Retorna o espaçamento do item na vertical.*/
		public function get itemSpacingY():Number { return _itemSpacingY; }
		
		/**Configura o número de colunas.*/
		public function set columns(value:int):void
		{
			_columns = value;
		}
		
		/**Retorna o número de colunas.*/
		public function get columns():int { return _columns; }
		
		/**Remove todos os itens do container, mantendo-os no dataProvider.*/
		public final function clear():void 
		{
			if (length != 0)
			{
				for (var i:int = 0; i < length; i++) 
				{
					_itens[i].destroy();
				}
				
				_itens 		= new Vector.<ItemTemplate>();
				dataSource 	= null;
			}
			
			ContainerUtil.removeAllChilds(this);
		}
		
		override protected function bind():void 
		{
			dispatchEvent(new DataListEvent(DataListEvent.BIND));
			
			var itemTemplate	:ItemTemplate;
			
			for (var i:int = 0; i < length; i++) 
			{
				itemTemplate 				= new _itemTemplateClass();
				itemTemplate.itemIndex 		= i;
				
				//caso tenha 0 colunas, significa que será repetido infinitamente em horizontal.
				if (columns == 0) 
				{
					itemTemplate.x = (itemTemplate.width + itemSpacingX)  * itemTemplate.itemIndex;
				}
				else 
				{
					itemTemplate.x = (itemTemplate.width + itemSpacingX)  * (itemTemplate.itemIndex % columns)
					itemTemplate.y = (itemTemplate.height + itemSpacingY) * Math.floor(itemTemplate.itemIndex / columns);
				}
				
				this.addChild(itemTemplate);
				
				_itens.push(itemTemplate);
				itemTemplate.initializeComponent();
				itemTemplate.dataSource = dataProvider.getItemAt(i);
				itemTemplate.dataBind();
				
				//dispatchEvent(new DataListEvent(DataListEvent.ITEM_CREATED, itemTemplate));
			}
			
			dispatchEvent(new DataListEvent(DataListEvent.BINDED));
		}
		
		protected function get dataProvider()	:DataProvider 	{ return DataProvider(dataSource); }
		public function get length()			:uint 			{ return dataSource != null ? dataProvider.length : 0; }
		
		public function get itemTemplateClass()	:Class 	{ return _itemTemplateClass; }
		
		public function set itemTemplateClass(value:Class):void 
		{
			_itemTemplateClass = value;
		}		
		
		/**Retorna um item de acordo com o seu índice.*/
		public function getItemAt(index:uint):ItemTemplate
		{
			return _itens[index];
		}
		
		override public function destroy():void 
		{
			_itemTemplateClass 		= null;
			
			clear();
			
			for (var i:int = 0; i < length; i++) 
			{
				_itens[i].destroy();
			}
			
			_itens 		= null;
			
			super.destroy();
		}
		
	}

}