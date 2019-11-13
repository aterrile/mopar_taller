<?php include 'header.php'; ?>

<div class="box pr-4">
	<div class="box-header mb-4">
		<h2 class="float-left"> Lista de Clientes </h2>
		<button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#modalNewCliente">Nuevo Cliente</button>

		<div class="clearfix"></div>
	</div>
	<div class="box-body">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>#</th>
					<th> Nombre </th>
					<th> Rut </th>
					<th> Email </th>
					<th> Telefono </th>
					<th class="text-center">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($clientes as $cliente): ?>
				<tr data-regid="<?php echo $cliente->id; ?>">
					<td> <?php echo $cliente->id; ?> </td>
					<td> <?php echo Mopar::getNombreCliente($cliente->id) ?> </td>
					<td> <?php echo $cliente->rut; ?> </td>
					<td> <?php echo $cliente->email; ?> </td>
					<td> <?php echo $cliente->telefono; ?> </td>
					<td class="text-center">
						<button class="btn btn-success" data-toggle="tooltip" title="Editar Cliente"><i class="fa fa-pencil"></i></button>
						<button class="btn btn-danger btnDelete" data-toggle="tooltip" title="Eliminar Cliente"><i class="fa fa-trash-o"></i></button>
					</td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
	</div>
</div>




<!-- Nuevo Cliente -->
<div class="modal fade" id="modalNewCliente" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<form method="post" id="formNuevoCliente">
		<input type="hidden" name="action" value="insertar_cliente">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title">Datos del Cliente</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
        			<div class="form-row">
				    	<div class="form-group col-md-12">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Nombres</span>
						        </div>
						        <input type="text" name="nombres" class="form-control" style="text-transform: uppercase;" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Apellido Paterno</span>
						        </div>
						        <input type="text" name="apellidoPaterno" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Apellido Materno</span>
						        </div>
						        <input type="text" name="apellidoMaterno" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Email</span>
						        </div>
						        <input type="email" name="email" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Telefono</span>
						        </div>
						        <div class="input-group-prepend">
					          		<span class="input-group-text">(+56)</span>
						        </div>
						        <input type="text" name="telefono" class="form-control" required>
					      	</div>
				    	</div>
				    	<div class="form-group col-md-6">
					      	<div class="input-group">
						        <div class="input-group-prepend">
					          		<span class="input-group-text">Rut</span>
						        </div>
						        <input type="text" name="rut" class="form-control" required>
					      	</div>
				    	</div>
				  	</div>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal"> <i class="fa fa-times"></i> Cerrar y volver</button>
	        		<button type="submit" class="btn btn-success btnGuardar">Guardar <i class="fa fa-save"></i> </button>
	      		</div>
			</div>
	  	</div>
	</form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script></head>

<script>

$(document).ready(function(){


	$(".btnDelete").click(function(){
		tr = $(this).closest('tr');
		regid = tr.data('regid');

		$.confirm({
		    title: 'Eliminar Cliente!',
		    content: '¿Desea eliminar el cliente seleccionado?',
			type: 'red',
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
		            		data: 'action=eliminar_cliente&regid=' + regid,
		            		beforeSend: function(){
		            		},
		            		success: function(json){
		            			$.alert({
		            				title: false,
		            				type: 'green',
		            				content: 'Cliente borrado correctamente'
		            			});
		            			tr.fadeOut(400);
		            		}
		            	})
		            }
		        }
		    }
		});
	})

	$("#formNuevoCliente").submit(function(e){
		if( !IsRut( $('[name=rut]').val() ) ){
			$.alert({
				type: 'red',
				title: false,
				content: 'El RUT ingresado no es válido'
			})
			$('[name=rut]').focus();
			return false;
		}

		e.preventDefault();
		regid = $(this).closest('tr').data('regid');
		$.confirm({
		    title: 'Nueva Password para nuevo cliente!',
		    content: 'Al crear un nuevo cliente, se generará una password aleatoria y será enviada al email del cliente ingresado.<br>¿Proceder?',
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
		            		data: $('#formNuevoCliente').serialize(),
		            		beforeSend: function(){
		            			$(".overlay").show();
		            		},
		            		success: function(json){
		            			$(".overlay").hide();
		            			if( json.status == 'OK' ){
			            			$('#modalNewCliente').modal('hide');
			            			$.alert({
	    								title: false,
	    								type: 'green',
										content: 'Cliente ingresado correctamente',
	    								buttons: {
		        							volver: {
									            action: function () {
									                location.reload();
									            }
									        }
									    }
									});
			            		} else {
			            			$.alert({
	    								title: false,
	    								type: 'red',
										content: json.msg
									});
			            		}
		            		}
		            	})
		            }
		        }
		    }
		});
	});

	$("[name=rut]").blur(function(){
		$(this).val( formateaRut($(this).val() ) );
	});

});



</script>

<?php include 'footer.php'; ?>