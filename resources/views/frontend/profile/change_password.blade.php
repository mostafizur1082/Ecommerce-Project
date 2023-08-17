@extends('frontend.main_master')
@section('title')
Change Password
@endsection
@section('content')

<div class="body-content">
    <div class="container">
        <div class="row">

            @include('frontend.common.user_sidebar')

            <div class="col-md-2">
                
            </div>
            <div class="col-md-6">
                <div class="card">
                    <h3 class="text-center"> <span class="text-danger">Hi.....</span> <strong>{{ Auth::user()->name }}</strong> Update Your Password</h3>
                    <div class="card-body">
                    	<form method="POST" action="{{ route('user.update.password') }}">
                        @csrf

                        <div class="form-group">
                        <label class="info-title" for="old_password">Current Password<span>*</span></label>
                        <input type="password" class="form-control unicase-form-control text-input" id="old_password" name="old_password">
                        </div> 

                        <div class="form-group">
                        <label class="info-title" for="password">New Password<span>*</span></label>
                        <input type="password" class="form-control unicase-form-control text-input" id="password" name="password">
                        </div> 

                        <div class="form-group">
                        <label class="info-title" for="password_confirmation">Confirm Password<span>*</span></label>
                        <input type="password" class="form-control unicase-form-control text-input" id="password_confirmation" name="password_confirmation">
                        </div> 

                        

                        <div class="form-group">
                        <button type="submit" class="btn btn-danger">Update Password</button>
                        </div> 

                        </form>
                    	
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

@endsection

