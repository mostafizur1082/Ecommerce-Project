@extends('frontend.main_master')
@section('title')
User Dashboard
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
                    <h3 class="text-center"> <span class="text-danger">Hi.....</span> <strong>{{ Auth::user()->name }}</strong> Welcome to Easy Online Shop</h3>
                </div>
            </div>

            
        </div>
    </div>
</div>

@endsection

