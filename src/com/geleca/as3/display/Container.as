package com.geleca.as3.display
{
	import com.geleca.as3.util.ContainerUtil;
	import flash.display.DisplayObject;
	
	public class Container extends SimpleSprite
	{
		
		public function Container() 
		{
			
		}
		
		public function findChild(path:String="mc_1.sp_2"):DisplayObject
		{
			return ContainerUtil.findChild(this, path);
		}
		
		public function removeAllChilds():void 
		{
			ContainerUtil.removeAllChilds(this);
		}
		
		public function getAllChilds():Vector.<DisplayObject> 
		{
			return new Vector.<DisplayObject>([ContainerUtil.getAllChilds(this)]);
		}
		
		override public function destroy():void 
		{
			removeAllChilds();
			
			super.destroy();
		}
		
	}

}