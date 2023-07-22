@extends('admin.admin_master')
@section('admin')
<br>
<div class="container-full">
	<section class="content">
		  <div class="row">
			<div class="col-8">
				<div class="box">
				<div class="box-header with-border">
				  <h3 class="box-title">Category List</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					  <table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Category Name EN</th>
								<th>Category Name BN</th>
								<th>Icon</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach($categories as $category)
							<tr>
								<td>{{ $category->category_name_en }}</td>
								<td>{{ $category->category_name_bn }}</td>
								<td><span><i class="{{ $category->category_icon }}"></i></span></td>
								<td>
									<a href="{{ route('category.edit',$category->id) }}" class="btn btn-info"><i class="fa fa-edit" aria-hidden="true"></i></a>
									<a href="{{ route('category.delete',$category->id) }}" class="btn btn-danger" id="delete"><i class="fa fa-trash" aria-hidden="true"></i></a>
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
				  <h3 class="box-title">Add Category</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					<form method="post" action="{{ route('category.store') }}">
					@csrf
					
					<div class="form-group">
					<h5>Category Name English<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="text" name="category_name_en" class="form-control"> 
					@error('category_name_en')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div>

					
					<div class="form-group">
					<h5>Category Name Bangla<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="text" name="category_name_bn" class="form-control"> 
					@error('category_name_bn')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div> 


					<div class="form-group">
					<h5>Category Icon<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="text" name="category_icon" class="form-control"> 
					@error('category_icon')
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