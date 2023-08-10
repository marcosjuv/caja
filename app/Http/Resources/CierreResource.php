<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CierreResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // return parent::toArray($request);
        return [
            'id' => $this->id,
            'supervisor' => $this->supervisor,
            'fecha' => $this->fecha,
            'monto' => $this->monto,
            // 'listcuadre' => $this->listcuadre,
            'detalles' => DetalleCierreResource::collection($this->listcuadre),
        ];
    }
}
