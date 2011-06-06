package com.geleca.as3.util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AlignUtil 
	{
		
		public function AlignUtil() 
		{
			
		}
		
		public static function toCenter(target:Object, referente:Object, roundPixels:Boolean = true):void 
		{
			target.x = referente.x + ((referente.width - target.width) / 2);
			
			if(roundPixels)
				target.x = Math.round(target.x);
		}
		
		public static function toCenterAndMiddle(target:Object, referente:Object, roundPixels:Boolean = true):void 
		{
			toCenter(target, referente, roundPixels);
			toMiddle(target, referente, roundPixels);
		}
		
		public static function toMiddle(target:Object, referente:Object, roundPixels:Boolean = true):void
		{
			target.y = referente.y + ((referente.height - target.height) / 2);
			
			if(roundPixels)
				target.y = Math.round(target.y);
		}
		
		public static function toRight(target:Object, referente:Object, roundPixels:Boolean = true):void 
		{
			target.x = (referente.x + referente.width) - (target.width);
			
			if(roundPixels)
				target.x = Math.round(target.x);
		}
		
		public static function toBottom(target:Object, referente:Object, roundPixels:Boolean = true):void 
		{
			target.y = (referente.y + referente.height) - (target.height);
			
			if(roundPixels)
				target.y = Math.round(target.y);
		}
		
		//STAGE ALINHAMENTO		
		public static function toCenterStage(target:Object, stage:Stage = null, roundPixels:Boolean = true):void
		{
			target.x = (target.stage.stageWidth - target.width) / 2;
			
			if(roundPixels)
				target.x = Math.round(target.x);
			//Tracer.trace(target.name + " toCenterStage | stageWidth=" + stage.stageWidth + "- targetWidth=" + target.width + " = atualTargetX=" + target.x);
			//target.x = 400;
			//trace("targetX - " + target.x);
			//Tracer.trace("stageAlign= " + stage.align);
			//Tracer.trace("ScrollRect: " + target.scrollRect);
			//Tracer.trace("----------------------");
			//target.x = 300;
		}
		
		public static function toMiddleStage(target:Object, stage:Stage=null, roundPixels:Boolean = true):void 
		{
			target.y = (target.stage.stageHeight - target.height) / 2;
			
			if(roundPixels)
				target.y = Math.round(target.y);
		}
		
		public static function toRightStage(target:Object, stage:Stage=null, roundPixels:Boolean = true):void
		{
			target.x = target.stage.stageWidth - target.width;
			
			if(roundPixels)
				target.x = Math.round(target.x);
		}
		
		public static function toCenterAndMiddleStage(target:Object, roundPixels:Boolean = true):void
		{
			AlignUtil.toCenterStage(target, null, roundPixels);
			AlignUtil.toMiddleStage(target, null, roundPixels);
		}
		
		public static function toBottomStage(target:Object, roundPixels:Boolean = true):void 
		{
			target.y = target.stage.stageHeight - target.height;
			
			if(roundPixels)
				target.y = Math.round(target.y);
		}
		
		public static function distributeVertical(objects:Array, spacing:Number, roundPixels:Boolean = true):void 
		{
			var object:Object;
			var py:Number;
			for (var i:int = 0; i < objects.length; i++) 
			{
				if (i != 0) 
				{
					object = objects[i];
					py = objects[i].y = objects[i - 1].height + objects[i - 1].y + spacing;
					object.y = py;
					
					if(roundPixels)
						object.y = Math.round(object.y);
					//if (i != 0) DisplayObject(dataList.getItemAt(i)).x = DisplayObject(dataList.getItemAt(i -1)).width + DisplayObject(dataList.getItemAt(i -1)).x + dataList.itemSpacingX;
				}
				
			}
		}
		
		public static function distributeHorizontal(objects:Array, spacing:Number, roundPixels:Boolean = true):void 
		{
			var object:Object;
			var px:Number;
			
			for (var i:int = 0; i < objects.length; i++) 
			{
				if (i != 0) 
				{
					object = objects[i];
					px = objects[i].x = objects[i - 1].width + objects[i - 1].x + spacing;
					object.x = px;
					
					if(roundPixels)
						object.x = Math.round(object.x);
				}
				
			}
		}
		
	}
	
}