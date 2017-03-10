package com.geleca.as3.util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.system.System;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContainerUtil 
	{
		
		public function ContainerUtil() 
		{
			super();
		}
		
		public static function removeAllChilds(container:DisplayObjectContainer, recursive:Boolean=false):void 
		{
			//trace("ContainerUtil::removeAllChilds()", container, recursive, container.numChildren);
			var length:uint = container.numChildren;
			var child:DisplayObject;
			
			for (var i:int = 0; i < length; i++)
			{
				child = container.getChildAt(0);
				
				if(child is DisplayObjectContainer && recursive)
					removeAllChilds(DisplayObjectContainer(child), true);
					
				if(child)
					container.removeChild(child);
			}
				
			System.gc();			
		}
		
		public static function findChild(container:DisplayObjectContainer, path:String="insidecontainer.sprite.sp_object"):DisplayObject
		{
			var tmpArray :Array = path.split(".");
			var _return  :DisplayObject = null;
			
			for (var i:int = 0; i < (tmpArray.length - 1); i++) 
			{
				container = DisplayObjectContainer(container.getChildByName(tmpArray[i]));
			}
			
			if (container != null)
			{
				_return = container.getChildByName(tmpArray[tmpArray.length - 1]);
			}
			
			return _return;
		}
		
		public static function getAllChilds(container:DisplayObjectContainer):Array
		{
			var array:Array = [];
			
			for (var i:int = 0; i < container.numChildren; i++) 
			{
				array.push(container.getChildAt(i));
			}
			
			return array;
		}
		
	}
	
}