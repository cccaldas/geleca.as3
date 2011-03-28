package com.website.domain.service
{
	import com.geleca.as3.util.FunctionUtil;
	import com.website.app.model.entity.ContatoEntity;
	import com.website.domain.entity.ContatoEntity;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContatoService
	{
		
		public function ContatoService() 
		{
			
		}
		
		public function sendContato(contato:ContatoEntity, callBack:Function):void 
		{
			FunctionUtil.functionDelay(callBack, 1.5);
		}
		
	}

}