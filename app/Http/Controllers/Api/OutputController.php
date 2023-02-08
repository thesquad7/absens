<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\RoleResource;
use App\Http\Resources\MahasiswaResource;
use App\Models\Mahasiswa;
use App\Models\Role;
use App\Models\TahunAjar;
use App\Models\MataKuliah;
use App\Models\Smester;
use App\Models\Kelas;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class OutputController extends Controller
{
    public function mahasiswa(){
        $data = Mahasiswa::all();
        return response()->json(MahasiswaResource::collection($data), Response::HTTP_OK);
    }


}
