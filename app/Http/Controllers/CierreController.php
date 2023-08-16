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

    public function getFullCierre(Request $request, $id)
    {
        $path = 'C:/Users/Marcos Javier/Documents/pruebas pdf/cierre.pdf';        
        $data = Cierre::join('detalle_cierres','detalle_cierres.cierre_id','=','cierres.id')
                ->where('cierre_id', $id)
                ->get(['cierres.*',
                 'detalle_cierres.cajero',
                 'detalle_cierres.tasa',
                 'detalle_cierres.efectivo',
                 'detalle_cierres.punto',
                 'detalle_cierres.transferencia',
                 'detalle_cierres.pendiente',
                 'detalle_cierres.cash',
                 'detalle_cierres.zelle',
                 'detalle_cierres.premium',
                 'detalle_cierres.monto_total',
                 'detalle_cierres.diferencia']);
                $datos = json_decode($data);
                $this->fpdf = new PDF;
                $this->fpdf->AddPage('L');
                $this->fpdf->SetFont('Courier', 'B', 12);
                $this->fpdf->Cell(40, 8, $datos[0]->supervisor, 1);
                $this->fpdf->Cell(40, 8, $datos[0]->fecha, 1);
                $this->fpdf->Cell(25, 8, $datos[0]->hora, 1);
                $this->fpdf->Cell(10, 8, $datos[0]->monto, 1);
                $this->fpdf->ln(10);
                $this->fpdf->Cell(40, 8, 'Cajero', 1);
                $this->fpdf->Cell(20, 8, 'Tasa', 1);
                $this->fpdf->Cell(25, 8, 'Hora', 1);
                $this->fpdf->Cell(20, 8, 'Efectivo', 1);
                $this->fpdf->Cell(20, 8, 'Punto', 1);
                $this->fpdf->Cell(20, 8, 'Transferencia', 1);
                $this->fpdf->Cell(20, 8, 'Pendiente', 1);
                $this->fpdf->Cell(20, 8, 'Dolares', 1);
                $this->fpdf->Cell(20, 8, 'Zelle', 1);
                $this->fpdf->Cell(20, 8, 'Premium', 1);
                $this->fpdf->Cell(20, 8, 'Total caja', 1);
                $this->fpdf->Cell(20, 8, 'Diferencia', 1);
                $this->fpdf->ln();
                foreach ($datos as $value) {
                $this->fpdf->Cell(40, 8, $value->cajero, 1);
                $this->fpdf->Cell(20, 8, $value->tasa, 1);
                $this->fpdf->Cell(25, 8, $value->hora, 1);
                $this->fpdf->Cell(20, 8, $value->efectivo, 1);
                $this->fpdf->Cell(20, 8, $value->punto, 1);
                $this->fpdf->Cell(20, 8, $value->transferencia, 1);
                $this->fpdf->Cell(20, 8, $value->pendiente, 1);
                $this->fpdf->Cell(20, 8, $value->cash, 1);
                $this->fpdf->Cell(20, 8, $value->zelle, 1);
                $this->fpdf->Cell(20, 8, $value->premium, 1);
                $this->fpdf->Cell(20, 8, $value->monto_total, 1);
                $this->fpdf->Cell(20, 8, $value->diferencia, 1);
                $this->fpdf->ln();
                }
                $this->fpdf->Output('D', 'cierre.pdf');
                // // return response()->json($data);
    } 
}

class PDF extends FPDF
{
    function Header(){
        // Select Arial bold 15
        $this->SetFont('Arial', 'B', 15);
        // Move to the right
        $this->Cell(40);
        // Framed title
        $this->Cell(300, 10, 'Title', 1, 0, 'C');
        // Line break
        $this->Ln(20);
    }

    function Footer(){
        // Posición: a 1,5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial','I',8);
        // Número de página
        $this->Cell(0,10,'Page '.$this->PageNo().'/1',0,0,'C');
    }
}