
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">

	<title></title>
	<link rel="stylesheet" href="">
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<!--<script src="jquery-1.5.2.js"></script>-->
	<script src="application.js" type="text/javascript" charset="utf-8" async defer></script>
</head>
<body>
	
	<form id="form" action="" method="get">
		<input type="text" name="username" value="" placeholder="Type your nusername">
		<input type="password" name="password" value="" placeholder="Type your password">
		<button type="submit" id="send" onclick="post_login()">loguearse </button>
	</form>

	<button type="" id="prueba" onclick="list_productos()">Lista_productos</button><br>

	<input type="text" name="id_producto" id="id_producto" value="" placeholder="Type your nusername">
	<button type="" id="send" onclick="load_producto(id_producto)">Producto</button>

	<form id="product" method="post">
		<input type="text" name="product[nombre]" value="" placeholder="" required>
		<input type="text" name="product[descripcion]" value="" placeholder="" required>
		<input type="text" name="product[estado]" value="" placeholder="" required>
		<input type="submit" name="submit" id="submit" value="Crear Producto" >
		<!--<button type="submit" id="send"</button>-->
	</form>

	<textarea style="width:1000px" rows="10" name="" id="result"></textarea>
	<textarea style="width:1000px" rows="3" name="" id="header"></textarea>
</body>
</html>

