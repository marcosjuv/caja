<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\UserResource;

class CajasResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return parent::toArray($request);
        // return $this->collection;
        // return [
        //     'id' => $this->id,
        //     'caja' => $this->caja,
        //     'descripcion' => $this->descripcion,
        //     'is_rrss' => $this->is_rrss
        // ];
    }
}
