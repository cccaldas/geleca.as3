package Geleca.Component.Data
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import Geleca.Events.DataListEvent;
	import Geleca.Exception.DataListException;
	import Geleca.Util.ContainerUtil;
	import Geleca.Util.DepthUtil;
	import Geleca.Util.ObjectUtil;
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	[Event(name="itemCreated", 		type="Geleca.Events.DataListEvent")] 
	[Event(name="bind", 			type="Geleca.Events.DataListEvent")] 
	[Event(name="binded", 			type="Geleca.Events.DataListEvent")] 
	
	public class DataList extends DataView
	{
		public static const DIRECTION_HORIZONTAL	:String = "DIRECTION_HORIZONTAL";
		public static const DIRECTION_VERTICAL		:String = "DIRECTION_VERTICAL";
		
		private var _itens							:Vector.<ItemTemplate> = new Vector.<ItemTemplate>();
		
		private var _direction						:String = DIRECTION_HORIZONTAL;
		private var _columns						:int = 5;
		private var _itemSpacingX					:int = 3;
		private var _itemSpacingY					:int = 3;
		
		private var _itemTemplateClass				:Class;
		private var _assetClass						:Class;
		
		public function DataList(container:Sprite, itemTemplateClass:Class) 
		{
			super(container);
			
			_itemTemplateClass = itemTemplateClass;
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			_itemTemplateClass 	= itemTemplateClass;
			if (!_itemTemplateClass)
				_itemTemplateClass = ItemTemplate;
				
			getAssetClass();
		}
		
		public function get container():Sprite { return _asset; }
		
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
			
			ContainerUtil.removeAllChilds(container);
		}
		
		override protected function bind():void 
		{
			dispatchEvent(new DataListEvent(DataListEvent.BIND));
			
			//clear();
			
			var itemTemplate	:ItemTemplate;
			var asset			:Sprite;
			
			for (var i:int = 0; i < length; i++) 
			{
				itemTemplate 				= ItemTemplate(new _itemTemplateClass());
				itemTemplate.itemIndex 		= i;
				asset						= Sprite(new _assetClass());
				
				itemTemplate.setAsset(asset);
				itemTemplate.initializeComponent();
				
				//align
				
				container.addChild(asset);
				
				_itens.push(itemTemplate);
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
			return _itens[index];
		}
		
		private function getAssetClass():void
		{
			if (!_assetClass && container.numChildren != 0)
			{
				_assetClass = ObjectUtil.getClassByObject(container.getChildAt(0));
			}
		}
		
		override public function get width():Number
		{ 
			return super.width;
			
			/*if (!hitArea)
			{
				if(length != 0)
				{
					if (columns != 0)
						return ((getItemAt(0).width * columns) + (itemSpacingX * (columns - 1)));
					else
						return ((getItemAt(0).width * length) + (itemSpacingX * (length - 1)));
				}
				else
					return 0;
			}
			else 
				return super.width;*/
				
				
		}
		
		override public function set width(value:Number):void 
		{
			super.width = value;
		}
		
		public function get direction():String { return _direction; }
		
		public function set direction(value:String):void 
		{
			_direction = value;
		}
		
		override public function destroy():void 
		{
			_itemTemplateClass 		= null;
			_assetClass				= null;
			
			clear();
			
			for (var i:int = 0; i < length; i++) 
			{
				_itens[i].destroy();
			}
			
			_itens 		= null;
			
			ContainerUtil.removeAllChilds(container);
			
			super.destroy();
		}
		
	}

}