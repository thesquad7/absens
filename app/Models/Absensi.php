<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Absensi extends Model
{
    use SoftDeletes, HasFactory;
    public $incrementing = false;
    protected $table = 'absensis';
    protected $fillable=[
        'id',
        'user_id',
        'dosen_id',
        'matkul_id',
        'tahun_id',
        'aprovals',
        'status', 
        'created_at', 
        'updated_at'
    ];
    public function barang()
    {
        return $this->belongsTo(Barang::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function dosen()
    {
        return $this->belongsTo(User::class,'dosen_id');
    }
    public function matkul()
    {
        return $this->belongsTo(MataKuliah::class);
    }
    public function tahun()
    {
        return $this->belongsTo(TahunAjar::class);
    }

}
