package com.geleca.as3.test.util
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.util.OSUtil;

	public class OSUtilTest
	{
		public function run():void
		{
			GLog.log("isMac", 		OSUtil.isMac());
			GLog.log("isWin", 		OSUtil.isWin());
			GLog.log("isAndroid", 	OSUtil.isAndroid());
			GLog.log("isIOS", 		OSUtil.isIOS());
		}
		
	}
}