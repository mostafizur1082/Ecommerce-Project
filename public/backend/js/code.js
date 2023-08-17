$(function(){
	$(document).on('click','#delete',function(e){
		e.preventDefault();
		var link = $(this).attr("href");

						Swal.fire({
  						title: 'Are you sure?',
  						text: "You won't be able to revert this!",
  						icon: 'warning',
  						showCancelButton: true,
  						confirmButtonColor: '#3085d6',
  						cancelButtonColor: '#d33',
  						confirmButtonText: 'Yes, delete it!'
						}).then((result) => {
  						if (result.isConfirmed) {
  							window.location.href = link
    						Swal.fire(
      						'Deleted!',
      						'Your file has been deleted.',
      						'success'
    			)
  			}
		})
	});
});


// order status js code

$(function(){
	$(document).on('click','#confirm',function(e){
		e.preventDefault();
		var link = $(this).attr("href");

						Swal.fire({
  						title: 'Are you sure to confirm?',
  						text: "If you confirm You won't be able to pending!",
  						icon: 'warning',
  						showCancelButton: true,
  						confirmButtonColor: '#3085d6',
  						cancelButtonColor: '#d33',
  						confirmButtonText: 'Yes, Confirm it!'
						}).then((result) => {
  						if (result.isConfirmed) {
  							window.location.href = link
    						Swal.fire(
      						'Confirmed!',
      						'Your file has been changed status.',
      						'success'
    			)
  			}
		})
	});
});

$(function(){
	$(document).on('click','#processing',function(e){
		e.preventDefault();
		var link = $(this).attr("href");

						Swal.fire({
  						title: 'Are you sure to processing?',
  						text: "If you processing You won't be able to pending!",
  						icon: 'warning',
  						showCancelButton: true,
  						confirmButtonColor: '#3085d6',
  						cancelButtonColor: '#d33',
  						confirmButtonText: 'Yes, Confirm it!'
						}).then((result) => {
  						if (result.isConfirmed) {
  							window.location.href = link
    						Swal.fire(
      						'Confirmed!',
      						'Your file has been changed status.',
      						'success'
    			)
  			}
		})
	});
});


$(function(){
	$(document).on('click','#picked',function(e){
		e.preventDefault();
		var link = $(this).attr("href");

						Swal.fire({
  						title: 'Are you sure to picked?',
  						text: "If you picked You won't be able to pending!",
  						icon: 'warning',
  						showCancelButton: true,
  						confirmButtonColor: '#3085d6',
  						cancelButtonColor: '#d33',
  						confirmButtonText: 'Yes, Confirm it!'
						}).then((result) => {
  						if (result.isConfirmed) {
  							window.location.href = link
    						Swal.fire(
      						'Confirmed!',
      						'Your file has been changed status.',
      						'success'
    			)
  			}
		})
	});
});

$(function(){
	$(document).on('click','#shipped',function(e){
		e.preventDefault();
		var link = $(this).attr("href");

						Swal.fire({
  						title: 'Are you sure to shipped?',
  						text: "If you shipped You won't be able to pending!",
  						icon: 'warning',
  						showCancelButton: true,
  						confirmButtonColor: '#3085d6',
  						cancelButtonColor: '#d33',
  						confirmButtonText: 'Yes, Confirm it!'
						}).then((result) => {
  						if (result.isConfirmed) {
  							window.location.href = link
    						Swal.fire(
      						'Confirmed!',
      						'Your file has been changed status.',
      						'success'
    			)
  			}
		})
	});
});

$(function(){
	$(document).on('click','#delivered',function(e){
		e.preventDefault();
		var link = $(this).attr("href");

						Swal.fire({
  						title: 'Are you sure to delivered?',
  						text: "If you delivered You won't be able to pending!",
  						icon: 'warning',
  						showCancelButton: true,
  						confirmButtonColor: '#3085d6',
  						cancelButtonColor: '#d33',
  						confirmButtonText: 'Yes, Confirm it!'
						}).then((result) => {
  						if (result.isConfirmed) {
  							window.location.href = link
    						Swal.fire(
      						'Confirmed!',
      						'Your file has been changed status.',
      						'success'
    			)
  			}
		})
	});
});

$(function(){
	$(document).on('click','#cancel',function(e){
		e.preventDefault();
		var link = $(this).attr("href");

						Swal.fire({
  						title: 'Are you sure to cancel?',
  						text: "If you cancel You won't be able to pending!",
  						icon: 'warning',
  						showCancelButton: true,
  						confirmButtonColor: '#3085d6',
  						cancelButtonColor: '#d33',
  						confirmButtonText: 'Yes, Confirm it!'
						}).then((result) => {
  						if (result.isConfirmed) {
  							window.location.href = link
    						Swal.fire(
      						'Confirmed!',
      						'Your file has been changed status.',
      						'success'
    			)
  			}
		})
	});
});
