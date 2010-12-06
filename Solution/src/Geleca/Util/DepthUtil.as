package Geleca.Util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */

	public class DepthUtil 
	{
		
		public function DepthUtil() 
		{
			
		}
		
		public static function toFront(target:DisplayObject):void 
		{
			var container:DisplayObjectContainer = getContainer(target);
			container.setChildIndex(target, container.numChildren - 1);
		}
		
		public static function toBack(target:DisplayObject):void
		{
			getContainer(target).setChildIndex(target, 0);
		}
		
		public static function toForward(target:DisplayObject):void
		{
			var container:DisplayObjectContainer = getContainer(target);
			
			try 
			{
				container.setChildIndex(target, container.getChildIndex(target) + 1);
			}
			
			catch (e:Error)
			{
				toFront(target);
			}
		}
		
		public static function toBackward(target:DisplayObject):void
		{
			var container:DisplayObjectContainer = getContainer(target);
			
			try 
			{
				container.setChildIndex(target, container.getChildIndex(target) - 1);
			}
			
			catch (e:Error)
			{
				toBack(target);
			}
		}
		
		private static function getContainer(target:DisplayObject):DisplayObjectContainer 
		{
			return (target.parent != null) ? target.parent : target.stage;
		}
		
	}
	
}