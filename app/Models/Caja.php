<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Caja
 * 
 * @property int $id
 * @property string $caja
 * @property string|null $descripcion
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class Caja extends Model
{
	protected $table = 'cajas';

	protected $fillable = [
		'caja',
		'descripcion',
		'is_rrss'
	];
}
