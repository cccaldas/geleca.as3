package com.geleca.as3.asset 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import com.geleca.as3.core.IDestroyable;
	import com.geleca.as3.util.ContainerUtil;
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
		
		public function fDisplay(path:String):DisplayObject
		{
			return DisplayObject(find(path));
		}
		
		public function fBitmap(path:String):Bitmap
		{
			return Bitmap(find(path));
		}
		
		public function fMovieClip(path:String):MovieClip
		{
			return MovieClip(find(path));
		}
		
		public function fSprite(path:String):Sprite
		{
			return Sprite(find(path));
		}
		
		public function fText(path:String):TextField
		{
			return TextField(find(path));
		}
		
		/* INTERFACE Geleca.Core.IDestroyable */
		
		public function destroy():void
		{
			_asset = null;
		}
		
	}

}