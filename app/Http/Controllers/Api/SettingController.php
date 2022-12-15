<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\RoleResource;
use App\Models\Role;
use App\Models\TahunAjar;
use App\Models\MataKuliah;
use App\Models\Smester;
use App\Models\Kelas;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SettingController extends Controller
{
    public function role(){
        $data = Role::all();
        return response()->json(RoleResource::collection($data), Response::HTTP_OK);
    }

    public function tahun(){
        $data = TahunAjar::all();
        return response()->json(RoleResource::collection($data), Response::HTTP_OK);
    }
    public function matkul(){
        $data = MataKuliah::all();
        return response()->json(RoleResource::collection($data), Response::HTTP_OK);
    }
    public function smester(){
        $data = Smester::all();
        return response()->json(RoleResource::collection($data), Response::HTTP_OK);
    }
    public function kelas(){
        $data = Kelas::all();
        return response()->json(RoleResource::collection($data), Response::HTTP_OK);
    }

}
