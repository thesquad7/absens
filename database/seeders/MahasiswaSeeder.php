<?php

namespace Database\Seeders;

use App\Models\Mahasiswa;
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
        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005001';
        $data->name         = "Adinda";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '200502';
        $data->name         = "Ananda";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005003';
        $data->name         = "Andi";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005005';
        $data->name         = "Bidin";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005006';
        $data->name         = "Faqih";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005007';
        $data->name         = "Dea";
        $data->save();
        
        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005008';
        $data->name         = "Dzikri";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005010';
        $data->name         = "Farhan";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005011';
        $data->name         = "Filemon";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005012';
        $data->name         = "Gusti";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005013';
        $data->name         = "Lukman";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005014';
        $data->name         = "Lusiana";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005015';
        $data->name         = "Maulana";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005017';
        $data->name         = "M. Rizky";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005018';
        $data->name         = "Nova";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005019';
        $data->name         = "Rangga";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '20050020';
        $data->name         = "Rico";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005021';
        $data->name         = "Santi";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005022';
        $data->name         = "Putri";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005024';
        $data->name         = "Sri Rahayu";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005025';
        $data->name         = "Sri Wahyuni";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005026';
        $data->name         = "Wahyu R";
        $data->save();

        $data = new Mahasiswa();
        $data->id           = Uuid::uuid4()->getHex();
        $data->nim           = '2005027';
        $data->name         = "Zulfa C";
        $data->save();
    }
}
