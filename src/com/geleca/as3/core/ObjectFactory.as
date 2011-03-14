package com.geleca.as3.core
{
	import flash.utils.Dictionary;			
	import com.geleca.as3.util.ObjectUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ObjectFactory
	{
		private var _pools:Dictionary = new Dictionary();
		
		private function getPool(type:Class):ObjectFactoryPool
		{
			return type in _pools ? _pools[type] : _pools[type] = new ObjectFactoryPool();
		}
		
		public function create(type:Class, ...parameters):*
		{
			var pool:ObjectFactoryPool = getPool(type);
			var obj:IDisposable;
			
			if(pool.length > 0)
			{
				obj = pool.get();
			}
			else
			{
				obj = construct(type, parameters);
			}
			
			obj.create();
			
			return obj;
		}
		
		public function dispose(object:IDisposable):void
		{
			object.dispose();
			getPool(ObjectUtil.getClassByObject(object)).add(object);
		}
		
		public function setMaxLength(type:Class, max:Number):void 
		{
			getPool(type).maxLength = max;
		}
		
		public function getLength(type:Class):uint 
		{
			return getPool(type).length;
		}
		
		private function construct(type:Class, parameters:Array):*
		{
			switch(parameters.length)
			{
				case 0:
					return new type();
				case 1:
					return new type( parameters[0] );
				case 2:
					return new type( parameters[0], parameters[1] );
				case 3:
					return new type( parameters[0], parameters[1], parameters[2] );
				case 4:
					return new type( parameters[0], parameters[1], parameters[2], parameters[3] );
				case 5:
					return new type( parameters[0], parameters[1], parameters[2], parameters[3], parameters[4] );
				case 6:
					return new type( parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5] );
				case 7:
					return new type( parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6] );
				case 8:
					return new type( parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6], parameters[7] );
				case 9:
					return new type( parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6], parameters[7], parameters[8] );
				case 10:
					return new type( parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6], parameters[7], parameters[8], parameters[9] );
				default:
					return null;
			}
		}
	}
}

class ObjectFactoryPool
{
	private var _objects	:Array = [];
	private var _maxLength	:int = 3;
	
	public function ObjectFactoryPool():void 
	{
		
	}
	
	public function get length():uint { return _objects.length; }
	
	public function get maxLength():int { return _maxLength; }
	
	public function set maxLength(value:int):void 
	{
		_maxLength = value;
		
		limit();
	}
	
	public function get():*
	{
		return _objects.pop();
	}
	
	public function add(obj:*):void 
	{
		_objects.push(obj);
		
		limit();
	}
	
	public function limit():void 
	{
		while (length > maxLength) 
		{
			_objects.pop();
		}
	}
}
