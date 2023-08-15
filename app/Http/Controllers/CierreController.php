<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cierre;
use App\Models\DetalleCierre;
use Codedge\Fpdf\Fpdf\Fpdf;
use Response;

class CierreController extends Controller
{
    private $fpdf;

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
                'fecha' => $value['fecha'],
                'hora' => $value['hora'],
                'cajero' => $value['cajero'],
                'tasa' => $value['tasa'],
                'efectivo' => $value['efectivo'],
                'punto' => $value['punto'],
                'transferencia' => $value['transferencia'],
                'pendiente' => $value['pendiente'],
                'cash' => $value['cash'],
                'zelle' => $value['zelle'],
                'premium' => $value['premium'],
                'monto_total' => $value['monto_total'],
                'diferencia' => $value['diferencia'],
            ];
            DetalleCierre::create($data);
        }       
    }

    public function getFullCierre(Request $request)
    {
        $path = 'C:/Users/Marcos Javier/Documents/pruebas pdf/cierre.pdf';        
        $data = Cierre::join('detalle_cierres','detalle_cierres.cierre_id','=','cierres.id')
                ->select('*')
                ->get();
                $this->fpdf = new Fpdf;
                $this->fpdf->AddPage('L');
                $this->fpdf->SetFont('Courier', 'B', 18);
                foreach ($data as $value) {
                    $this->fpdf->MultiCell(50, 25, $value->supervisor);
                }
                return $this->fpdf->Output('F', $path);
                // return response($data);
                // exit;
    }

    // public function Header(){
    //     $this->fpdf = new Fpdf;
    //     // Select Arial bold 15
    //     $this->fpdf->SetFont('Arial', 'B', 15);
    //     // Move to the right
    //     $this->fpdf->Cell(80);
    //     // Framed title
    //     $this->fpdf->Cell(30, 10, 'Title', 1, 0, 'C');
    //     // Line break
    //     $this->fpdf->Ln(20);
    // }
 
}

class PDF extends FPDF
{
    function Header()
    {
        // Select Arial bold 15
        $this->SetFont('Arial', 'B', 15);
        // Move to the right
        $this->Cell(80);
        // Framed title
        $this->Cell(30, 10, 'Title', 1, 0, 'C');
        // Line break
        $this->Ln(20);
    }
}