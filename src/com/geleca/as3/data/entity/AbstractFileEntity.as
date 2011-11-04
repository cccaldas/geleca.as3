package com.geleca.as3.data.entity 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AbstractFileEntity extends Entity
	{
		public var src				:String;
		public var data				:*;
		
		public function AbstractFileEntity() 
		{
			super();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			data = null;
		}
		
	}

}