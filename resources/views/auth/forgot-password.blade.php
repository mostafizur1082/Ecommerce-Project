@extends('frontend.main_master')

@section('content')
<div class="breadcrumb">
    <div class="container">
        <div class="breadcrumb-inner">
            <ul class="list-inline list-unstyled">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class='active'>Forgot Password</li>
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

    <form method="POST" action="{{ route('password.email') }}" class="register-form outer-top-xs" role="form">
            @csrf
    
        <div class="form-group">
            <label class="info-title" for="email">Email<span>*</span></label>
            <input type="email" class="form-control unicase-form-control text-input" id="email" name="email" value="{{ old('email') }}">
        </div>
       
        <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Email Password Reset Link</button>
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