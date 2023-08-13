<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DetalleCierre;

class DetalleCierreController extends Controller
{
    function getDetails(Request $request, $id) {        
        $detalle = DetalleCierre::where('cierre_id',$id)->get();
        if (is_null($detalle)) {
            return response()->json(['Mensaje'=>'Registro no se encontro',404]);
        }
        return response($detalle);
    }
}
