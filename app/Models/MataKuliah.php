<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MataKuliah extends Model
{
    use HasFactory;
    protected $table = "matakuliahs";
	protected $primaryKey = "id";
	public $incrementing = false;
	protected $fillable = [
		'name',
	];
}
