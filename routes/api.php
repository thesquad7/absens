<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\SettingController;
use App\Http\Controllers\Api\OutputController;
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
    
    //Mahasiswa CRUD
    Route::get('mahasiswa', [MahasiswaController::class, 'index']);
    Route::get('mahasiswa/{id}', [MahasiswaController::class,'show']);
    Route::post('mahasiswa', [MahasiswaController::class, 'store']);
    Route::put('mahasiswa/{id}', [MahasiswaController::class, 'update']);
    Route::delete('mahasiswa/{id}', [MahasiswaController::class, 'destroy']);
    
    //Api User
    Route::get('user', [UserController::class, 'index']);
    Route::post('logout', [AuthController::class, 'logout']);

    //Api For Setting
    Route::get('/tahun',[SettingController::class, 'tahun']);
    Route::get('/matkul',[SettingController::class, 'matkul']);
    Route::get('/smester',[SettingController::class, 'smester']);
    Route::get('/kelas',[SettingController::class, 'kelas']);
    //API Import

    //API Output
    Route::get('/mahasiswa_data',[OutputController::class, 'mahasiswa']);

    

    //API Memulai
    Route::post('first', [UserController::class, 'first']);
});
Route::post('registrasi', [UserController::class, 'store']);
Route::post('/login',[AuthController::class, 'login']);
Route::get('/role',[SettingController::class, 'role']);
