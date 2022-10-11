<?php

namespace Database\Seeders;

use App\Models\Kelas;
use Illuminate\Database\Seeder;
use Ramsey\Uuid\Uuid;

class KelasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = new Kelas();
        $data->id = Uuid::uuid4()->getHex();
        $data->name = "D4RPL1";
        $data->save();

    }
}
