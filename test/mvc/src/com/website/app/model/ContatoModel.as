package com.website.app.model 
{
	import com.website.app.model.entity.ContatoEntity;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContatoModel
	{
		
		public function ContatoModel() 
		{
			
		}
		
		public function sendContato(contato:ContatoEntity, callBack:Function):void 
		{
			callBack();
		}
		
	}

}