@extends('frontend.main_master')

@section('content')
<div class="breadcrumb">
    <div class="container">
        <div class="breadcrumb-inner">
            <ul class="list-inline list-unstyled">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class='active'>Reset Password</li>
            </ul>
        </div><!-- /.breadcrumb-inner -->
    </div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="body-content">
    <div class="container">
        <div class="sign-in-page">
            <div class="row">
<div class="col-md-3 col-sm-3 sign-in">
</div>
                <!-- Sign-in -->            
<div class="col-md-6 col-sm-6 sign-in">
    <h4 class="">Forgot Password<h4>

    <form method="POST" action="{{ route('password.update') }}" class="register-form outer-top-xs" role="form">
            @csrf
    <input type="hidden" name="token" value="{{ $request->route('token') }}">
    
        <div class="form-group">
            <label class="info-title" for="email">Email<span>*</span></label>
            <input type="email" class="form-control unicase-form-control text-input" id="email" name="email" value="{{ old('email', $request->email)}}">
        </div>

        <div class="form-group">
            <label class="info-title" for="password"> Password<span>*</span></label>
            <input type="password" class="form-control unicase-form-control text-input" id="password" name="password" >
        </div>

        <div class="form-group">
            <label class="info-title" for="password_confirmation">Confirm Password<span>*</span></label>
            <input type="password" class="form-control unicase-form-control text-input" id="password_confirmation" name="password_confirmation" >
        </div>
       
        <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Reset Password</button>
    </form>  


</div>
<!-- Sign-in -->
<div class="col-md-3 col-sm-3 sign-in">
</div>

<!-- create a new account -->

<!-- create a new account -->           </div><!-- /.row -->
        </div><!-- /.sigin-in-->

        </div><!-- /.sigin-in-->
        @include('frontend.body.brands')

        </div><!-- /.body-content -->

@endsection