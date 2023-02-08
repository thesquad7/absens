<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mahasiswa;
use App\Models\TahunAjar;
use App\Models\Smester;
use App\Models\MataKuliah;
use App\Models\Kelas;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Ramsey\Uuid\Uuid;

class input extends Controller
{
public function MahasiswaStore(Request $request)
{
$validator = Validator::make($request->all(),[
    'name'                  => 'required',
    'id_pengguna'           => 'required',

],[
    'id_pengguna.unique'                    =>'id sudah digunakan',
    'name.required'                         =>'Nama tidak boleh kosong',
   
]);
if($validator->fails()){
    return response()->json($validator->errors(), 
    Response::HTTP_UNPROCESSABLE_ENTITY);
}
try
{
    if
    $condition = $request->role_id;
    if($condition == 1){
        $dosen = Dosen::create(
           [
            'id'    => Uuid::uuid4()->getHex(),
            'nip'   => $request->id_pengguna,
            'name'  => $request->name,
            'keterangan' => 'Dosen Polindra' 
           ]
           );
    }if($condition == 2){
        $mahasiswa = Mahasiswa::create(
           [ 
           'id'    => Uuid::uuid4()->getHex(),
           'nim'   => $request->id_pengguna,
           'name'  => $request->name
            ]
        );
    }else{
        $response = [
            'message'   => 'Status tidak ditemukan',
            'data'      => $user
        ];
    }
    $response = [
        'message'   => 'Akut berhasil didaftarkan',
        'data'      => $user
    ];
    return response()->json($response, Response::HTTP_CREATED);
}
catch(QueryException $e)
{
    return response()->json([
        'message' => "Failed" . $e->errorInfo
    ]);
}
}
}
