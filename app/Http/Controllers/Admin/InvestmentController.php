<?php

namespace App\Http\Controllers\Admin;

use App\Investment;
use Silber\Bouncer\Database\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreUsersRequest;
use App\Http\Requests\Admin\UpdateUsersRequest;

use App\User;
use App\Share;
use DB;
use Stripe;
use Session;
use PDF;

use Mail;
use Validator;
use App\Jobs\AdminMailJob;

class InvestmentController extends Controller
{
    /**
     * Display a listing of User.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
            //sreturn Investment::all();
       //       $id = Auth::user()->getId();
       //  $investments = Investment::where('user_id',$id)->get();
       //  $user = User::where('id',$id)->get();
        $data = Investment::join('users', 'users.id', '=', 'investments.user_id')
       ->select('users.*', 'investments.*')
       ->get();
       //return $data;

       return view('admin.investment.index', compact('data'));
       // return view('admin.test.test');
    }

    /**
     * Show the form for creating new User.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        $roles = Role::get()->pluck('name', 'name');

        return view('admin.investment.create', compact('roles'));
    }

    /**
     * Store a newly created User in storage.
     *
     * @param  \App\Http\Requests\StoreUsersRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUsersRequest $request)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        $user = Investment::create($request->all());

        // foreach ($request->input('roles') as $role) {
        //     $user->assign($role);
        // }

        return redirect()->route('admin.users.index');
    }


    /**
     * Show the form for editing User.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        //$roles = Role::get()->pluck('name', 'name');

        $investment = Investment::findOrFail($id);

        return view('admin.users.edit', compact('investment'));
    }

    /**
     * Update User in storage.
     *
     * @param  \App\Http\Requests\UpdateUsersRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUsersRequest $request, $id)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        $investment = Investment::findOrFail($id);
        $user->update($request->all());
        // foreach ($user->roles as $role) {
        //     $user->retract($role);
        // }
        // foreach ($request->input('roles') as $role) {
        //     $user->assign($role);
        // }

        return redirect()->route('admin.investment.index');
    }


public function viewcustomerinvestment($id)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
            //sreturn Investment::all();
       //       $id = Auth::user()->getId();
        $investments = Investment::where('user_id',$id)->get();
        $user = User::where('id',$id)->get();
       //  $data = User::join('investments', 'users.id', '=', $id)
       // ->select('users.*', 'investments.*')
       // ->get();
       //return $data;

       return view('admin.investment.customerinvestment', compact('investments','user'));
       // return view('admin.test.test');
    }


public function paid($id)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
         $investment = Investment::findOrFail($id);
          $user = User::findOrFail($investment->user_id);
        // $investment->update($request->all());
        Investment::where('id', $id)
              ->update(['payment_status' => 1,'investment_status' => 1, 'payment_source'  => 'bank']);

        $ia = 'total_investment+'.$investment->investment_amount;
                $affected = User::where('id', $investment->user_id)
              ->update(['total_investment' => DB::raw($ia)]);


              $emailParams = new \stdClass();
        
        $emailParams->investment = $investment;
       
        $emailParams->user = $user;
        
            $this->dispatch(new AdminMailJob($emailParams));
        

        //store the shares
//               $no_of_shares = ($investment->investment_amount)/50;

//               for ($i=0; $i < $no_of_shares ; $i++) { 
//                 # code...
//                 $share_id = $this->gen_uuid();
//                 Share::insert([
//                     'share_id' => $share_id,
//                     'user_id' => $investment->user_id,
//                     'investment_id' => $id,
//                     'user_email' => $user->email
//                 ]);
//               }

//               //send email
//               $shares = Share::where('user_email',$user->email)->get();


// //change to $request->email
//       $data["email"] = $user->email;
//         $data["title"] = "Investment Confirmation (www.hoopstreet.com)";

//          $data["name"] = $user->name;
//         $data["shares"] = $shares;
//         $n_share = 0;
//         $total_investment = 0;
       
//         foreach ($shares as $share) {
//           # code...

//           $n_share = $n_share +1;

//         }
//         $total_investment = $n_share *50;
//         $data["no_of_shares"] = $n_share;
//          $data["total_investment"] = $total_investment;
        
  
//         $pdf = PDF::loadView('emails.myTestMail', $data);
  
//         Mail::send('emails.myTestMail', $data, function($message)use($data, $pdf) {
//             $message->to($data["email"], $data["email"])
//                     ->subject($data["title"])
//                     ->attachData($pdf->output(), "Invoice.pdf");
//         });

      
        // foreach ($user->roles as $role) {
        //     $user->retract($role);
        // }
        // foreach ($request->input('roles') as $role) {
        //     $user->assign($role);
        // }

        return redirect()->route('admin.investment.index');
    }
    public function show(Investment $investment)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }

       $id = $investment->user_id;
        $user = User::where('id',$id)->get();
        return view('admin.investment.show', compact('investment','user'));

        //return view('admin.users.show', compact('user'));
    }

    /**
     * Remove User from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        $investment = Investment::findOrFail($id);
        $investment->delete();

        return redirect()->route('admin.investment.index');
    }

    /**
     * Delete all selected User at once.
     *
     * @param Request $request
     */
    public function massDestroy(Request $request)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        User::whereIn('id', request('ids'))->delete();

        return response()->noContent();
    }
 public function gen_uuid() {
    return sprintf( '%04x-%04x-%04x-%04x',
        // 32 bits for "time_low"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

        // 16 bits for "time_mid"
        mt_rand( 0, 0xffff ),

        // 16 bits for "time_hi_and_version",
        // four most significant bits holds version number 4
        mt_rand( 0, 0x0fff ) | 0x4000,

        // 16 bits, 8 bits for "clk_seq_hi_res",
        // 8 bits for "clk_seq_low",
        // two most significant bits holds zero and one for variant DCE1.1
        mt_rand( 0, 0x3fff ) | 0x8000,

        // 48 bits for "node"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
    );
   
}



}
