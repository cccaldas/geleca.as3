package com.geleca.as3.net
{
	public class MetaData
	{
		public var data		:Object;
		
		public function MetaData(data:Object)
		{
			this.data = data;
		}
		
		public function get duration():Number { return data.duration; }
	}
}