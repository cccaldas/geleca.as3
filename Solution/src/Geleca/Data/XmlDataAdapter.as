package Geleca.Data 
{
	/**
	 * ...
	 * @author 
	 */
	public class XmlDataAdapter extends DataAdapter
	{
		public static const NAVIGATION_ATTRIBUTES		:String = "NAVIGATION_ATTRIBUTES";
		public static const NAVIGATION_NODES			:String = "NAVIGATION_NODES";
		
		private var _list								:XMLList;
		private var _navigation							:String;
		private var _data								:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
		
		/**
		 * 
		 * @param	list Exemplo: xml.client.client
		 * @param	navigation Tipo de Navegação: Attributes ou Nodes
		 */
		public function XmlDataAdapter(list:XMLList, navigation:String) 
		{
			_list		= list;
			_navigation = navigation;
			
			parse();
		}
		
		private function parse():void 
		{
			var length:uint = _list.length();
			
			for (var i:int = 0; i < length; i++) 
			{
				_data.push(convertNode(_list[i]));
			}
		}
		
		private function convertNode(node:XML):Vector.<String> 
		{
			var data	:Vector.<String> = new Vector.<String>();
			var length	:uint;
			var i		:int;
			
			switch (_navigation) 
			{
				case NAVIGATION_ATTRIBUTES:
					length = uint(node.attributes().length());
					for (i = 0; i < length; i++) 
					{
						data.push(node.attributes()[i]);
					}
				break;
				
				case NAVIGATION_NODES:
					length = uint(node.children().length());
					for (i = 0; i < length; i++) 
					{
						data.push(node.children()[i]);
					}
				break;
			}
			
			return data;
		}
		
		override public function getData():Vector.<Vector.<String>> 
		{
			return _data;
		}
		
	}

}