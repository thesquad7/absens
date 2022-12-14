<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request){
        if (!Auth::attempt($request->only('id_pengguna', 'password')))
        {
            return response()
                ->json([
                    'success' => false,
                    'message' => 'Unauthorized'],
                     401);
        }

        $user = User::where('id_pengguna', $request['id_pengguna'])->firstOrFail();

        $token = $user->createToken('auth_token')->plainTextToken;
        $first = $user->first;
        if($first == true){
            User::where('id_pengguna', $request->id_pengguna)->update([
                'first' => false,
            ]);
            return response()->json([
                'first' => true,
                'access_token' => $token,
                'token_type' => 'Bearer',
            ]);
            Auth::user()->save();
        }else{
            return response()
            ->json([
                'first' => false,
                'success' => true,
                'message' => 'Hi '.$user->name.', Anda Sudah Login',
                'user' => $user->name,
                'role' =>$user->role_id,
                'id'    => $user->id_pengguna,
                'access_token' => $token,
                'token_type' => 'Bearer', 
            ]);
        }
           
    }
    public function logout(Request $request) {
        if ($request->user()) { 
            $request->user()->tokens()->delete();
        }
        $respon = [
            'success' => true,
            'msg' => 'Logout successfully',
        ];
        return response()->json($respon, 200);
    }
}
