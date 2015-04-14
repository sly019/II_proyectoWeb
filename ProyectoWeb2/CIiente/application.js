function list_productos() {

	var request = $.ajax({ 
	url: "http://localhost:3000/products.json",
    method: "GET"});

	request.done(function( msg ) {
	  $('#result').val(JSON.stringify(msg));
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  debugger;
	});
}


function load_producto(id_producto){

	var request = $.ajax({ 
	url: "http://localhost:3000/products/"+ id_producto.value +".json",
    method: "GET",//});
    /*success: function(response){
    	$('#header').val(response.status_message);
    },*/
    complete: function(e, xhr, jqXHR, textStatus){
    	if(e.status != "0"){
    		$('#header').val(e.status);
    	}else{
    		//$('#header').val("Error 404" + " Estado: " + e.statusText + " / " + e.status);
    	}
    	
    }
    /*error: function(e, jqXHR, textStatus, errorThrown){
    	var print = jqXHR.status +" *** "+ textStatus +" *** "+ errorThrown;
    		$('#header').val("404");
    	}
    */
	});

	request.done(function( msg ) {
	 	$('#result').val(JSON.stringify(msg));
	  //$('#header').val();
	})
	 
	/*request.fail(function( jqXHR, textStatus ) {
	  debugger;
	});*/
	request.fail(function( response /*event, jqXHR, ajaxSettings, thrownError, status*/) {
	//$('#result').val( xhr.getResponseHeader('Location')+ " " + jqXHR + "  " + xhr.status + "  " +  textStatus/*('[event:' + event + '], [jqXHR:' + jqXHR + '], [ajaxSettings:' + status + '], [thrownError:' + thrownError + ']')*/);
	//debugger;
		$('#header').val(response.statusText + ' ' + response.status + ' ' + response.getResponseHeader('some_header'));
	});

	/*request.always(function( response ){
		//$('#header').val(response.statusText + ' ' + response.status + ' ' + response.getResponseHeader('some_header'));
	});*/
	
}

function post_login() {

	/*var request = $.ajax({ 
	url: "http://localhost:3000/sessions.json",
    method: "POST",//});
	data: $('#form').serialize()});

	request.done(function( msg ) {
	  $('#result').val(JSON.stringify(msg));
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  debugger;
	});*/

				/*var dt={
                  "username":"a",
                  "password":"a"
                  }
 

                  //localStorage['id'] = 10;
                  //if (localStorage != null)
                  //    window.location='index-logged.html';
                  $.ajax({
                      url: 'http://localhost:3000/sessions.json',
                      method: 'POST',
                      data: JSON.stringify(dt),
                      cache: false,
                      success: function(data){
                          alert(data);
                      },
                      error: function (event, jqXHR, ajaxSettings, thrownError) {
                          alert('[event:' + event + '], [jqXHR:' + jqXHR + '], [ajaxSettings:' + ajaxSettings + '], [thrownError:' + thrownError + '])'
                      )}
        });*/

					var dt={
					"username":"a",
					"password":"a"
					};

					var request = $.get('http://localhost:3000/sessions.json', dt);

					request.done(function( msg ) {
					$('#result').val(JSON.stringify(msg));
					});
					
					request.fail(function( event, jqXHR, ajaxSettings, thrownError) {
						$('#result').val(JSON.stringify('[event:' + event + '], [jqXHR:' + jqXHR + '], [ajaxSettings:' + ajaxSettings + '], [thrownError:' + thrownError + ']'));
					//debugger;
					});
}

$(document).ready(function(){
            $("#submit").click(function(){
                //alert('hola');
                $.ajax({
                    url: 'http://localhost:3000/products.json',
                    type: 'POST',
                    data: $('#product').serialize(),
                    success: function(msj){
                        //alert(msj);
                        $('#result').val(JSON.stringify(msj));
                        //$('#mensaje_div').slideDown(5000); 
                        if(msj){
                        	jQuery.fn.reset = function(){
                        		$(this).each (function(){this.reset();})
                        	}
                        	$('#product').reset();
                        }
                    }
                });
                return false;
            });      
        });

