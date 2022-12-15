<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Kelas;

class Mahasiswa extends Model
{
    use HasFactory;
    public $incrementing = false;
    protected $table = 'mahasiswas';
    protected $fillable = [
        'id', 'nim', 'name', 'kelas_id','user_id', 'tahun_id','smester',
    ];
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
    public function kelas()
    {
        return $this->belongsTo(Kelas::class);
    }
    public function tahunajar()
    {
        return $this->belongTo('App\Models\TahunAjar','tahun_id');
    }
}
