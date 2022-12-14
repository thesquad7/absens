<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\Role;

class User extends Authenticatable
{
    use HasFactory, HasApiTokens;
    public $incrementing = false;
    protected $table = 'users';
    protected $fillable = [
        'id',
        'name',
        'password',
        'role_id',  
        'id_pengguna',
        'first'
    ];
    protected $hidden = [
        'password',
        'remember_token',
    ];
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function mahasiswa()
    {
        return $this->belongsTo(Mahasiswa::class);
    }
    public function role()
    {
        return $this->belongsTo(Role::class);
    }
    public function getCreatedAtAttribute()
    {
        return \Carbon\Carbon::parse($this->attributes['created_at'])
        ->format('d, M Y H:i');
    }
}
