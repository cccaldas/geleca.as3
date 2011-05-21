package com.geleca.as3.test.util 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.util.PlayerUtil;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PlayerUtilTest
	{
		
		public function run():void
		{
			GLog.log("isActiveX", 		PlayerUtil.isActiveX());
			GLog.log("isBrowser", 		PlayerUtil.isBrowser());
			GLog.log("isDebugger", 		PlayerUtil.isDebugger());
			GLog.log("isDesktop", 		PlayerUtil.isDesktop());
			GLog.log("isExternal", 		PlayerUtil.isExternal());
			GLog.log("isPlugin", 		PlayerUtil.isPlugin());
			GLog.log("isStandAlone", 	PlayerUtil.isStandAlone());
		}
		
	}

}