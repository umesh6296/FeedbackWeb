

    	$(document).ready(function aa() {	
    		
    	//	alert("Hello from resources");
        $('#data').after('<div id="nav" ></div>');
        var rowsShown = 50;
        var rowsTotal = $('#data tbody tr').length;
        var numPages = rowsTotal/rowsShown;
        $('#data tbody tr td').css('font-size','12px');
       $('#data tbody tr td').css('font-size','12px');
        $('#data tbody tr td a').css('font-size','12px');
        for(i = 0;i < numPages;i++) {
            var pageNum = i + 1;
            $('#nav').append('<a style="color:red"; href="#" rel="'+i+'">'+pageNum+'</a> ');
        }
        $('#data tbody tr').hide();
        $('#data tbody tr').slice(0, rowsShown).show();
        $('#nav a:first').addClass('active');
        $('#nav a').bind('click', function(){

            $('#nav a').removeClass('active');
            $(this).addClass('active');
            var currPage = $(this).attr('rel');
            var startItem = currPage * rowsShown;
            var endItem = startItem + rowsShown;
            $('#data tbody tr').css('opacity','0.0').hide().slice(startItem, endItem).
                    css('display','table-row').animate({opacity:1}, 300);
        });
    	});
   