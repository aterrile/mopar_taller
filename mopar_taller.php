<?php
/**
 *  Plugin Name: Taller Doctor Mopar
 * 	Plugin URI: http://www.daft.cl
 * 	Description: Sencillo plugin para administrar el Taller
 * 	Version: 0.1
 * 	Author: Terry
 * 	Author URI: http://www.daft.cl
 */

function theme_options_panel(){
	add_menu_page('Doctor Mopar Taller', 'Doctor Mopar Taller', 'manage_options', 'mopar-taller', 'taller_home_func');
	add_submenu_page( 'mopar-taller', 'Vehiculos', 'Vehiculos', 'manage_options', 'mopar-vehiculos', 'taller_vehiculos_func');
	add_submenu_page( 'mopar-taller', 'Clientes', 'Clientes', 'manage_options', 'mopar-clientes', 'taller_clientes_func');
	add_submenu_page( 'mopar-taller', 'OT', 'OT', 'manage_options', 'mopar-ot', 'taller_ot_func');
}
add_action('admin_menu', 'theme_options_panel');
 
function taller_home_func(){
	include('views/home.php');	
}

function taller_vehiculos_func(){
    global $wpdb;
    $vehiculos = $wpdb->get_results('SELECT * FROM vehiculos');
	$clientes = $wpdb->get_results('SELECT * FROM clientes ORDER BY apellidoPaterno ASC');
	
	include('views/vehiculos.php');	
}

function taller_clientes_func(){
	global $wpdb;
    $clientes = $wpdb->get_results('SELECT * FROM clientes ORDER BY apellidoPaterno ASC');
	include('views/clientes.php');	
}

function taller_ot_func(){
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
	//Check Cliente Exist
	$sql = "SELECT * FROM clientes WHERE rut = '" . $_POST['rut'] . "'";
	$cliente = $wpdb->get_row($sql);

	if( $cliente ){
		$json = [
			'status' => 'ERROR',
			'msg' => 'RUT del Cliente ya existe en la base de datos'
		];
	} else {


		$array_insert = [
			'nombres' => $_POST['nombres'],
			'apellidoPaterno' => $_POST['apellidoPaterno'],
			'apellidoMaterno' => $_POST['apellidoMaterno'],
			'email' => $_POST['email'],
			'telefono' => $_POST['telefono'],
			'rut' => $_POST['rut']
		];
		$wpdb->insert('clientes',$array_insert);

		$json = [
			'status' => 'OK'
		];
	}

	echo json_encode($json);
	exit();  
}

function actualizar_cliente_callback(){
	print_r($_POST);
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
	$sql = "SELECT * FROM vehiculos WHERE nro_motor = '" . $_POST['nro_motor'] . "'";
	$vehiculo = $wpdb->get_row($sql);

	if( $vehiculo ){
		$json = [
			'status' => 'ERROR',
			'msg' => 'Nro. de motor del Vehiculo ya existe en la base de datos'
		];
	} else {


		$array_insert = [
			'patente' => $_POST['patente'],
			'marca' => $_POST['marca'],
			'modelo' => $_POST['modelo'],
			'color' => $_POST['color'],
			'ano' => $_POST['ano'],
			'nro_motor' => $_POST['nro_motor'],
			'cliente_id' => $_POST['cliente']
		];
		$wpdb->insert('vehiculos',$array_insert);

		$json = [
			'status' => 'OK'
		];
	}

	echo json_encode($json);
	exit();  
}



function actualizar_vehiculo_callback(){
	print_r($_POST);
	exit();  
}

add_action('wp_ajax_insertar_cliente','insertar_cliente_callback');
add_action('wp_ajax_actualizar_cliente','actualizar_cliente_callback');
add_action('wp_ajax_eliminar_cliente','eliminar_cliente_callback');


add_action('wp_ajax_insertar_vehiculo','insertar_vehiculo_callback');
add_action('wp_ajax_actualizar_vehiculo','actualizar_vehiculo_callback');
add_action('wp_ajax_eliminar_vehiculo','eliminar_vehiculo_callback');




class Mopar{

	public static function getNombreCliente($cliente_id, $apellido_primero=true){
		global $wpdb;
		$cliente = $wpdb->get_row('SELECT * FROM clientes where id = ' . $cliente_id);

		if( $apellido_primero )
			$nombre_cliente = $cliente->apellidoPaterno . " " . $cliente->apellidoMaterno . " " . $cliente->nombres;
		else
			$nombre_cliente = $cliente->nombres . " " . $cliente->apellidoPaterno . " " . $cliente->apellidoMaterno;

		return $nombre_cliente;
	}

}



?>