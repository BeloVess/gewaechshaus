<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Record extends Model
{
    protected $fillable = ['measured_at', 'isActive', 'sensor_id', 'value'];
}
