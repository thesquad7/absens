<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kelas extends Model
{
    use HasFactory;
    protected $table = "kelas";
	protected $primaryKey = "id";
	public $incrementing = false;
	protected $fillable = [
		'name',
	];
}