package com.geleca.as3.util
{
	public class FunctionPool
	{
		private var _pool          :Array = [];
		
		public function FunctionPool() 
		{
			
		}
		
		public function addFunction(func:Function):void 
		{
			_pool.push(func);
		}
		
		public function executeAll():void 
		{
			for (var i:int = 0; i < _pool.length; i++) 
			{
				_pool[i]();
			}
			
			_pool = [];
		}
		
		public function get length():uint { return _pool.length; }
		
	}

}