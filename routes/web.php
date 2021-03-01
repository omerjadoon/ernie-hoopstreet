<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StripeController;

Route::get('/', function () { return redirect('/login'); });

Auth::routes(['register' => false]);

// Change Password Routes...
Route::get('change_password', 'Auth\ChangePasswordController@showChangePasswordForm')->name('auth.change_password');
Route::patch('change_password', 'Auth\ChangePasswordController@changePassword')->name('auth.change_password');

// routes for investor api
Route::get('investmentwizard', 'Auth\RegisterInvestorController@index')->name('auth.investment_wizard');
Route::post('registercustomer', 'Auth\RegisterInvestorController@store')->name('auth.register_customer');
Route::post('updateuserdetails', 'Auth\RegisterInvestorController@updateuserdetails')->name('auth.updateuserdetails');


Route::post('addinvestment', 'Customer\CustomerInvestmentController@addinvestment')->name('addinvestment');
Route::post('updateinvestmentsource', 'Customer\CustomerInvestmentController@updateinvestmentsource')->name('updateinvestmentsource');



Route::group(['middleware' => ['auth'], 'prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin'], function () {
    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/backup', 'HomeController@backup')->name('backup');
    Route::post('abilities/destroy', 'AbilitiesController@massDestroy')->name('abilities.massDestroy');
    Route::resource('abilities', 'AbilitiesController');
    Route::delete('roles/destroy', 'RolesController@massDestroy')->name('roles.massDestroy');
    Route::resource('roles', 'RolesController');
    Route::delete('users/destroy', 'UsersController@massDestroy')->name('users.massDestroy');
    Route::resource('users', 'UsersController');
    Route::resource('test', 'TestController');
    Route::resource('investment', 'InvestmentController');
    Route::get('investment/paid/{id}', 'InvestmentController@paid')->name('investment.paid');
    Route::resource('customerinvestment', 'InvestmentController');

Route::resource('divident', 'DividentController');
    Route::get('investment/viewcustomerinvestment/{id}', 'InvestmentController@viewcustomerinvestment')->name('investment.viewcustomerinvestment');

    

});
Route::group(['middleware' => ['auth'], 'prefix' => 'customer', 'as' => 'customer.', 'namespace' => 'Customer'], function () {
    Route::get('/home', 'CustomerHomeController@index')->name('home');
    
    Route::resource('divident', 'CustomerDividentController');
    Route::resource('investment', 'CustomerInvestmentController');

    


});


Route::get('/stripe-payment', [StripeController::class, 'handleGet']);
Route::post('/stripe-payment', [StripeController::class, 'handlePost'])->name('stripe.payment');
Route::get('send-email-pdf', 'PDFController@index');

