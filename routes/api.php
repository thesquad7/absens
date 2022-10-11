<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MahasiswaController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    // return $request->user();
// });

Route::group(['middleware' => 'auth:sanctum'], function(){

    Route::get('mahasiswa', [MahasiswaController::class, 'index']);
    Route::get('mahasiswa/{id}', [MahasiswaController::class,'show']);
    Route::post('mahasiswa', [MahasiswaController::class, 'store']);
    Route::put('mahasiswa/{id}', [MahasiswaController::class, 'update']);
    Route::delete('mahasiswa/{id}', [MahasiswaController::class, 'destroy']);
    
    //Api User
    Route::get('user', [UserController::class, 'index']);
    Route::post('logout', [AuthController::class, 'logout']);

});

Route::post('/login',[AuthController::class, 'login']);
