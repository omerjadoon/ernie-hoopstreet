<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SampleMail extends Mailable
{
    use Queueable, SerializesModels;

    private $emailParams;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($emailParams)
    {
        $this->emailParams = $emailParams;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {



        return $this->from('omerjadoon1@gmail.com', 'Sample Name')
        ->subject("hello")
        ->view('emails.myTestMail')
        
        ->with(
            $this->emailParams
          );
        
    }
}