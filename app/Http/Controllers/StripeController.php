<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Stripe;
use Session;
use App\Investment;
use App\User;
use App\Share;
use DB;

class StripeController extends Controller
{
    /**
     * payment view
     */
    public function handleGet()
    {
        return view('home');
    }
  
    /**
     * handling payment with POST
     */
    public function handlePost(Request $request)
    {

		$response = null;
    	$amount = $request->amount * 100;

        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        try{


        $charge = Stripe\Charge::create ([
                "amount" => $amount,
                "currency" => "usd",
                "source" => $request->stripe_token,
                "description" => $request->description 
        ]);

        


    } catch (Exception $e) {
		//print_r($charge);
		$response = json_encode([
				'errors' => $e->getMessage()
			]);
	}
        

        if ($charge->status == 'succeeded') {
            //update recent investment
                $user = User::where('email', $request->email)->first();
                $investment = Investment::where('user_id',  $user->id)->first();
                $affected = Investment::where('user_id', $user->id)
                      ->update(['transaction_id'=>$charge->id,'payment_status' => 1 , 'investment_status' => 1, 'payment_source' => 'card']);

                $ia = 'total_investment+'.$request->amount;
                $affected = User::where('id', $user->id)
              ->update(['total_investment' => DB::raw($ia)]);
              //store the shares
              $no_of_shares = ($request->amount)/50;

              for ($i=0; $i < $no_of_shares ; $i++) { 
                # code...
                $share_id = $this->gen_uuid();
                Share::insert([
                    'share_id' => $share_id,
                    'user_id' => $user->id,
                    'investment_id' => $investment->id,
                    'user_email' => $user->email
                ]);
              }

        
				$response = json_encode([
									'msg'				=> 'Charge successful',
									'amount'			=> ($charge->amount / 100), //again convert amount to usd from pence :D
									'status'			=> $charge->status,
									'transaction_id'	=> $charge->id,
									'captured'			=> $charge->captured,
									'created'			=> $charge->created,
									'currency'			=> $charge->currency,
									'description'		=> $charge->description,
									'paid'				=> $charge->paid,
									'email'				=> "sent"
								]);

        }else{
        	$response = json_encode([
					'errors' => ['Charge failed', $e->getMessage()]
				]);
        }

  
        // 
        echo $response;
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