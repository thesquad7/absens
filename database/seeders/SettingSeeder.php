<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\Smester;
use App\Models\TahunAjar;
use App\Models\MataKuliah;
use App\Models\Kelas;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
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
		$admin->name = 'Dosen';
		$admin->save();
        
		$mahasiswa = new Role();
		$mahasiswa->id = '2';
		$mahasiswa->name = 'Mahasiswa';
		$mahasiswa->save();

        $data = new TahunAjar();
        $data->id = "1";
        $data->name = "2022";
        $data->save();

        $matkul = new MataKuliah();
        $matkul ->id = "1";
        $matkul ->name = "2022";
        $matkul->save();

        $smster = new Smester();
        $smster ->id = "1";
        $smster ->name = "Pertama";
        $smster->save();

        $kelas = new Kelas();
        $kelas->id = 1;
        $kelas->name = "D4RPL1";
        $kelas->save();


    }
}
