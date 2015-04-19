
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
	
	<form id="login" action="" method="post">
		<input type="text" name="username" value="" placeholder="Type your nusername">
		<input type="password" name="password" value="" placeholder="Type your password">
		<!--<input type="hidden" name="login[token]" value="x">-->
		<input type="submit" name="send" id="send" value="loguearse" >
		<!--<button type="submit" id="send" >loguearse </button>-->
	</form>
	<input type="button" name="log_out" id="log_out" value="log_out" >
	<hr>

	<button type="" id="prueba" onclick="list_productos()">Lista_productos y carga DropDownList para transacciones</button><br>

	<input type="text" name="id_producto" id="id_producto" value="" placeholder="Type your nusername">
	<button type="" id="send" onclick="load_producto(id_producto)">Producto</button>

	<input type="text" id="id" name="" value="" placeholder="" required>

	<form id="product" method="post">
		<input type="text" id="nombre" name="product[nombre]" value="" placeholder="" required>
		<input type="text" id="descripcion" name="product[descripcion]" value="" placeholder="" required>
		<input type="text" id="estado" name="product[estado]" value="" placeholder="" required>
		<input type="submit" name="submit" id="submit" value="Crear Producto" >
		<input type="submit" name="update" id="update" value="Actualizar Producto" >
		<!--<button type="submit" id="send"</button>-->
	</form>

	<hr>
		<button type="" id="lista_transacciones" onclick="lista_transacciones()">Lista_transacciones</button><br>

		<form id="transaction" method="post">

		<select id="primero">
		</select>

		<select id="segundo">
		</select>
		
		<input type="submit" name="submit" id="cambiar_producto" value="cambiar_producto" >
		<!--<button type="submit" id="send"</button>-->
		</form>

	<textarea style="width:1000px" rows="10" name="" id="result"></textarea>
	<textarea style="width:1000px" rows="3" name="" id="header"></textarea>
</body>
</html>

