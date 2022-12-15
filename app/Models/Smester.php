<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Smester extends Model
{
    use HasFactory;
    protected $table = "semesters";
	protected $primaryKey = "id";
	public $incrementing = false;
	protected $fillable = [
		'name',
	];
}
