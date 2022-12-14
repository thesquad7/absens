<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TahunAjar extends Model
{
    use HasFactory;
    protected $table = "TahunAjars";
	protected $primaryKey = "id";
	public $incrementing = false;
	protected $fillable = [
		'name',
	];
}
