package com.geleca.as3.util
{
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TransformUtil 
	{
		
		public function TransformUtil() 
		{
			
		}
		
		/*
		 * Espelha o objeto horizontalmente
		 * */
		public static function flipHorizontal(dsp:DisplayObject):void
		{
			var matrix:Matrix = dsp.transform.matrix;
			matrix.transformPoint(new Point(dsp.width / 2, dsp.height / 2));
			if (matrix.a > 0)
			{
				matrix.a=-1*matrix.a;
				matrix.tx=dsp.width+dsp.x;
			}
			else
			{
				matrix.a=-1*matrix.a;
				matrix.tx=dsp.x-dsp.width;
			}
			
			dsp.transform.matrix=matrix;
		}
		
		/*
		 * Espelha o objeto verticalmente
		 * */
		public static function flipVertical(dsp:DisplayObject):void
		{
			var matrix:Matrix = dsp.transform.matrix;
			matrix.transformPoint(new Point(dsp.width / 2, dsp.height / 2));
			if (matrix.d > 0)
			{
				matrix.d=-1*matrix.d;
				matrix.ty=dsp.y+dsp.height;
			}
			else
			{
				matrix.d=-1*matrix.d;
				matrix.ty=dsp.y-dsp.height;
			}
			
			dsp.transform.matrix=matrix;
		}
		
	}
	
}