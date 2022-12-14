<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        
        //one
        $this->call(RoleSeeder::class);
        $this->call(TahunAjarSeeder::class);
        $this->call(KelasSeeder::class);

        //to

        //many
        $this->call(UserSeeder::class);
        $this->call(MahasiswaSeeder::class);

    }
}
