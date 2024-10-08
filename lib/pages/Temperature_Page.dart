import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../services/realtime_db.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  // ini nama variabel buat nyimpen suhu tipe datanya dynamis/berubah-ubah
  String? temperatureString;
  double? temperature;

  //ini buat manggil nilai sensor suhu yang awalnya desimal di konversi jadi string
  @override
  void initState() {
    dataSuhu.onValue.listen((event) {
      final getdataSuhu = event.snapshot;
      setState(() {
        temperatureString = getdataSuhu.value as String;
        temperature = double.tryParse(temperatureString ?? '');
      });
    });
    super.initState();
  }

  Color deepPurple = const Color(0xff86469C);
  Color purple = const Color(0xffBC7FCD);
  Color pink = const Color(0xffFB9AD1);
  Color morePink = const Color(0xffFFCDEA);

  @override
  Widget build(BuildContext context) {
    String status;
    String ruangan;
    String animation;

    if (temperature != null) {
      if (temperature! >= 35) {
        status = "Warm";
        ruangan = 'High Temperature';
        animation = 'lib/assets/warm.json';
      } else {
        status = 'Cool';
        ruangan = 'Low Temperature';
        animation = 'lib/assets/cold.json';
      }
    } else {
      // Default values jika temperature null (belum diinisialisasi)
      status = "Loading";
      ruangan = "Loading";
      animation = 'lib/assets/cold.json';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              color: pink,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello!',
                      style: TextStyle(
                          color: morePink,
                          fontSize: 15,
                          fontFamily: 'Quenda'
                      )
                  ),
                  Text('Welcome to',
                      style: TextStyle(
                          color: morePink,
                          fontSize: 20,
                          fontFamily: 'Quenda',
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text('Acin Fire Monitor',
                      style: TextStyle(
                          color: deepPurple,
                          fontSize: 25,
                          fontFamily: 'Quenda',
                          fontWeight: FontWeight.bold
                      )
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10,),
                  Lottie.asset('lib/assets/house2.json', height: 110),
                  const SizedBox(height: 10,),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Temperature Dashboard',
              style: TextStyle(
                  color: deepPurple,
                  fontFamily: 'Quenda',
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Quenda',
                  color: purple,
                ),
              ),
              const SizedBox(width: 10), // Tambahkan jarak antara tanggal dan waktu
              StreamBuilder<DateTime>(
                stream: Stream.periodic(const Duration(seconds: 1), (i) => DateTime.now()),
                builder: (context, snapshot) {
                  return Text(
                    DateFormat('HH:mm').format(snapshot.data ?? DateTime.now()),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quenda',
                      color: purple,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: pink, width: 2),
              borderRadius: BorderRadius.circular(20)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset('lib/assets/house.json', height: 180),
                Column(
                  children: [
                    Text('Welcome to',
                      style: TextStyle(
                          fontFamily: 'Quenda',
                          color: purple,
                          fontSize: 20
                      ),
                    ),
                    Text('Temperature dashboard',
                      style: TextStyle(
                          fontFamily: 'Quenda',
                          color: purple,
                          fontSize: 20
                      ),
                    ),
                    Text('Acin Fire Monitoring',
                      style: TextStyle(
                          fontFamily: 'Quenda',
                          color: purple,
                          fontSize: 20
                      ),
                    ),
                    Text('System',
                      style: TextStyle(
                          fontFamily: 'Quenda',
                          color: purple,
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ),
        const SizedBox(height: 10,),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: deepPurple,
                      border: Border.all(color: pink, width: 2),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Text('Temperature', style: TextStyle(
                          color: morePink,
                          fontFamily: 'Quenda',
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      )
                      ),
                      Text('Sensor (°C)', style: TextStyle(
                          color: morePink,
                          fontFamily: 'Quenda',
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      )
                      ),
                      const SizedBox(height: 20,),
                      Lottie.asset(animation, height: 150, width: 180),
                      const SizedBox(height: 15,),
                      Text('$temperatureString°', style: TextStyle(
                          color: morePink,
                          fontFamily: 'Quenda',
                          fontSize: 40
                      )
                      ),
                      const SizedBox(height: 15,)
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      height: 100,
                      width: 192.5,
                      decoration: BoxDecoration(
                          color: morePink,
                          border: Border.all(color: pink, width: 2),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          Text('Current Status :',
                              style: TextStyle(
                                  color: deepPurple,
                                  fontFamily: 'Quenda',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              )
                          ),
                          const SizedBox(height: 10,),
                          Text(status, style: TextStyle(
                              color: purple,
                              fontFamily: 'Quenda',
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 192.5,
                      decoration: BoxDecoration(
                          color: morePink,
                          border: Border.all(color: pink, width: 2),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          Text('Room Status :',
                              style: TextStyle(
                                  color: deepPurple,
                                  fontFamily: 'Quenda',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              )
                          ),
                          const SizedBox(height: 10,),
                          Lottie.asset('lib/assets/termo.json', height: 120),
                          const SizedBox(height: 5,),
                          Text(ruangan, style: TextStyle(
                              color: purple,
                              fontFamily: 'Quenda',
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                          const SizedBox(height: 5,),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]
        )
      ],
    );
  }
}
