<?php

namespace Database\Seeders;

use App\Models\Mahasiswa;
use App\Models\Dosen;
use Illuminate\Database\Seeder;
use Ramsey\Uuid\Uuid;

class MahasiswaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = new Dosen();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nip           = '2005001XXXXXXX';
        $data->keterangan     ="Dosen Polindra";
        $data->name         = "M. Anis Hilmi";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005001';
        $data->kelas_id     =1;
        $data->name         = "Adinda";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005002';
        $data->kelas_id     =1;
        $data->name         = "Ananda";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005003';
        $data->kelas_id     =1;
        $data->name         = "Andi";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005005';
        $data->kelas_id     =1;
        $data->name         = "Bidin";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005006';
        $data->kelas_id     =1;
        $data->name         = "Faqih";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005007';
        $data->kelas_id     =1;
        $data->name         = "Dea";
        $data->save();
        
        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005008';
        $data->kelas_id     =1;
        $data->name         = "Dzikri";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005010';
        $data->kelas_id     =1;
        $data->name         = "Farhan";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005011';
        $data->kelas_id     =1;
        $data->name         = "Filemon";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005012';
        $data->kelas_id     =1;
        $data->name         = "Gusti";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005013';
        $data->kelas_id     =1;
        $data->name         = "Lukman";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005014';
        $data->kelas_id     =1;
        $data->name         = "Lusiana";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005015';
        $data->kelas_id     =1;
        $data->name         = "Maulana";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005017';
        $data->kelas_id     =1;
        $data->name         = "M. Rizky";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005018';
        $data->kelas_id     =1;
        $data->name         = "Nova";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005019';
        $data->kelas_id     =1;
        $data->name         = "Rangga";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2002020';
        $data->kelas_id     =1;
        $data->name         = "Rico";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005021';
        $data->kelas_id     =1;
        $data->name         = "Santi";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005022';
        $data->kelas_id     =1;
        $data->name         = "Putri";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005024';
        $data->kelas_id     =1;
        $data->name         = "Sri Rahayu";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005025';
        $data->kelas_id     =1;
        $data->name         = "Sri Wahyuni";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005026';
        $data->kelas_id     =1;
        $data->name         = "Wahyu R";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005027';
        $data->kelas_id     =1;
        $data->name         = "Zulfa C";
        $data->save();
    }
}
