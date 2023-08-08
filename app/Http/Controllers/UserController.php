<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function getUserById($id){
        $user = User::find($id);
        if (is_null($user)) {
            return response()->json(['Mensaje'=>'Registro no se encontro',404]);
        }
        return response()->json($user,200);
    }

    public function storeUsers(Request $request){
        $user = User::create($request->all());
        return response()->json(['Mensaje'=>'Registro exitoso'],200);
    }

    public function modifyUsers(Request $request, $id){
        $user = User::find($id);
        if (is_null($user)) {
            return response()->json(['Mensaje'=>'Registro no se encontro',404]);
        }
        $user->update($request->all());
        return response($user,200);
    }

    public function eraseUsers($id){
        $user = User::find($id);
        if (is_null($user)) {
            return response()->json(['Mensaje'=>'Registro no se encontro',404]);
        }
        $user->delete();
        return response()->json(['Mensaje'=>'Registro eliminado'],200);
    }
}