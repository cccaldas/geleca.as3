var GFit = {};

GFit.ready = function()
{		
	GFit.app = $("#" + GFit.target);
	GFit.init();
	GFit.resize();
}

GFit.init = function()
{	
	GFit.width 	= GFit.app.width();
	GFit.height	= GFit.app.height();
	
	GFit.app.css("margin-bottom", "-4px");
}

GFit.resize = function()
{
	var window_width 	= $(window).width();
	var window_height 	= $(window).height();
	
	//caso a window.width for menor que o tamanho minimo
	if(window_width < GFit.width)
	{
		//GFit.app.width(GFit.width);
		GFit.app.attr("width", GFit.width);
		$("body").css("overflow-x", "scroll");
	}
	else
	{
		//GFit.app.width("100%");
		GFit.app.attr("width", window_width);
		$("body").css("overflow-x", "hidden");
	}
	
	//caso a window.height for menor que o tamanho minimo
	if(window_height < GFit.height)
	{
		//GFit.app.height(GFit.height);
		GFit.app.attr("height", GFit.height);
		$("body").css("overflow-y", "scroll");
	}
	else
	{
		//GFit.app.height("100%");
		GFit.app.attr("height", window_height);
		$("body").css("overflow-y", "hidden");
	}
}

GFit.fit = function(target)
{
	GFit.target = target;
	$(document).ready(GFit.ready);
	$(window).resize(GFit.resize);
}