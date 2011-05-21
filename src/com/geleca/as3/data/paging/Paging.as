package com.geleca.as3.data.paging
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Paging
	{
		private var _pageCurrent    :int = 1;
		private var _pageNumber     :int = 0;
		
		private var _itensTotal     :int = 0;
		
		/**
		 * @param itensTotal Quantidade total de itens para se paginar.;
		 * @param pageNumber Quantidade de itens que serão exibidos por página.
		 * */
		public function Paging(itensTotal:int, pageNumber:int) 
		{
			_itensTotal = itensTotal;
			_pageNumber = pageNumber;
		}
		
		/**Retorna a quantidade total de páginas.*/
		public function get pageTotal():int { return Math.ceil(itensTotal / pageNumber); }
		
		/**Retorna a quantidade total de itens.*/
		public function get itensTotal():int { return _itensTotal; }
		
		/**Seta a quantidade total de itens.*/
		public function set itensTotal(value:int):void 
		{
			_itensTotal = value;
		}
		
		/**Retorna a página atual.*/
		public function get pageCurrent():int { return _pageCurrent; }
		
		/**Retorna a quantidade de itens por página.*/
		public function get pageNumber():int { return _pageNumber; }
		
		/**Seta a quantidade de itens por página.*/
		public function set pageNumber(value:int):void 
		{
			_pageNumber = value;
			
			//assim que definido um novo pagenumber, verifica se a paginação é válida, ou seja, se não ultrapassou o range de itens.
			if (pageCurrent > pageTotal) gotoPage(pageTotal);
		}
		
		/**Retorna um mapa de itens com suas respectivas ordens na página atual.*/
		public function get itens():Array
		{
			var array:Array = [];
			
			for (var i:int = ((pageCurrent - 1) * pageNumber); i < ((pageCurrent * pageNumber)); i++) 
			{
				if (i < itensTotal) array.push(i);
			}
			
			array.sort(Array.NUMERIC);
			
			return array; 
		}
		
		/**Movimenta o cursor para a próxima página.*/
		public function nextPage():void 
		{
			if (pageCurrent != pageTotal) _pageCurrent ++;
		}
		
		/**Movimenta o cursor para a página anterior.*/
		public function prevPage():void 
		{
			if (pageCurrent != 1) _pageCurrent --;
		}
		
		/**Seta o cursor a uma página específica.*/
		public function gotoPage(page:int):void 
		{
			if (page >= 1 && page <= pageTotal) _pageCurrent = page;
		}
		
		/**Retorna um Value Object com todas as informações necessárias.*/
		public function get pagingVO():PagingVO
		{ 
			return new PagingVO(itensTotal, pageNumber, pageCurrent, itens); 
		}
	}

}