<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\TahunAjar;

class TahunAjarSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = new TahunAjar();
        $data->id = "1";
        $data->name = "2022";
        $data->save();

    }
}
