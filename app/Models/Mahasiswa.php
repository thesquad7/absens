<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mahasiswa extends Model
{
    use HasFactory;
    public $incrementing = false;
    protected $table = 'mahasiswas';
    protected $fillable = [
        'id', 'nim', 'name', 'kelas_id','user_id'
    ];
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
    public function kelas()
    {
        return $this->belongsTo('App\Models\Kelas','kelas_id');
    }
}
