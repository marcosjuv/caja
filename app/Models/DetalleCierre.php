<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class DetalleCierre
 * 
 * @property int $id
 * @property int $cierre_id
 * @property string $caja
 * @property string $supervisor
 * @property string $cajero
 * @property float $tasa
 * @property float|null $efectivo
 * @property float|null $punto
 * @property float|null $transferencia
 * @property float|null $pendiente
 * @property float|null $cash
 * @property float|null $zelle
 * @property float|null $premium
 * @property float|null $monto_total
 * @property float|null $diferencia
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Cierre $cierre
 *
 * @package App\Models
 */
class DetalleCierre extends Model
{
	protected $table = 'detalle_cierres';

	protected $casts = [
		'cierre_id' => 'int',
		'tasa' => 'float',
		'efectivo' => 'float',
		'punto' => 'float',
		'transferencia' => 'float',
		'pendiente' => 'float',
		'cash' => 'float',
		'zelle' => 'float',
		'premium' => 'float',
		'monto_total' => 'float',
		'diferencia' => 'float'
	];

	protected $fillable = [
		'cierre_id',
		'caja',
		'supervisor',
		'fecha',
		'hora',
		'cajero',
		'tasa',
		'efectivo',
		'punto',
		'transferencia',
		'pendiente',
		'cash',
		'zelle',
		'premium',
		'monto_total',
		'diferencia'
	];

	public function cierre()
	{
		return $this->belongsTo(Cierre::class);
	}
}
