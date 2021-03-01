<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Divident
 *
 * @package App
 * @property string $name
 * @property string $email
 * @property string $password
 * @property string $remember_token
*/
class Divident extends Model
{
    protected $fillable =[
        "divident_amount", "user_id"
    ];

    public function sale()
    {
    	return $this->hasMany('App\Sale');
    }
}

