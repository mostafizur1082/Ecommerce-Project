@extends('admin.admin_master')
@section('admin')
<br>
<div class="container-full">
	<section class="content">
		  <div class="row">
		


			<div class="col-4">
				<div class="box">
				<div class="box-header with-border">
				  <h3 class="box-title">Search By Date</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					<form method="post" action="{{ route('search.by.date') }}">
					@csrf
					
					<div class="form-group">
					<h5>Select Date<span class="text-danger">*</span></h5>
					<div class="controls">
					<input type="date" name="date" class="form-control"> 
					@error('date')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div>
					
					<div class="text-xs-right">
					<input type="submit" class="btn btn-rounded btn-info" value="Search">
					</div>
					</form>
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
				  <h3 class="box-title">Search By Month</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					<form method="post" action="{{ route('search.by.month') }}">
					@csrf
					
					<div class="form-group">
					<h5>Select Month<span class="text-danger">*</span></h5>
					<div class="controls">
					<select name="month" class="form-control">
						<option label="Chose One"></option>
						<option value="January">January</option>
						<option value="February">February</option>
						<option value="March">March</option>
						<option value="April">April</option>
						<option value="May">May</option>
						<option value="June">June</option>
						<option value="July">July</option>
						<option value="August">August</option>
						<option value="September">September</option>
						<option value="October">October</option>
						<option value="November">November</option>
						<option value="December">December</option>

					</select>
					@error('month')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div>

					<div class="form-group">
					<h5>Select Year<span class="text-danger">*</span></h5>
					<div class="controls">
					<select name="year" class="form-control">
						<option label="Chose One"></option>
						<option value="2023">2023</option>
						<option value="2024">2024</option>
						<option value="2025">2025</option>
						<option value="2026">2026</option>
						<option value="2027">2027</option>
					</select>
					@error('year')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div>
					
					<div class="text-xs-right">
					<input type="submit" class="btn btn-rounded btn-info" value="Search">
					</div>
					</form>
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
				  <h3 class="box-title">Search By Year</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
					<form method="post" action="{{ route('search.by.year') }}">
					@csrf
					
					<div class="form-group">
					<h5>Select Year<span class="text-danger">*</span></h5>
					<div class="controls">
					<select name="year" class="form-control">
						<option label="Chose One"></option>
						<option value="2023">2023</option>
						<option value="2024">2024</option>
						<option value="2025">2025</option>
						<option value="2026">2026</option>
						<option value="2027">2027</option>
					</select>
					@error('year')
					<span class="text-danger">{{ $message }}</span>
					@enderror
				    </div>
					</div>
					
					<div class="text-xs-right">
					<input type="submit" class="btn btn-rounded btn-info" value="Search">
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