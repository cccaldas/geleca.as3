package com.geleca.as3.debugger
{
	import com.geleca.as3.util.PlayerUtil;
	import com.geleca.as3.util.TimeUtil;
	import flash.sampler.NewObjectSample;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class GLog 
	{
		private static const MSG_TEMPLATE	:String = "[GLog][{time}]{msg}, at[{path} line {line}]";
		
		public function GLog() 
		{
			
		}
		
		public static function log(...rest):void 
		{
			if (!PlayerUtil.isDebugger())
				return;
				
			var stackTrace	:String;
			
			try
			{ 
				throw new Error(); 
			}
			catch (e:Error)
			{ 
				stackTrace = e.getStackTrace(); 
			}
			
			//trace(this, stackTrace);

			var lines	:Array = stackTrace.split("\n");
			var isDebug	:Boolean = (lines[int(1)] as String).indexOf("[") != int(-1);

			var path	:String;
			var line	:int = -1;
			var time	:int = getTimer();

			if (isDebug)
			{
				var regex	:RegExp = /at\x20(.+?)\[(.+?)\]/i;
				var matches	:Array = regex.exec(lines[int(2)]);

				path = matches[int(1)];

				//file:line = matches[2]
				line = matches[int(2)].split(":")[int(2)];//windows == 2 because of drive:\
			}
			else
			{
				path = (lines[int(2)] as String).substring(4);
			}
			
			//line = 
			
			var output:String = MSG_TEMPLATE;
			output = output.replace("{msg}", rest);
			output = output.replace("{path}", path);
			output = output.replace("{line}", line);
			output = output.replace("{time}", TimeUtil.formatTime(time));
			

			//msg += " at: " + path + (line != -1 ? " line:[" + line.toString() + "]" : ")" + ":" + msg);
			
			trace(output);
		}
		
	}

}