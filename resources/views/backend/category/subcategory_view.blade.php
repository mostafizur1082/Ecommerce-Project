@extends('admin.admin_master')
@section('admin')
<br>
<div class="container-full">
	<section class="content">
		  <div class="row">
			<div class="col-8">
				<div class="box">
				<div class="box-header with-border">
				  <h3 class="box-title">SubCategory List
				  	<span class="badge badge-pill badge-danger">{{ count($subcategories) }}</span></h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					  <table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>

								<th>SubCategory</th>
								<th>SubCat EN</th>
								<th>SubCat BN</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach($subcategories as $subcategory)
							<tr>
								<td> {{ $subcategory['category']['category_name_en']  }}  </td>
								<td>{{ $subcategory->subcategory_name_en }}</td>
								<td>{{ $subcategory->subcategory_name_bn }}</td>
								
								<td width="30%">
									<a href="{{ route('subcategory.edit',$subcategory->id) }}" class="btn btn-info"><i class="fa fa-edit" aria-hidden="true"></i></a>
									<a href="{{ route('subcategory.delete',$subcategory->id) }}" class="btn btn-danger" id="delete"><i class="fa fa-trash" aria-hidden="true"></i></a>
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
				  <h3 class="box-title">Add SubCategory</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					<form method="post" action="{{ route('subcategory.store') }}">
					@csrf

					<div class="form-group">
					<h5>Category Select <span class="text-danger">*</span></h5>
					<div class="controls">
					<select name="category_id" class="form-control">
						<option value="" selected="" disabled="">Select Category</option>
						@foreach($categories as $category)
						<option value="{{ $category->id }}">{{ $category->category_name_en }}</option>	
						@endforeach
					</select>
					@error('category_id') 
	 			<span class="text-danger">{{ $message }}</span>
	 			@enderror 
	 			</div>
				</div>
					
					<div class="form-group">
					<h5>SubCategory Name English<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="text" name="subcategory_name_en" class="form-control"> 
					@error('category_name_en')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div>

					
					<div class="form-group">
					<h5>SubCategory Name Bangla<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="text" name="subcategory_name_bn" class="form-control"> 
					@error('category_name_bn')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div> 

					<div class="text-xs-right">
					<input type="submit" class="btn btn-rounded btn-info" value="Add New Category">
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