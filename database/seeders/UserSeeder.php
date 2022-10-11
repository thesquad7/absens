<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Ramsey\Uuid\Uuid;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "M. Anis Hilmi";
        $data->id_pengguna  = "anis";
        $data->password = bcrypt("rplanis20");
        $data->save();
    }
}
