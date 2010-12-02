package Geleca.Util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.system.System;
	
	public class ContainerUtil 
	{
		
		public function ContainerUtil() 
		{
			
		}
		
		public static function removeAllChilds(container:DisplayObjectContainer, recursive:Boolean=false):void 
		{
			if (container != null) 
			{
				var dsp:DisplayObject;
				
				while (container.numChildren != 0) 
				{
					dsp = container.removeChildAt(0);
					if (dsp is DisplayObjectContainer && recursive)
						removeAllChilds(DisplayObjectContainer(dsp), true);
					dsp = null;
				}
				
				System.gc();
			}
			
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