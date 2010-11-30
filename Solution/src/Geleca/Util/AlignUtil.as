package Geleca.Util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	
	public class AlignUtil 
	{
		
		public function AlignUtil() 
		{
			
		}
		
		public static function toCenter(target:Object, referente:Object):void 
		{
			target.x = referente.x + ((referente.width - target.width) / 2);
		}
		
		public static function toCenterAndMiddle(target:Object, referente:Object):void 
		{
			toCenter(target, referente);
			toMiddle(target, referente);
		}
		
		public static function toMiddle(target:Object, referente:Object):void
		{
			target.y = referente.y + ((referente.height - target.height) / 2);
		}
		
		public static function toRight(target:Object, referente:Object):void 
		{
			target.x = (referente.x + referente.width) - (target.width);
		}
		
		public static function toBottom(target:Object, referente:Object):void 
		{
			target.y = (referente.y + referente.height) - (target.height);
		}
		
		//STAGE ALINHAMENTO		
		public static function toCenterStage(target:Object, stage:Stage = null):void
		{
			target.x = (target.stage.stageWidth - target.width) / 2;
			//Tracer.trace(target.name + " toCenterStage | stageWidth=" + stage.stageWidth + "- targetWidth=" + target.width + " = atualTargetX=" + target.x);
			//target.x = 400;
			//trace("targetX - " + target.x);
			//Tracer.trace("stageAlign= " + stage.align);
			//Tracer.trace("ScrollRect: " + target.scrollRect);
			//Tracer.trace("----------------------");
			//target.x = 300;
		}
		
		public static function toMiddleStage(target:Object, stage:Stage=null):void 
		{
			target.y = (target.stage.stageHeight - target.height) / 2;
		}
		
		public static function toRightStage(target:Object, stage:Stage=null):void
		{
			target.x = target.stage.stageWidth - target.width;
		}
		
		public static function toCenterAndMiddleStage(target:Object):void
		{
			AlignUtil.toCenterStage(target);
			AlignUtil.toMiddleStage(target);
		}
		
		public static function toBottomStage(target:Object):void 
		{
			target.y = target.stage.stageHeight - target.height;
		}
		
		public static function distributeVertical(objects:Array, spacing:Number):void 
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
					//if (i != 0) DisplayObject(dataList.getItemAt(i)).x = DisplayObject(dataList.getItemAt(i -1)).width + DisplayObject(dataList.getItemAt(i -1)).x + dataList.itemSpacingX;
				}
				
			}
		}
		
		public static function distributeHorizontal(objects:Array, spacing:Number):void 
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
				}
				
			}
		}
		
	}
	
}