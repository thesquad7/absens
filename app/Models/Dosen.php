<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dosen extends Model
{
    use HasFactory;
    public $incrementing = false;
    protected $table = 'dosens';
    protected $fillable = [
        'id', 'nip', 'name', 'keterangan','user_id' 
    ];
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
    public function absensi()
    {
        return $this->hasMany('App\Models\Absensi', 'dosen_id');
    }
}
