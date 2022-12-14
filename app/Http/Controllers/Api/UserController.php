<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\User;
use App\Models\Dosen;
use App\Models\Mahasiswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Ramsey\Uuid\Uuid;
use Symfony\Component\HttpFoundation\Response;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = User::all();
        return response()->json(['Data User : ', UserResource::collection($data) ], Response::HTTP_OK);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name'                  => 'required',
            'id_pengguna'           => 'required',
            'password'              => 'required',
            'role_id'               => 'required'

        ],[
            'id_pengguna.unique'                    =>'id sudah digunakan',
            'name.required'                         =>'Nama tidak boleh kosong',
            'password.required'                     =>'kata sandi tidak boleh kosong',
            'role-id.required'                      =>'Role tidak boleh kosong'        
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(), 
            Response::HTTP_UNPROCESSABLE_ENTITY);
        }
        try
        {
            $user = User::create([
                'id'    => Uuid::uuid4()->getHex(),
                'id_pengguna'   => $request->id_pengguna,
                'name'  => $request->name,
                'password' => Hash::make($request->password),
                'role_id' => $request->role_id,
                'first' => 1

            ]);
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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
