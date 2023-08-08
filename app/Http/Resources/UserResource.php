<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'lastname' => $this->lastname,
            'card_id' => $this->card_id,
            'is_supervisor' => $this->is_supervisor,
            'is_rrss' => $this->is_rrss,
            'email' => $this->email,
            'password' => $this->password
        ];
    }
}
