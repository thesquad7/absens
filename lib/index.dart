import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  welcome createState() => welcome();
}

class Register extends StatefulWidget {
  @override
  register createState() => register();
}

class welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Text(
            'E-Absens',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              height: h * 0.42,
              width: w * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'merupakan NIP atau NIM?',
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: h * 0.04),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'apa kamu masih ingat?',
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.key),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                    onPressed: () {},
                    child: const Text('Lupa Kata Sandi?'),
                  ),
                  Container(
                    width: w * 0.85,
                    child: Center(
                      child: Container(
                        width: w * 0.4,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {},
                          child: Text("Masuk"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Container(
                    width: w * 0.85,
                    child: Center(child: Text("Belum terdaftar?")),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Container(
                    width: w * 0.85,
                    child: Center(
                      child: Container(
                        width: w * 0.4,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text("Daftar"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}

class register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(child: Text('Registrasi Akun')),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Text(
              'E-Absens ',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                height: h * 0.62,
                width: w * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'merupakan NIP atau NIM?',
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: h * 0.04),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'apa kamu masih ingat?',
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.key),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      onPressed: () {},
                      child: const Text('Lupa Kata Sandi?'),
                    ),
                    Container(
                      width: w * 0.85,
                      child: Center(
                        child: Container(
                          width: w * 0.4,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {},
                            child: Text("Masuk"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.015,
                    ),
                    Container(
                      width: w * 0.85,
                      child: Center(child: Text("Belum terdaftar?")),
                    ),
                    SizedBox(
                      height: h * 0.015,
                    ),
                    Container(
                      width: w * 0.85,
                      child: Center(
                        child: Container(
                          width: w * 0.4,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.amber),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text("Daftar"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
