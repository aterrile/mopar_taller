<?php include 'header.php'; ?>

<div class="box pr-4">

	<div class="box-header mb-4">
		<h2 class="float-left"> Historial Vehiculos </h2>
		<div class="clearfix"></div>
	</div>

	<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th> # </th>
				<th> Patente </th>
				<th> Marca </th>
				<th> Modelo </th>
				<th> Año </th>
				<th> Color </th>
				<th> Nro. Motor </th>
				<th> Cliente </th>
				<th class="text-center">Acciones</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($vehiculos as $key => $vehiculo): ?>
			<tr data-regid="<?php echo $vehiculo->id ?>">
				<td> <?php echo $vehiculo->id ?> </td>
				<td> <?php echo $vehiculo->patente ?> </td>
				<td> <?php echo $vehiculo->marca ?> </td>
				<td> <?php echo $vehiculo->modelo ?> </td>
				<td> <?php echo $vehiculo->ano ?> </td>
				<td> <?php echo $vehiculo->color ?> </td>
				<td> <?php echo $vehiculo->nro_motor ?> </td>
				<td> <?php echo Mopar::getNombreCliente($vehiculo->cliente_id) ?> </td>
				
				<td class="text-center">
					<button class="btn btn-success" data-toggle="tooltip" title="Editar Vehiculo"><i class="fa fa-pencil"></i></button>
					<button class="btn btn-danger btnDelete" data-toggle="tooltip" title="Eliminar Vehiculo"><i class="fa fa-trash-o"></i></button>
					<button class="btn btn-info" data-toggle="tooltip" title="Ver Historial del Vehiculo"><i class="fa fa-history"></i></button>
				</td>
			</tr>
			<?php endforeach; ?>
		</tbody>
	</table>

</div>

<!-- Nuevo Vehiculo -->
<div class="modal fade" id="modalNewVehiculo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<form method="post" id="formNuevoVehiculo">
		<input type="hidden" name="action" value="insertar_vehiculo">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title">Datos del Vehiculo</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
        			<div class="form-row">
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Patente</span>
						        </div>
						        <input type="text" name="patente" class="form-control" style="text-transform: uppercase;" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Año</span>
						        </div>
						        <input type="text" name="ano" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Marca</span>
						        </div>
						        <input type="text" name="marca" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Modelo</span>
						        </div>
						        <input type="text" name="modelo" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Color</span>
						        </div>
						        <input type="text" name="color" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Nro.Motor</span>
						        </div>
						        <input type="text" name="nro_motor" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Cliente</span>
						        </div>
						        <select name="cliente" class="form-control" required>
						        	<option value="">Seleccione</option>
						        	<?php foreach ($clientes as $cliente) { ?>
						        	<option value="<?php echo $cliente->id ?>"><?php echo $cliente->apellidoPaterno ?> <?php echo $cliente->apellidoMaterno ?> <?php echo $cliente->nombres ?></option>
						        	<?php } ?>
						        </select>
					      	</div>
				    	</div>
				  	</div>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal"> <i class="fa fa-times"></i> Cerrar y volver</button>
	        		<button type="submit" class="btn btn-success">Guardar <i class="fa fa-save"></i> </button>
	      		</div>
			</div>
	  	</div>
	</form>
</div>


<script>
$(document).ready(function(){
	$(".btnDelete").click(function(){
		tr = $(this).closest('tr');
		regid = tr.data('regid');
		$.confirm({
		    title: 'Eliminar Vehiculo!',
		    content: '¿Desea eliminar el vehiculo seleccionado?',
			type: 'red',
			theme: 'bootstrap',
			icon: 'fa fa-warning',
		    buttons: {
		        NO:{
		            text: 'No',
		            btnClass: 'btn-red',
		        },
		        SI:{
		            text: 'Si',
		            btnClass: 'btn-green',
		            action: function(){
		            	$.ajax({
		            		type: 'POST',
		            		url: '<?php echo admin_url('admin-ajax.php'); ?>',
		            		dataType: 'json',
		            		data: {
								action: 'eliminar_vehiculo',
								regid: regid
							},
		            		beforeSend: function(){
		            		},
		            		success: function(json){
		            			$.alert({
		            				title: false,
		            				type: 'green',
		            				content: 'Vehiculo borrado correctamente'
		            			});
		            			tr.fadeOut(400);
		            		}
		            	})
		            }
		        }
		    }
		});
	});


	$("#formNuevoVehiculo").submit(function(e){
		e.preventDefault();
		regid = $(this).closest('tr').data('regid');
		$.ajax({
    		type: 'POST',
    		url: '<?php echo admin_url('admin-ajax.php'); ?>',
    		dataType: 'json',
    		data: $('#formNuevoVehiculo').serialize(),
    		beforeSend: function(){
    			$(".overlay").show();
    		},
    		success: function(json){
    			if( json.status == 'OK' ){
        			$('#modalNewVehiculo').modal('hide');
        			$.alert({
						title: false,
						type: 'green',
						content: 'Vehiculo ingresado correctamente',
						buttons: {
							volver: {
					            action: function () {
					                location.reload();
					            }
					        }
					    }
					});
        		} else {
        			$(".overlay").hide();
        			$.alert({
						title: false,
						type: 'red',
						content: json.msg
					});
        		}
    		}
    	})
	});	

})

</script>

<?php include 'footer.php'; ?>