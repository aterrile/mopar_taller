<?php
/**
 *  Plugin Name: Taller Automotriz
 * 	Plugin URI: http://www.daft.cl
 * 	Description: Sencillo plugin para administrar el Taller
 * 	Version: 0.1
 * 	Author: Terry
 * 	Author URI: http://www.daft.cl
 */

function theme_options_panel(){
	add_menu_page('Doctor Mopar Taller', 'Doctor Mopar Taller', 'manage_options', 'mopar-taller', 'taller_home_func','dashicons-admin-tools',2);
	add_submenu_page( 'mopar-taller', 'Modelos', 'Modelos', 'manage_options', 'mopar-modelos', 'taller_modelos_func');
	add_submenu_page( 'mopar-taller', 'Vehiculos', 'Vehiculos', 'manage_options', 'mopar-vehiculos', 'taller_vehiculos_func');
	add_submenu_page( 'mopar-taller', 'Clientes', 'Clientes', 'manage_options', 'mopar-clientes', 'taller_clientes_func');
	add_submenu_page( 'mopar-taller', 'OT', 'OT', 'manage_options', 'mopar-ot', 'taller_ot_func');
}
add_action('admin_menu', 'theme_options_panel');
 
function taller_home_func(){
	include('views/home.php');	
}

function taller_modelos_func(){
    $vehiculos = Mopar::getVehiculos();
	$clientes = Mopar::getClientes();
	
	include('views/modelos.php');	
}


function taller_vehiculos_func(){
    $vehiculos = Mopar::getVehiculos();
	$clientes = Mopar::getClientes();
	$modelos = Mopar::getModelos();
	
	include('views/vehiculos.php');	
}

function taller_clientes_func(){
	$clientes = Mopar::getClientes();
	include('views/clientes.php');	
}

function taller_ot_func(){	
	$vehiculos = Mopar::getVehiculos();
	$clientes = Mopar::getClientes();
    $ots = Mopar::getOts();
	include('views/ot.php');	
}




/* ==============================
ACCIONES CRUD
================================= */



/********** CLIENTES *********/

function eliminar_cliente_callback(){
	global $wpdb;
	$wpdb->delete( 'clientes', ['id' => $_POST['regid']]);
	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();  
}



function insertar_cliente_callback(){
	global $wpdb;
	$pass = Mopar::randomPassword();
	$array_insert = [
		'nombres' => $_POST['nombres'],
		'apellidoPaterno' => $_POST['apellidoPaterno'],
		'apellidoMaterno' => $_POST['apellidoMaterno'],
		'email' => $_POST['email'],
		'telefono' => $_POST['telefono'],
		'secret' => md5($pass),
		'nuevo' => 1
	];
	$wpdb->insert('clientes',$array_insert);

	//Enviar por correo la pass
	$body = "Hola " . $_POST['nombres'] . "\n\nHas sido creado como cliente en el taller Doctor Mopar y se te ha creado una nueva contraseña para poder acceder y ver el historial de tu vehiculo.\n\n\nTu nueva contraseña es: " . $pass . "\n\n";
	$body .= "https://www.doctormopar.com/portal-de-cliente/";
	mail($_POST['email'].",j.basso@me.com",'Nueva contraseña para entrar a DoctorMopar',$body);

	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();  
}

function actualizar_cliente_callback(){
	global $wpdb;
	

	$array_edit = [
		'nombres' => $_POST['nombres'],
		'apellidoPaterno' => $_POST['apellidoPaterno'],
		'apellidoMaterno' => $_POST['apellidoMaterno'],
		'email' => $_POST['email'],
		'telefono' => $_POST['telefono']
	];

	if( $_POST['secret'] != "*********" ){
		$array_edit['secret'] = md5($_POST['secret']);

		$body = "Hola " . $_POST['nombres'] . "\n\nSe te ha creado una nueva contraseña para poder acceder y ver el historial de tu vehiculo en el taller Doctor Mopar.\n\nTu nueva contraseña es: " . $_POST['secret'] . "\n\n";
		$body .= "https://www.doctormopar.com/portal-de-cliente/";
		mail($_POST['email'].",j.basso@me.com",'Nueva contraseña para entrar a DoctorMopar',$body);
	}

	$wpdb->update('clientes',$array_edit,['id' => $_POST['regid']]);

	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit(); 
}



/*********** VEHICULOS ************/


function eliminar_vehiculo_callback(){
	global $wpdb;
	$wpdb->delete( 'vehiculos', ['id' => $_POST['regid']]);
	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();  
}



function insertar_vehiculo_callback(){
	global $wpdb;
	//Check Vehiculo Exist
	$sql = "SELECT * FROM vehiculos WHERE patente = '" . $_POST['patente'] . "'";
	$vehiculo = $wpdb->get_row($sql);

	if( $vehiculo ){
		$json = [
			'status' => 'ERROR',
			'msg' => 'La Patente del Vehiculo ya existe en la base de datos'
		];
	} else {

		$array_insert = [
			'patente' => $_POST['patente'],
			'marca' => $_POST['marca'],
			'modelo' => $_POST['modelo'],
			'color' => $_POST['color'],
			'ano' => $_POST['ano'],
			'nro_motor' => $_POST['nro_motor'],
			'cliente_id' => $_POST['cliente'],
			'modelo_id' => $_POST['modelo_id']
		];
		$wpdb->insert('vehiculos',$array_insert);
		$last_query = $wpdb->last_query;
		$json = [
			'status' => 'OK',
			'sql' => $last_query,
			'error' => $wpdb->last_error
		];
	}

	echo json_encode($json);
	exit();  
}


function actualizar_vehiculo_callback(){
	global $wpdb;
	//Check Vehiculo Exist
	$sql = "SELECT * FROM vehiculos WHERE patente = '" . $_POST['patente'] . "' AND id != " . $_POST['regid'];
	$vehiculo = $wpdb->get_row($sql);

	if( $vehiculo ){
		$json = [
			'status' => 'ERROR',
			'msg' => 'La Patente del Vehiculo ya existe en la base de datos'
		];
	} else {

		$array_edit = [
			'patente' => $_POST['patente'],
			'marca' => $_POST['marca'],
			'modelo' => $_POST['modelo'],
			'color' => $_POST['color'],
			'ano' => $_POST['ano'],
			'nro_motor' => $_POST['nro_motor'],
			'cliente_id' => $_POST['cliente'],
			'modelo_id' => $_POST['modelo_id']
		];
		$wpdb->update('vehiculos',$array_edit,['id' => $_POST['regid']]);

		$json = [
			'status' => 'OK',
			'sql' => $wpdb->last_query
		];
	}

	echo json_encode($json);
	exit(); 
}




/********** HISTORIAL *********/

function eliminar_historial_callback(){
	global $wpdb;
	$wpdb->delete( 'historial', ['id' => $_POST['regid']]);
	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();  
}





/********** OT *********/

function eliminar_ot_callback(){
	global $wpdb;
	$wpdb->delete( 'ot', ['id' => $_POST['regid']]);
	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();  
}


function insertar_ot_callback(){
	global $wpdb;

	if (!function_exists('wp_handle_upload')) {
       require_once(ABSPATH . 'wp-admin/includes/file.php');
   	}
	// echo $_FILES["upload"]["name"];
	$uploadedfile = $_FILES['aditional_file'];
	$upload_overrides = array('test_form' => false);
	$movefile = wp_handle_upload($uploadedfile, $upload_overrides);

    // echo $movefile['url'];
  	if ($movefile && !isset($movefile['error'])) {
     	echo "File is valid, and was successfully uploaded.\n";
    	var_dump( $movefile );
    } else {
		/**
		* Error generated by _wp_handle_upload()
		* @see _wp_handle_upload() in wp-admin/includes/file.php
		*/
		echo $movefile['error'];
    }

	$array_insert = [
		'cliente_id' => $_POST['cliente'],
		'vehiculo_id' => $_POST['vehiculo'],
		'titulo' => $_POST['titulo'],
		'detalle' => json_encode($_POST['detalle']),
		'valor' => $_POST['valor'],
		'km' => $_POST['km'],
		'estado' => $_POST['estado'],
		'observaciones' => $_POST['observaciones']
	];
	$wpdb->insert('ot',$array_insert);

	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();  
}


function editar_ot(){
	global $wpdb;

	Mopar::dd($_POST);

    if (!function_exists('wp_handle_upload')) {
   		require_once(ABSPATH . 'wp-admin/includes/file.php');
   	}
  	
  	$uploadedfile = $_FILES['file'];
	$upload_overrides = array('test_form' => false);
	$movefile = wp_handle_upload($uploadedfile, $upload_overrides);

    // echo $movefile['url'];
  	if ($movefile && !isset($movefile['error'])) {
    	$file_url = $movefile['url'];
    } else {
		$file_url = "";
    }


    $array_update = [
		'cliente_id' => $_POST['cliente'],
		'vehiculo_id' => $_POST['vehiculo'],
		'titulo' => $_POST['titulo'],
		'detalle' => json_encode($_POST['detalle']),
		'valor' => $_POST['valor'],
		'km' => $_POST['km'],
		'estado' => $_POST['estado'],
		'observaciones' => $_POST['observaciones']
	];

	$wpdb->update('ot',$array_update,['id' => $_POST['regid']]);

	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();

}



function editar_ot_callback(){
	global $wpdb;

	echo "hola mundo";
	exit();


	if (!function_exists('wp_handle_upload')) {
       require_once(ABSPATH . 'wp-admin/includes/file.php');
   	}
	// echo $_FILES["upload"]["name"];
	$uploadedfile = $_FILES['aditional_file'];
	Mopar::dd($_FILES);
	$upload_overrides = array('test_form' => false);
	$movefile = wp_handle_upload($uploadedfile, $upload_overrides);

    // echo $movefile['url'];
  	if ($movefile && !isset($movefile['error'])) {
     	echo "File is valid, and was successfully uploaded.\n";
    	var_dump( $movefile );
    } else {
		/**
		* Error generated by _wp_handle_upload()
		* @see _wp_handle_upload() in wp-admin/includes/file.php
		*/
		var_dump( $movefile );
    }

	$array_update = [
		'cliente_id' => $_POST['cliente'],
		'vehiculo_id' => $_POST['vehiculo'],
		'titulo' => $_POST['titulo'],
		'detalle' => json_encode($_POST['detalle']),
		'valor' => $_POST['valor'],
		'km' => $_POST['km'],
		'estado' => $_POST['estado'],
		'observaciones' => $_POST['observaciones']
	];

	$wpdb->update('ot',$array_update,['id' => $_POST['regid']]);

	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();  
}

function get_vehiculos_by_cliente_callback(){
	$cliente_id = $_POST['cliente_id'];
	$vehiculos = Mopar::getVehiculosByCliente($cliente_id);

	$json = [
		'vehiculos' => $vehiculos
	];

	echo json_encode($json);
	exit(); 
}



function get_ot_callback(){
	$ot_id = $_POST['ot_id'];
	$ot = Mopar::getOneOt($ot_id);

	$vehiculos = Mopar::getVehiculosByCliente($ot->cliente_id);

	$json = [
		'ot' => $ot,
		'vehiculos' => $vehiculos,
		'detalle' => json_decode($ot->detalle)
	];

	echo json_encode($json);
	exit();  
}



/************** MODELOS *****************/
function eliminar_modelo_callback(){
	global $wpdb;
	$wpdb->delete( 'modelos', ['id' => $_POST['regid']]);
	$json = [
		'status' => 'OK'
	];

	echo json_encode($json);
	exit();  
}



function get_modelo_callback(){
	global $wpdb;

	$modelo_id = $_POST['modelo_id'];
	$modelo = $wpdb->get_row('SELECT * FROM modelos WHERE id = ' . $modelo_id);

	$json = [
		'modelo' => $modelo
	];

	echo json_encode($json);
	exit();  
}


//Clientes
add_action('wp_ajax_insertar_cliente','insertar_cliente_callback');
add_action('wp_ajax_actualizar_cliente','actualizar_cliente_callback');
add_action('wp_ajax_eliminar_cliente','eliminar_cliente_callback');

//Vehiculos
add_action('wp_ajax_insertar_vehiculo','insertar_vehiculo_callback');
add_action('wp_ajax_actualizar_vehiculo','actualizar_vehiculo_callback');
add_action('wp_ajax_eliminar_vehiculo','eliminar_vehiculo_callback');

//Historial
add_action('wp_ajax_eliminar_historial','eliminar_historial_callback');

//Modelos
add_action('wp_ajax_eliminar_modelo','eliminar_modelo_callback');
add_action('wp_ajax_get_modelo','get_modelo_callback');

//OT
add_action('wp_ajax_insertar_ot','insertar_ot_callback');
add_action( 'wp_ajax_md_support_save','editar_ot' );
add_action( 'wp_ajax_nopriv_md_support_save','editar_ot' );
add_action('wp_ajax_eliminar_ot','eliminar_ot_callback');
add_action('wp_ajax_get_vehiculos_by_cliente','get_vehiculos_by_cliente_callback');
add_action('wp_ajax_get_ot','get_ot_callback');


class Mopar{

	public static function getModelos(){
		global $wpdb;
    	$modelos = $wpdb->get_results('SELECT * FROM modelos');

    	return $modelos;
	}

	public static function getClientes(){
		global $wpdb;
    	$clientes = $wpdb->get_results('SELECT * FROM clientes ORDER BY apellidoPaterno ASC');

    	return $clientes;
	}

	public static function getOneCliente($cliente_id){
		global $wpdb;
    	$cliente = $wpdb->get_row('SELECT * FROM clientes where id = ' . $cliente_id);

    	return $cliente;
	}

	public static function getVehiculos(){
		global $wpdb;
    	$vehiculos = $wpdb->get_results('SELECT * FROM vehiculos');

    	return $vehiculos;
	}

	public static function getOneVehiculo($vehiculo_id){
		global $wpdb;
    	$cliente = $wpdb->get_row('SELECT * FROM vehiculos where id = ' . $vehiculo_id);

    	return $cliente;
	}

	public static function getVehiculosByCliente($cliente_id){
		global $wpdb;
    	$cliente = $wpdb->get_results('SELECT * FROM vehiculos where cliente_id = ' . $cliente_id);

    	return $cliente;
	}

	public static function getOts(){
		global $wpdb;
    	$ots = $wpdb->get_results('SELECT * FROM ot ORDER BY id DESC');

    	return $ots;
	}

	public static function getOneOt($ot_id){
		global $wpdb;
    	$ot = $wpdb->get_row('SELECT * FROM ot WHERE id = ' . $ot_id);

    	return $ot;
	}


	public static function getOtByVehiculo($vehiculo_id){
		global $wpdb;
    	$ot = $wpdb->get_results('SELECT * FROM ot WHERE vehiculo_id = ' . $vehiculo_id);

    	return $ot;
	}

	public static function getOtByCliente($cliente_id){
		global $wpdb;
    	$ot = $wpdb->get_results('SELECT * FROM ot WHERE cliente_id = ' . $cliente_id);

    	return $ot;
	}

	public static function getNombreCliente($cliente_id, $apellido_primero=true){
		global $wpdb;
		if( $cliente_id ):
			$cliente = Mopar::getOneCliente($cliente_id);

			if( $apellido_primero )
				$nombre_cliente = $cliente->apellidoPaterno . " " . $cliente->apellidoMaterno . " " . $cliente->nombres;
			else
				$nombre_cliente = $cliente->nombres . " " . $cliente->apellidoPaterno . " " . $cliente->apellidoMaterno;

			return $nombre_cliente;
		else:
			return "";
		endif;
	}

	public static function getNombreVehiculo($vehiculo_id){
		global $wpdb;
		$sql = 'SELECT marca,modelo,patente FROM vehiculos where id = ' . $vehiculo_id;
		$vehiculo = $wpdb->get_row($sql);
		$nombre_vehiculo = $vehiculo->marca . " - " . $vehiculo->modelo . " - " . $vehiculo->patente;

		return $nombre_vehiculo;
	}

	public static function getEstado($estado_id){
		switch ($estado_id) {
			case 1: $estado = 'Cotización'; break;
        	case 2: $estado = 'Trabajo Realizado'; break;
        	case 3: $estado = 'Trabajo NO Realizado'; break;
			default: $estado = ''; break;
		}

		return $estado;
	}

	public static function dd($array, $stop=true){
	    echo "<pre>";
	    print_r($array);
	    echo "</pre>";
	    if($stop){
	        exit();
	    }
	}

	public static function getNombreMes($num, $acortar = false){
	    $strMes = '';
	    switch( $num ){
	        case 1: $strMes = 'Enero'; break;
	        case 2: $strMes = 'Febrero'; break;
	        case 3: $strMes = 'Marzo'; break;
	        case 4: $strMes = 'Abril'; break;
	        case 5: $strMes = 'Mayo'; break;
	        case 6: $strMes = 'Junio'; break;
	        case 7: $strMes = 'Julio'; break;
	        case 8: $strMes = 'Agosto'; break;
	        case 9: $strMes = 'Septiembre'; break;
	        case 10: $strMes = 'Octubre'; break;
	        case 11: $strMes = 'Noviembre'; break;
	        case 12: $strMes = 'Diciembre'; break;
	        default: $strMes = ''; break;
	    }
	    
	    if( $acortar ){
	        return substr($strMes,0,3);   
	    } else {
	        return $strMes;
	    }
	}


	public static function randomPassword() {
	    $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
	    $pass = array(); //remember to declare $pass as an array
	    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
	    for ($i = 0; $i < 8; $i++) {
	        $n = rand(0, $alphaLength);
	        $pass[] = $alphabet[$n];
	    }
	    return implode($pass); //turn the array into a string
	}


}



?>