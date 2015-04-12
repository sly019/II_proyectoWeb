function list_tasks() {

	var request = $.ajax({ url: "http://localhost:3000/users.json",method: "GET"
	});

	request.done(function( msg ) {
	  $('#result').val(JSON.stringify(msg));
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  debugger;
	});
}


/*$(document).ready(function(){
            $("#prueba").click(function(){
                //alert('hola');
                $.ajax({
                    url: "http://localhost:3000/users.json",
                    type: "GET",
                    //data: $('#form').serialize(),
                    success: function(msj){
                        alert(msj);
                        /*$('#result').html(msj);
                        //$('#mensaje_div').slideDown(5000); 
                        if(msj == "<font color='#01DF01'> se guardo con exito!</font>"){
                        	jQuery.fn.reset = function(){
                        		$(this).each (function(){this.reset();})
                        	}
                        	$('#result').html(msj);
                        }
                    }
                });
                return false;
            });      
        });*/