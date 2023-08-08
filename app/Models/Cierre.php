<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Cierre
 * 
 * @property int $id
 * @property string $supervisor
 * @property Carbon $fecha
 * @property float $monto
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|DetalleCierre[] $detalle_cierres
 *
 * @package App\Models
 */
class Cierre extends Model
{
	protected $table = 'cierres';

	protected $casts = [
		'fecha' => 'datetime',
		'monto' => 'float'
	];

	protected $fillable = [
		'id',
		'supervisor',
		'fecha',
		'monto'
	];

	public function detalle_cierres()
	{
		return $this->hasMany(DetalleCierre::class);
	}
}
