<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Ramsey\Uuid\Uuid;
use App\Models\Role;
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
        $data->role_id = 1;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Adinda";
        $data->id_pengguna  = "2005001";
        $data->password = bcrypt("2005001");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Ananda";
        $data->id_pengguna  = "2005002";
        $data->password = bcrypt("2005002");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Andi";
        $data->id_pengguna  = "2005003";
        $data->password = bcrypt("2005003");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Bidin";
        $data->id_pengguna  = "2005005";
        $data->password = bcrypt("2005005");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Faqih";
        $data->id_pengguna  = "2005006";
        $data->password = bcrypt("2005006");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Dea";
        $data->id_pengguna  = "2005007";
        $data->password = bcrypt("2005007");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Dzikri";
        $data->id_pengguna  = "2005008";
        $data->password = bcrypt("2005008");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Farhan";
        $data->id_pengguna  = "2005010";
        $data->password = bcrypt("2005010");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Filemon";
        $data->id_pengguna  = "2005011";
        $data->password = bcrypt("2005011");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Gusti";
        $data->id_pengguna  = "2005012";
        $data->password = bcrypt("2005012");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Lukman";
        $data->id_pengguna  = "2005013";
        $data->password = bcrypt("2005013");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Lusiana";
        $data->id_pengguna  = "2005014";
        $data->password = bcrypt("2005014");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Maulana";
        $data->id_pengguna  = "2005015";
        $data->password = bcrypt("2005015");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "M. Rizky";
        $data->id_pengguna  = "2005017";
        $data->password = bcrypt("2005017");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Nova";
        $data->id_pengguna  = "2005018";
        $data->password = bcrypt("2005018");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Rangga";
        $data->id_pengguna  = "2005019";
        $data->password = bcrypt("2005019");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Rico";
        $data->id_pengguna  = "2005020";
        $data->password = bcrypt("2005020");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Santi";
        $data->id_pengguna  = "2005021";
        $data->password = bcrypt("2005021");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Putri";
        $data->id_pengguna  = "2005022";
        $data->password = bcrypt("2005022");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Sri Rahayu";
        $data->id_pengguna  = "2005024";
        $data->password = bcrypt("2005024");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Sri Wahyuni";
        $data->id_pengguna  = "2005025";
        $data->password = bcrypt("2005025");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Wahyu R";
        $data->id_pengguna  = "2005026";
        $data->password = bcrypt("2005026");
        $data->role_id = 2;
        $data->save();

        $data = new User();
        $data->id           = Uuid::uuid4()->getHex();
        $data->name         = "Zulfa C";
        $data->id_pengguna  = "2005029";
        $data->password = bcrypt("2005029");
        $data->role_id = 2;
        $data->save();
    }
}
