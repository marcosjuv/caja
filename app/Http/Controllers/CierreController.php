<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cierre;
use App\Models\DetalleCierre;
use Response;

class CierreController extends Controller
{
    function storeCierre(Request $request){
        $cierre = Cierre::create($request->all());
        $getId = Cierre::latest('id')->first();
        $id = $getId->id;
        $detalle = $request->listcuadre;
        $this->storeDetalle($id, $detalle);
        return response()->json(['Mensaje'=>'Registro exitoso'],200);
    }

    function storeDetalle($id, $detalle) {
        foreach ($detalle as $value) {
            $data = [
                'cierre_id' => $id,
                'caja' => $value['caja'],
                'supervisor' => $value['supervisor'],
                'cajero' => $value['cajero'],
                'tasa' => $value['tasa'],
                'efectivo' => $value['efectivo'],
                'punto' => $value['punto'],
                'transferencia' => $value['transferencia'],
                'pendiente' => $value['pendiente'],
                'cash' => $value['cash'],
                'zelle' => $value['zelle'],
                'premium' => $value['premium'],
                'monto_total' => $value['totalbs'],
                'diferencia' => $value['diferenciabs'],
            ];
            DetalleCierre::create($data);
        }       
    }

    public function getFullCierre(Request $request, $id)
    {
        $detalle_cierre = DetalleCierre::where('cierre_id', $id)->get();
        // foreach ($detalle_cierre as $value) {
        //     return $value;
        // }
            return $detalle_cierre;
    }
}