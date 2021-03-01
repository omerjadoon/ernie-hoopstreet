@extends('layouts.admin')
@section('content')
<div class="main-panel">
<div class="content-wrapper">
<div class="card">
    <div class="card-header">
        {{ trans('global.create') }} Investment
    </div>

    <div class="card-body">
        

       <!-- yy -->
  

<style type="text/css">
        .panel-title {
        display: inline;
        font-weight: bold;
        }
        .display-table {
            display: table;
        }
        .display-tr {
            display: table-row;
        }
        .display-td {
            display: table-cell;
            vertical-align: middle;
            width: 61%;
        }
        .hide{
            display: none;
        }
    </style>


    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default credit-card-box">
                <div class="panel-heading display-table" >
                    <div class="row display-tr" >
                        <h3 class="panel-title display-td" >Payment Details</h3>
                        <div class="display-td" >                            
                            
                        </div>
                    </div>                    
                </div>
                <div class="panel-body" style="margin-top: 25px">
  
                    @if (Session::has('success'))
                        <div class="alert alert-success text-center">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                            <p>{{ Session::get('success') }}</p>
                        </div>
                    @endif
  
                    <form role="form" action="{{ route('customer.investment.store') }}" method="post" class="require-validation"
                                                     data-cc-on-file="false"
                                                    data-stripe-publishable-key="{{ env('STRIPE_KEY') }}"
                                                    id="payment-form">
                        @csrf
  
                        
  
                  <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                                <label for="investment_amount">Investment amount * (min: $500, max: $50000000)</label>
                                
                                <input type="number" placeholder="$500" value="500" class="form-control" id="investment_amount" name="investment_amount" required min="500" max="50000000" step="50" required>
                                @if($errors->has('investment_amount'))
                                    <em class="invalid-feedback">
                                        {{ $errors->first('investment_amount') }}
                                    </em>
                                @endif
                                <p class="helper-block">
                                    {{ trans('cruds.ability.fields.name_helper') }}
                                </p>
                            </div>
                        <div class='form-row row'>
                            <div class='col-xs-12 form-group card required'>
                                <label class='control-label'>Card Number</label> <input
                                    autocomplete='off' class='form-control card-number' size='100'
                                    type='text'>
                            </div>
                        </div>
  
                        <div class='form-row row'>
                            <div class='col-xs-12 col-md-4 form-group cvc required'>
                                <label class='control-label'>CVC</label> <input autocomplete='off'
                                    class='form-control card-cvc' placeholder='ex. 311' size='4'
                                    type='text'>
                            </div>
                            <div class='col-xs-12 col-md-4 form-group expiration required'>
                                <label class='control-label'>Expiration Month</label> <input
                                    class='form-control card-expiry-month' placeholder='MM' size='2'
                                    type='text'>
                            </div>
                            <div class='col-xs-12 col-md-4 form-group expiration required'>
                                <label class='control-label'>Expiration Year</label> <input
                                    class='form-control card-expiry-year' placeholder='YYYY' size='4'
                                    type='text'>
                            </div>
                        </div>
                         <input type="hidden" name="user_id" value="{{auth()->user()->id}}">
  
                        <div class='form-row row'>
                            <div class='col-md-12 error form-group hide' >
                                <div class='alert-danger alert'>Please correct the errors and try
                                    again.</div>
                            </div>
                        </div>
  
                        <div class="row">
                            <div class="col-xs-12">
                                <button class="btn btn-primary btn-lg btn-block" type="submit">Pay Now</button>
                            </div>
                        </div>
                          
                    </form>
                </div>
            </div>        
        </div>
         <div class="col-md-6 col-md-offset-3">
           <img class="img-responsive pull-right text-center" style="width: 250px" src="https://cdn.iconscout.com/icon/free/png-512/secure-electronic-payment-credit-debit-card-2-5894.png">
           
           <img class="img-responsive pull-right text-center" style="width: 300px" src="http://files.us.gositebuilder.com/enom7552/image/screenshot2014-11-06at3.15.59pm.png">
         </div>
    </div>


   


    </div>
</div>
</div>
</div>
@endsection