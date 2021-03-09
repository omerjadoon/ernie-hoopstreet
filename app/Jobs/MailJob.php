<?php

namespace App\Jobs;

use App\Jobs\Job;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Mail\SampleMail;
use Illuminate\Http\Request;

use App\User;
use App\Share;
use DB;
use Stripe;
use Session;
use PDF;

class MailJob extends Job implements ShouldQueue
{
    use InteractsWithQueue, SerializesModels;

    protected $emailJobParams;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($emailJobParams)
    {
        $this->emailJobParams = $emailJobParams;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        Log::info('Sample Mail Job START! ...');

        $this->sendSampleMail($this->emailJobParams);

        Log::info('Sample Mail Job END! ...');
    }

    private function sendSampleMail($emailParams)
    {


        $user = User::where('id', $emailParams->user_id)->first();
        //store the shares
              $no_of_shares = ($emailParams->investment->investment_amount)/50;

              for ($i=0; $i < $no_of_shares ; $i++) { 
                # code...
                $share_id = $this->gen_uuid();
                Share::insert([
                    'share_id' => $share_id,
                    'user_id' => $emailParams->investment->user_id,
                    'investment_id' => $emailParams->investment->id,
                    'user_email' => $user->email
                ]);
              }

        //send email
              $shares = Share::where('user_email',$user->email)->where('investment_id',$emailParams->investment->id)->get();


//change to $request->email
      $data["email"] = $user->email;
        $data["title"] = "Investment Confirmation (www.hoopstreet.com)";

         $data["name"] = $user->name;
        $data["shares"] = $shares;
        $n_share = 0;
        $total_investment = 0;
       
        //foreach ($shares as $share) {
          # code...

          $n_share = count($shares);

        //}
        $total_investment = $n_share *50;
        $data["no_of_shares"] = $n_share;
         $data["total_investment"] = $total_investment;
        
  // $pdf = PDF::loadView('emails.myTestMail', $data);
  //   $data["pdf"] = $pdf;
//$to_name = "omer";
$to_email = "omerjadoon1@gmail.com";
//$data = array("name"=>"Omer k", "body" => "hello testing");
Mail::send("emails.myTestMail", $data, function($message) use ($data, $to_email) {
$message->to($data["email"], $data["email"])
->subject($data["title"]);
$message->from("hooperinie@gmail.com","Hoop Street Inc");
});


        
  
        // Mail::send('emails.myTestMail', $data, function($message)use($data, $pdf) {
        //     $message->to($data["email"], $data["email"])
        //             ->subject($data["title"])
        //             ->attachData($pdf->output(), "Invoice.pdf");
        // });

        //Mail::to($emailParams->to_mail)->send(new SampleMail($emailParams));
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