package Geleca.Asset 
{
	import flash.display.Sprite;
	import Geleca.Core.IDestroyable;
	import Geleca.Util.ContainerUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AssetNav implements IDestroyable
	{
		private var _asset		:Sprite;
		
		public function AssetNav(asset:Sprite) 
		{
			_asset = asset;
		}
		
		public function find(path:String="object.object"):*
		{
			return ContainerUtil.findChild(_asset, path);
		}
		
		/* INTERFACE Geleca.Core.IDestroyable */
		
		public function destroy():void
		{
			_asset = null;
		}
		
	}

}