<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    public function facilities()
    {
        return $this->hasMany('App\Facility');
    }

    public function rooms()
    {
        return $this->hasMany('App\Room');
    }
}