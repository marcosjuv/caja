<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Caja;

class CajasController extends Controller
{
    public function getCajaById($id){
        $caja = Caja::find($id);
        if (is_null($caja)) {
            return response()->json(['Mensaje'=>'Registro no se encontro',404]);
        }
        return response()->json($caja,200);
    }

    public function storeCajas(Request $request){
        $caja = Caja::create($request->all());
        return response()->json(['Mensaje'=>'Registro exitoso'],200);
    }

    public function modifyCajas(Request $request, $id){
        $caja = Caja::find($id);
        if (is_null($caja)) {
            return response()->json(['Mensaje'=>'Registro no se encontro',404]);
        }
        $caja->update($request->all());
        return response($caja,200);
    }

    public function eraseCajas($id){
        $caja = Caja::find($id);
        if (is_null($caja)) {
            return response()->json(['Mensaje'=>'Registro no se encontro',404]);
        }
        $caja->delete();
        return response()->json(['Mensaje'=>'Registro eliminado'],200);
    }
}