<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = new Role();
        $admin->id = '1';
		$admin->name         = 'Dosen';
		$admin->save();

		$mahasiswa = new Role();
		$mahasiswa->id = '2';
		$mahasiswa->name = 'Mahasiswa';
		$mahasiswa->save();

    }
}
