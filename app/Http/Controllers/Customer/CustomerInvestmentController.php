<?php

namespace App\Http\Controllers\Customer;
use Auth;
use App\Http\Requests\Admin\StoreAbilitiesRequest;
use App\Http\Requests\Admin\UpdateAbilitiesRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use App\Http\Controllers\Controller;
use App\Investment;
use App\User;
use App\Share;
use DB;
use Stripe;
use Session;
use PDF;
use Mail;

class CustomerInvestmentController extends Controller
{
    /**
     * Display a listing of Investment.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (! Gate::allows('is_customer')) {
            return abort(401);
        }

        $id = Auth::user()->getId();
        $investments = Investment::where('user_id',$id)->get();
        $user = User::where('id',$id)->get();

        return view('customer.investment.index', compact('investments','user'));
    }

    /**
     * Show the form for creating new Ability.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (! Gate::allows('is_customer')) {
            return abort(401);
        }
        return view('customer.investment.create');
    }

    /**
     * Store a newly created Ability in storage.
     *
     * @param  \App\Http\Requests\StoreAbilitiesRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (! Gate::allows('is_customer')) {
            return abort(401);
        }
        $invest = Investment::create($request->all());

// $ia = 'total_investment+'.$request->investment_amount;
//         $affected = User::where('id', $request->user_id)
//               ->update(['total_investment' => DB::raw($ia)]);




         $response = null;
        $amount = $request->investment_amount * 100;

        $email = Auth::user()->getEmail();
        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        try{


        $charge = Stripe\Charge::create ([
                "amount" => $amount,
                "currency" => "usd",
                "source" => $request->stripeToken,
                "description" => $email
        ]);

        


    } catch (Exception $e) {
        //print_r($charge);
        $response = json_encode([
                'errors' => $e->getMessage()
            ]);
    }
        

        if ($charge->status == 'succeeded') {
            //update recent investment
                $user_id = Auth::user()->getId();
                $affected = Investment::where('id', $invest->id)
                      ->update(['transaction_id'=>$charge->id,'payment_status' => 1 , 'investment_status' => 1, 'payment_source' => 'card']);

                $ia = 'total_investment+'.$request->investment_amount;
                $affected = User::where('id', $user_id)
              ->update(['total_investment' => DB::raw($ia)]);

              //store the shares
              $no_of_shares = ($request->investment_amount)/50;

              for ($i=0; $i < $no_of_shares ; $i++) { 
                # code...
                $share_id = $this->gen_uuid();
                Share::insert([
                    'share_id' => $share_id,
                    'user_id' => $user_id,
                    'investment_id' => $invest->id,
                    'user_email' => $email
                ]);
              }
        
                

        }else{
            $response = json_encode([
                    'errors' => ['Charge failed', $e->getMessage()]
                ]);
        }

  
        // 
        //echo $response;


        return redirect()->route('customer.investment.index');
    }



 public function updateinvestmentsource(Request $request)
    {
        // if($request->email != "" && $request->investment != "")
        // {
        //     //get user id to store investment
        //     $user = User::where('email', $request->email)->first();
        //     $investment = Investment::insert([
        //                 'user_id' => $user->id,
        //                 'investment_amount' => $request->investment
        //             ]);

        //      // Return success
        //         return response()->json(
        //           [
        //             'status' => 'OK',
        //             'data' => $investment,
        //             'message' => 'success',
        //           ],200
        //         );

            
        // }
        // else{
      if($request->payment_source == 'card')
      {

$shares = Share::where('user_email',$request->email)->get();


//change to $request->email
      $data["email"] = $request->email;
        $data["title"] = "Investment Confirmation (www.hoopstreet.com)";

         $data["name"] = $request->name;
        $data["shares"] = $shares;
        $n_share = 0;
        $total_investment = 0;
       
        foreach ($shares as $share) {
          # code...

          $n_share = $n_share +1;

        }
        $total_investment = $n_share *50;
        $data["no_of_shares"] = $n_share;
         $data["total_investment"] = $total_investment;
        
  
        $pdf = PDF::loadView('emails.myTestMail', $data);
  
        Mail::send('emails.myTestMail', $data, function($message)use($data, $pdf) {
            $message->to($data["email"], $data["email"])
                    ->subject($data["title"])
                    ->attachData($pdf->output(), "text.pdf");
        });

      }

      //else send him reminder aout bank investment 
  
        //dd('Mail sent successfully');
            return response()->json(
              [
                'status' => 'OK',
                'data' => "",
                'message' => '',
              ],200);
        //}
        

        //return redirect()->route('customer.investment.index');
    }



 public function addinvestment(Request $request)
    {
        if($request->email != "" && $request->investment != "")
        {
            //get user id to store investment
            $user = User::where('email', $request->email)->first();
            $investment = Investment::insert([
                        'user_id' => $user->id,
                        'investment_amount' => $request->investment
                    ]);

             // Return success
                return response()->json(
                  [
                    'status' => 'OK',
                    'data' => $investment,
                    'message' => 'success',
                  ],200
                );

            
        }
        else{
            return response()->json(
              [
                'status' => 'ERROR',
                'data' => "",
                'message' => 'investment can\'t be empty',
              ],200);
        }
        

        //return redirect()->route('customer.investment.index');
    }



    /**
     * Show the form for editing Ability.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        $ability = Investment::findOrFail($id);

        return view('admin.abilities.edit', compact('ability'));
    }

    /**
     * Update Ability in storage.
     *
     * @param  \App\Http\Requests\UpdateAbilitiesRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAbilitiesRequest $request, $id)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        $ability = Investment::findOrFail($id);
        $ability->update($request->all());

        return redirect()->route('admin.abilities.index');
    }

    public function show(Investment $investment)
    {
        if (! Gate::allows('is_customer')) {
            return abort(401);
        }

        $id = Auth::user()->getId();
        $user = User::where('id',$id)->get();
        return view('customer.investment.show', compact('investment','user'));
    }

    /**
     * Remove Ability from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        $ability = Ability::findOrFail($id);
        $ability->delete();

        return redirect()->route('admin.abilities.index');
    }

    /**
     * Delete all selected Ability at once.
     *
     * @param Request $request
     */
    public function massDestroy(Request $request)
    {
        if (! Gate::allows('users_manage')) {
            return abort(401);
        }
        Ability::whereIn('id', request('ids'))->delete();

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
