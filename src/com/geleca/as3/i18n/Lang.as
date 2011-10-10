package com.geleca.as3.i18n
{
	import com.geleca.as3.debugger.GLog;
	
	import flash.xml.XMLNode;

	public dynamic class Lang
	{
		private var _data	:XML;
		
		public function Lang(data:XML)
		{
			super();
			
			_data = data;
			
			parse();
		}
		
		private function parse():void
		{
			// TODO Auto Generated method stub
			var children:XMLList = _data.children();
			
			for (var i:int = 0; i < children.length(); i++) 
				this[children[i].name()] = children[i];
		}
	}
}