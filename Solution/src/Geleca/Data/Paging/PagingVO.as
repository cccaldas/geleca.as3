package Geleca.Data.Paging
{
	public class PagingVO
	{
		private var _pageCurrent    :uint = 1;
		private var _pageNumber     :uint = 0;
		
		private var _itensTotal     :uint = 0;
		private var _itens          :Array = [];
		
		public function PagingVO(itensTotal:uint, pageNumber:uint, pageCurrent:uint, itens:Array) 
		{
			_itensTotal   = itensTotal;
			_pageNumber   = pageNumber;
			_pageCurrent  = pageCurrent;
			_itens        = itens;
		}
		
		/**Retorna a página atual.*/
		public function get pageCurrent():int { return _pageCurrent; }
		
		/**Retorna a quantidade de itens por página.*/
		public function get pageNumber():int { return _pageNumber; }
		
		/**Retorna a quantidade total de páginas.*/
		public function get pageTotal():uint { return uint(Math.ceil(itensTotal / pageNumber)); }
		
		/**Retorna a quantidade total de itens.*/
		public function get itensTotal():uint { return _itensTotal; }
		
		/**Retorna um mapa de itens com suas respectivas ordens na página atual.*/
		public function get itens():Array { return _itens; }
		
	}

}