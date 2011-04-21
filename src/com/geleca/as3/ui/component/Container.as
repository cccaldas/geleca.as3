package simbionte.ui.component 
{
	import flash.display.DisplayObject;
	import simbionte.utils.ContainerUtil;
	
	public class Container extends Component
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
		
	}

}