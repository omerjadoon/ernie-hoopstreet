<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
/**
 * Class User
 *
 * @package App
 * @property string $name
 * @property string $email
 * @property string $password
 * @property string $remember_token
*/
class Share extends Model
{
    protected $fillable =[
         "share_id","investment_id", "user_email",
        "user_id"
    ];

    public function sale()
    {
    	return $this->hasMany('App\Sale');
    }
}
