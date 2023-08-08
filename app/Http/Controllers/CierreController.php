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
        // $detalle = $request->listcuadre;
        $detalle = new DetalleCierre();
        var_dump($detalle->request->cierre_id);
        $this->storeDetalle(22, $detalle);
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
            return DetalleCierre::create([$data]);
        }       
    }
}