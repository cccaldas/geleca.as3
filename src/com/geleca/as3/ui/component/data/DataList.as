package com.geleca.as3.ui.component.data
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import com.geleca.as3.events.DataListEvent;
	import com.geleca.as3.exception.DataListException;
	import com.geleca.as3.util.ContainerUtil;
	import com.geleca.as3.util.DepthUtil;
	import com.geleca.as3.util.ObjectUtil;
	import com.geleca.as3.view.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	[Event(name="itemCreated", 		type="com.geleca.as3.events.DataListEvent")] 
	[Event(name="bind", 			type="com.geleca.as3.events.DataListEvent")] 
	[Event(name="binded", 			type="com.geleca.as3.events.DataListEvent")] 
	
	public class DataList extends DataView
	{
		public static const DIRECTION_HORIZONTAL	:String = "DIRECTION_HORIZONTAL";
		public static const DIRECTION_VERTICAL		:String = "DIRECTION_VERTICAL";
		
		private var _items							:Vector.<ItemTemplate> = new Vector.<ItemTemplate>();
		
		private var _direction						:String = DIRECTION_HORIZONTAL;
		private var _columns						:int = 5;
		private var _itemSpacingX					:int = 3;
		private var _itemSpacingY					:int = 3;
		
		private var _itemTemplateClass				:Class;
		private var _assetClass						:Class;
		
		public function DataList(itemTemplateClass:Class, skin:Class=null) 
		{
			_itemTemplateClass = itemTemplateClass;
			
			super(skin);
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			_itemTemplateClass 	= itemTemplateClass;
			
			if (!_itemTemplateClass)
				_itemTemplateClass = ItemTemplate;
				
			//getAssetClass();
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
					_items[i].destroy();
					//removeChild(_items[i]);
				}
				
				_items 		= new Vector.<ItemTemplate>();
				dataSource 	= null;
			}
		}
		
		override protected function bind():void 
		{
			dispatchEvent(new DataListEvent(DataListEvent.BIND));
			
			//clear();
			
			var itemTemplate	:ItemTemplate;
			
			for (var i:int = 0; i < length; i++) 
			{
				itemTemplate 				= new _itemTemplateClass();
				itemTemplate.itemIndex 		= i;
				addChild(itemTemplate);
				itemTemplate.initializeComponent();
				
				_items.push(itemTemplate);
				itemTemplate.dataSource = dataSource[i];
				itemTemplate.dataBind();
				
				dispatchEvent(new DataListEvent(DataListEvent.ITEM_CREATED, itemTemplate));
			}
			
			align();
			
			dispatchEvent(new DataListEvent(DataListEvent.BINDED));
		}
		
		public function align():void 
		{
			var itemTemplate	:ItemTemplate;
			
			for (var i:int = 0; i < length; i++) 
			{
				itemTemplate = getItemAt(i);
				
				if (direction == DIRECTION_HORIZONTAL)
					{
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
					}
					else 
					{
						//caso tenha 0 colunas, significa que será repetido infinitamente em horizontal.
						if (columns == 0) 
						{
							itemTemplate.y = (itemTemplate.height + itemSpacingY)  * itemTemplate.itemIndex;
						}
						else 
						{
							itemTemplate.y = (itemTemplate.height + itemSpacingY) * (itemTemplate.itemIndex % columns)
							itemTemplate.x = (itemTemplate.width + itemSpacingX) * Math.floor(itemTemplate.itemIndex / columns);
						}
					}
			}
		}
		
		public function get length()			:uint 			{ return dataSource != null ? dataSource.length : 0; }
		
		public function get itemTemplateClass()	:Class 	{ return _itemTemplateClass; }
		
		public function set itemTemplateClass(value:Class):void 
		{
			_itemTemplateClass = value;
		}		
		
		/**Retorna um item de acordo com o seu índice.*/
		public function getItemAt(index:uint):ItemTemplate
		{
			return _items[index];
		}
		
		public function removeItem(item:ItemTemplate):ItemTemplate
		{
			var index:int = _items.indexOf(item);
			_items.splice(index, 1);
			
			//item.destroy();
			
			return item;
		}
		
		override public function get width():Number
		{ 
			var cols:Number;
			
			if (length == 0)
				return 0;
			
			if (direction == DIRECTION_HORIZONTAL)
			{
				if (columns == 0)
					return ((getItemAt(0).width + itemSpacingX) * length) - itemSpacingX;
				else
				{
					if (length < columns)
						cols = length;
					else
						cols = columns;
						
					return ((getItemAt(0).width + itemSpacingX) * cols) - itemSpacingX;
				}
			}
			else
			{
				if (columns == 0)
					return getItemAt(0).width;
				else	
				{
					cols = Math.ceil(length / columns);
					return ((getItemAt(0).width + itemSpacingX) * cols) - itemSpacingX;
				}
			}					
		}
		
		override public function set width(value:Number):void 
		{
			//super.width = value;
		}
		
		override public function get height():Number
		{ 
			var lines:Number;
			
			if (length == 0)
				return 0;
				
			if (direction == DIRECTION_VERTICAL)
			{
				if (columns == 0)
					return ((getItemAt(0).height + itemSpacingY) * length) - itemSpacingY;
				else 
				{
					if (length < columns)
						lines = length;
					else
						lines = columns;
						
					return ((getItemAt(0).height + itemSpacingY) * lines) - itemSpacingY;
				}
			}
			else 
			{
				if (columns == 0)
					return getItemAt(0).height;
				else	
				{
					lines = Math.ceil(length / columns);
					return ((getItemAt(0).height + itemSpacingY) * lines) - itemSpacingY;
				}
			}
		}
		
		override public function set height(value:Number):void 
		{
			//super.height = value;
		}
		
		public function get direction():String { return _direction; }
		
		public function set direction(value:String):void 
		{
			_direction = value;
		}
		
		public function get items():Vector.<ItemTemplate> { return _items; }
		
		override public function destroy():void 
		{
			_itemTemplateClass 		= null;
			_assetClass				= null;
			
			clear();
			
			for (var i:int = 0; i < length; i++) 
			{
				_items[i].destroy();
			}
			
			_items 		= null;
			
			super.destroy();
		}
		
	}

}