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
        // return response()->json(['Mensaje'=>'Registro exitoso'],200);
        return response()->json($cierre,200);
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
            return response()->json($data,200);
        }       
    }

    public function getFullCierre(Request $request, $id)
    {
        // $path = dirname(__FILE__);
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
                // dd($path);
                $datos = json_decode($data);
                $dolares = number_format($datos[0]->monto/$datos[0]->tasa, 2, '.', ',');
                $this->fpdf = new PDF_MC_Table;
                $this->fpdf->AliasNbPages();
                $this->fpdf->AddPage('L');
                $this->fpdf->SetAutoPageBreak(true, 20);
                $this->fpdf->SetMargins(10,15,10);
                $this->fpdf->SetFont('Courier','B', 14);
                $this->fpdf->ln(20);
                $this->fpdf->Cell(45, 8, 'Supervisor(a):',0,0,'L');
                $this->fpdf->Cell(100, 8, $datos[0]->supervisor,0,0,'L');
                $this->fpdf->Cell(30, 8, 'Fecha:',0,0,'R');
                $this->fpdf->Cell(45, 8, date('d-m-Y', strtotime($datos[0]->fecha)),0,0,'L');
                $this->fpdf->Cell(25, 8, 'Hora:',0,0,'R');
                $this->fpdf->Cell(30, 8, date('h:i A', strtotime($datos[0]->hora)),0,0,'L');                
                $this->fpdf->ln();
                $this->fpdf->Cell(70, 8, 'Monto total del cierre: ',0,0,'L');
                $this->fpdf->Cell(25, 8, 'Bs.'.$datos[0]->monto.' /',0,0,'C');
                $this->fpdf->Cell(30, 8, '$.'.$dolares,0,0,'L');
                $this->fpdf->ln(10);
                $this->fpdf->SetFillColor(150, 150, 150);
                $this->fpdf->SetFont('Courier', 'B', 12);
                $this->fpdf->Cell(35, 8, 'Cajero', 1,0,'',true);
                $this->fpdf->Cell(15, 8, 'Tasa', 1,0,'',true);
                $this->fpdf->Cell(25, 8, 'Hora', 1,0,'',true);
                $this->fpdf->Cell(23, 8, 'Efectivo', 1,0,'',true);
                $this->fpdf->Cell(20, 8, 'Punto', 1,0,'',true);
                $this->fpdf->Cell(20, 8, 'Transf', 1,0,'',true);
                $this->fpdf->Cell(25, 8, 'Pendiente', 1,0,'',true);
                $this->fpdf->Cell(20, 8, 'Dolares', 1,0,'',true);
                $this->fpdf->Cell(20, 8, 'Zelle', 1,0,'',true);
                $this->fpdf->Cell(20, 8, 'Premium', 1,0,'',true);
                $this->fpdf->Cell(25, 8, 'Total. C', 1,0,'',true);
                $this->fpdf->Cell(25, 8, 'Dif', 1,0,'',true);
                $this->fpdf->ln();
                $this->fpdf->SetFont('Courier','', 12);
                $this->fpdf->SetWidths(array(35, 15, 25, 23, 20, 20, 25, 20, 20, 20, 25, 25));
                foreach ($datos as $value) {
                    $this->fpdf->Row(array(
                        $value->cajero,
                        $value->tasa, 
                        date('h:i A', strtotime($value->hora)), 
                        $value->efectivo, 
                        $value->punto, 
                        $value->transferencia, 
                        $value->pendiente, 
                        $value->cash, 
                        $value->zelle, 
                        $value->premium, 
                        $value->monto_total, 
                        $value->diferencia));
                
                }
                $this->fpdf->Output('F', $path);
                // $this->fpdf->Output('D', 'cierre.pdf');
                 // return response()->json([$value]);
    } 
}

class PDF_MC_Table extends FPDF
{
    protected $widths;
    protected $aligns;

    function SetWidths($w)
    {
        // Set the array of column widths
        $this->widths = $w;
    }

    function SetAligns($a)
    {
        // Set the array of column alignments
        $this->aligns = $a;
    }

    function Row($data)
    {
        // Calculate the height of the row
        $nb = 0;
        for($i=0;$i<count($data);$i++)
            $nb = max($nb,$this->NbLines($this->widths[$i],$data[$i]));
        $h = 5*$nb;
        // Issue a page break first if needed
        $this->CheckPageBreak($h);
        // Draw the cells of the row
        for($i=0;$i<count($data);$i++)
        {
            $w = $this->widths[$i];
            $a = isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
            // Save the current position
            $x = $this->GetX();
            $y = $this->GetY();
            // Draw the border
            $this->Rect($x,$y,$w,$h);
            // Print the text
            $this->MultiCell($w,5,$data[$i],0,$a);
            // $this->MultiCell($w,5,$data[$i],'B','T',$a);
            // Put the position to the right of the cell
            $this->SetXY($x+$w,$y);
        }
        // Go to the next line
        $this->Ln($h);
    }

    function CheckPageBreak($h)
    {
        // If the height h would cause an overflow, add a new page immediately
        if($this->GetY()+$h>$this->PageBreakTrigger)
            $this->AddPage($this->CurOrientation);
    }

    function Header(){       
        // Select Arial bold 15
        $this->SetFont('Arial', 'B', 30);
        $img = 'http://localhost/caja/public/image/logo_reporte.jpg' ;
        $this->Image($img,1, 1, 50, 50);
        // Move to the right
        $this->Cell(5);
        // Framed title
        $this->Cell(270, 20, 'Resumen de Cierre', 0, 0, 'C');
        // Line break
        $this->Ln(20);

        /*$this->SetFont('Courier', 'B', 12);

        $this->Cell(35, 8, 'Cajero', 1);
        $this->Cell(20, 8, 'Tasa', 1);
        $this->Cell(25, 8, 'Hora', 1);
        $this->Cell(23, 8, 'Efectivo', 1);
        $this->Cell(20, 8, 'Punto', 1);
        $this->Cell(20, 8, 'Transf', 1);
        $this->Cell(25, 8, 'Pendiente', 1);
        $this->Cell(20, 8, 'Dolares', 1);
        $this->Cell(15, 8, 'Zelle', 1);
        $this->Cell(20, 8, 'Premium', 1);
        $this->Cell(30, 8, 'Total. C', 1);
        $this->Cell(25, 8, 'Dif', 1);*/
    }

    function Footer(){        
        // Posición: a 1,5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial','I',8);
        // Número de página
        $this->Cell(0,10,'Pagina '.$this->PageNo().'/{nb}',0,0,'C');
        $this->Cell(-40,10,'Fecha '.date('d-m-Y h:i A',strtotime(Now())),0,0,'C');
    }

    function NbLines($w, $txt)
    {
        // Compute the number of lines a MultiCell of width w will take
        if(!isset($this->CurrentFont))
            $this->Error('No font has been set');
        $cw = $this->CurrentFont['cw'];
        if($w==0)
            $w = $this->w-$this->rMargin-$this->x;
        $wmax = ($w-2*$this->cMargin)*1000/$this->FontSize;
        $s = str_replace("\r",'',(string)$txt);
        $nb = strlen($s);
        if($nb>0 && $s[$nb-1]=="\n")
            $nb--;
        $sep = -1;
        $i = 0;
        $j = 0;
        $l = 0;
        $nl = 1;
        while($i<$nb)
        {
            $c = $s[$i];
            if($c=="\n")
            {
                $i++;
                $sep = -1;
                $j = $i;
                $l = 0;
                $nl++;
                continue;
            }
            if($c==' ')
                $sep = $i;
            $l += $cw[$c];
            if($l>$wmax)
            {
                if($sep==-1)
                {
                    if($i==$j)
                        $i++;
                }
                else
                    $i = $sep+1;
                $sep = -1;
                $j = $i;
                $l = 0;
                $nl++;
            }
            else
                $i++;
        }
        return $nl;
    }
}

class PDF extends FPDF
{
    function Header(){
        // Select Arial bold 15
        $this->SetFont('Arial', 'B', 15);
        // Move to the right
        // $this->Cell(0);
        // Framed title
        $this->Cell(270, 10, 'Title', 1, 0, 'C');
        // Line break
        $this->Ln(20);
    }

    function Footer(){
        // Posición: a 1,5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial','I',8);
        // Número de página
        $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
    }
}