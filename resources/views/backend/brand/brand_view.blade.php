@extends('admin.admin_master')
@section('admin')
<br>
<div class="container-full">
	<section class="content">
		  <div class="row">
			<div class="col-8">
				<div class="box">
				<div class="box-header with-border">
				  <h3 class="box-title">Brand List <span class="badge badge-pill badge-danger">{{ count($brands) }}</span></h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					  <table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Brand Name EN</th>
								<th>Brand Name BN</th>
								<th>Brand Image</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach($brands as $brand)
							<tr>
								<td>{{ $brand->brand_name_en }}</td>
								<td>{{ $brand->brand_name_bn }}</td>
								<td><img src="{{ asset( $brand->brand_image) }}" alt="" style="width: 70px; height: 40px; " ></td>
								<td>
									<a href="{{ route('brand.edit',$brand->id) }}" class="btn btn-info"><i class="fa fa-edit" aria-hidden="true"></i></a>
									<a href="{{ route('brand.delete',$brand->id) }}" class="btn btn-danger" id="delete"><i class="fa fa-trash" aria-hidden="true"></i></a>
								</td>
							</tr>
							@endforeach
						</tbody>
					  </table>
					</div>
				</div>
				<!-- /.box-body -->
			  </div>
			  <!-- /.box -->

			 
			  <!-- /.box -->          
			</div>


			<div class="col-4">
				<div class="box">
				<div class="box-header with-border">
				  <h3 class="box-title">Add Brand</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					<form method="post" action="{{ route('brand.store') }}" enctype="multipart/form-data">
					@csrf
					
					<div class="form-group">
					<h5>Brand Name English<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="text" name="brand_name_en" class="form-control"> 
					@error('brand_name_en')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div>

					
					<div class="form-group">
					<h5>Brand Name Bangla<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="text" name="brand_name_bn" class="form-control"> 
					@error('brand_name_bn')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div> 

					<div class="form-group">
					<h5>Brand Image<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="file" name="brand_image" class="form-control"> 
					@error('brand_image')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div>	

					<div class="text-xs-right">
					<input type="submit" class="btn btn-rounded btn-info" value="Add New Brand">
					</div>
					</form>
					</div>
				</div>
				<!-- /.box-body -->
			  </div>
			  <!-- /.box -->

			 
			  <!-- /.box -->          
			</div>

		</div>
	</section>
</div>

@endsection