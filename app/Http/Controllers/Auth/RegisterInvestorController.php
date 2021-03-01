<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

use Illuminate\Http\Request;
use Bouncer;
class RegisterInvestorController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

   // use RegistersUsers;


    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
   // protected $redirectTo = '/admin/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    public function index()
    {
            
            return view('register.index');
       
        
        
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function registeruser(array $data)
    {
        // return User::create([
        //     'name' => $data['name'],
        //     'email' => $data['email'],
        //     'password' => bcrypt($data['password']),
        // ]);

        if($data['email'] != "" && $data['password'] != "")
        {

        $user = User::create($request->all());

              //

            // Return success
        return response()->json(
          [
            'status' => 'OK',
            'data' => $user,
            'message' => 'success'
          ],200
        );
    }else{
        return response()->json(
          [
            'status' => 'ERROR',
            'data' => "",
            'message' => 'Email and password cant be empty'
          ],200
        );

    }

       // return response()->json("hello");
    }

   protected function updateuserdetails(Request $data)
    {
        // return User::create([
        //     'name' => $data['name'],
        //     'email' => $data['email'],
        //     'password' => bcrypt($data['password']),
        // ]);
      //print_r($_FILES);

        if($data->email != "" && $data->name != "")
        {

       

        if($data->hasFile('file') && $data->hasFile('worth') ) {
           $file = $data->file('file');
           $file_worth = $data->file('worth');
           //you also need to keep file extension as well
           $name = $file->getClientOriginalName().'.'.$file->getClientOriginalExtension();
           $name_worth = $file_worth->getClientOriginalName().'.'.$file_worth->getClientOriginalExtension();

           //using the array instead of object
           $image['filePath'] = $name;
           $file->move(public_path().'/uploads/', $name);
           $file_worth->move(public_path().'/uploads/', $name_worth);
           $p = public_path().'/uploads/'. $name;
            $p_worth = public_path().'/uploads/'. $name_worth;
            $user = User::where('email', $data->email)
              ->update([
                'name' => $data->name,
                'state' => $data->state,
                'address' => $data->address,
                'mobile' => $data->phone,
                'accredited' => $data->accredation,
                'income'=> $p,
                'net_worth'=> $p_worth
            ]);
           
        }//for non accredited
        else{
           $user = User::where('email', $data->email)
              ->update([
                'name' => $data->name,
                'state' => $data->state,
                'address' => $data->address,
                'mobile' => $data->phone,
                'accredited' => $data->accredation,
                
            ]);
        }
              //

            // Return success
        return response()->json(
          [
            'status' => 'OK',
            'data' => $data,
            'message' => 'success'
          ],200
        );
    }else{
        return response()->json(
          [
            'status' => 'ERROR',
            'data' => "",
            'message' => 'Please fill all the fields'
          ],200
        );

    }

       // return response()->json("hello");
    }




    public function store(Request $request)
    {
        if($request->email != "" && $request->password != "")
        {

            if ((User::where('email', $request->email)->doesntExist())) {
                $user = User::create($request->all());
                Bouncer::assign('Customer')->to($user);

            // Return success
                return response()->json(
                  [
                    'status' => 'OK',
                    'data' => $user,
                    'message' => 'success',
                  ],200
                );
            }
            else{
                return response()->json(
              [
                'status' => 'ERROR',
                'data' => "",
                'message' => 'email already exist. Please Login',
              ],200);
            }
        }
        else{
            return response()->json(
              [
                'status' => 'ERROR',
                'data' => "",
                'message' => 'email and password can\'t be empty',
              ],200);
        }

    }

              //


    
}
