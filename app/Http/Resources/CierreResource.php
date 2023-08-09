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
            'fecha' => $this->fecha,
            'hora' => $this->hora,
            'supervisor' => $this->is_supervisor,
            // 'listcuadre' => $this->listcuadre,
            'detalles' => DetalleCierreResource::collection($this->whenLoaded('detalleCierres')),
        ];
    }
}
