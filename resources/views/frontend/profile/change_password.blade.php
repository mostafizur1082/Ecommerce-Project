@extends('frontend.main_master')

@section('content')

<div class="body-content">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                 <br>
               <img  class="card-image-top" style="border-radius:50%" src="{{ (!empty($user->profile_photo_path))? url('upload/user_images/'.$user->profile_photo_path): url('upload/no_image.jpg') }}" alt="Profile Image" height="100%" width="100%"> 
               <br>
               <br>
               <ul class="list-group list-group-flush">
                   <a href="{{ route('dashboard') }}" class="btn btn-primary btn-sm btn-block">Home</a>
                   <a href="{{ route('user.profile') }}" class="btn btn-primary btn-sm btn-block">Profile</a>
                   <a href="{{ route('change.password') }}" class="btn btn-primary btn-sm btn-block">Change Password</a>
                   <a href="{{ route('user.logout') }}" class="btn btn-danger btn-sm btn-block">Logout</a>
               </ul>
            </div>
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

