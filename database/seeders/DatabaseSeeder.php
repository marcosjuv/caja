<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {       
        DB::table('users')->insert([
            'name' => 'Marcos',
            'lastname' => 'Urdaneta',
            'card_id' => '14278228',
            'is_supervisor' => 1,
            'is_rrss' => 0,
            'email' => 'marcosjavieruv@gmail.com',
            'password' => 'v14278228'
        ]);
        DB::table('users')->insert([
            'name' => 'Sharon',
            'lastname' => 'Tomas',
            'card_id' => '14420459',
            'is_supervisor' => 1,
            'is_rrss' => 1,
            'email' => 'stomas@gmail.com',
            'password' => 'v14278228'
        ]);
        DB::table('users')->insert([
            'name' => 'Bill',
            'lastname' => 'Gates',
            'card_id' => '1641438',
            'is_supervisor' => 0,
            'is_rrss' => 0,
            'email' => 'bgates@gmail.com',
            'password' => 'v14278228'
        ]);
        DB::table('users')->insert([
            'name' => 'Tony',
            'lastname' => 'Stark',
            'card_id' => '3109999',
            'is_supervisor' => 0,
            'is_rrss' => 0,
            'email' => 'tstark@gmail.com',
            'password' => 'v14278228'
        ]);
        
        User::factory()->count(196)->create();
    }
}
