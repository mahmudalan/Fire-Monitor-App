import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../services/realtime_db.dart';

class Fire extends StatefulWidget {
  const Fire({super.key});

  @override
  State<Fire> createState() => _FireState();
}

class _FireState extends State<Fire> {

  String sensorApi = ''; // Mengubah tipe data menjadi String
  @override
  void initState() {

    dataApi.onValue.listen((event) {
      final getdataApi = event.snapshot;
      setState(() {
        sensorApi = getdataApi.value as String; // Casting nilai ke String
      });
    });

    super.initState();
  }

  Color deepPurple = const Color(0xff86469C);
  Color Purple = const Color(0xffBC7FCD);
  Color pink = const Color(0xffFB9AD1);
  Color morePink = const Color(0xffFFCDEA);

  @override
  Widget build(BuildContext context) {
    String status;
    String ruangan;
    String animation;
    if (sensorApi.isNotEmpty){
      if (sensorApi == "1" ){ // Mengubah perbandingan nilai ke string
        status = "There's a Fire!";
        ruangan = 'Danger!';
        animation = 'lib/assets/fire.json';
      } else {
        status = 'No Fire';
        ruangan = 'Safe';
        animation = 'lib/assets/clean smoke.json';
      }
    } else {
      // Default values jika nilaiSuhu null (belum diinisialisasi)
      status = "Loading";
      ruangan = "loading";
      animation = 'lib/assets/clean smoke.json';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.white,width: 2)),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Lottie.asset('lib/assets/house2.json',height: 110),
                  const SizedBox(height: 10,),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Fire Detector Dashboard',
              style: TextStyle(
                  color: deepPurple,
                  fontFamily: 'Quenda',
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              )
          ),
        ),

        // Menampilkan tanggal hari ini secara realtime
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Quenda',
                  color: Purple,
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
                      color: Purple,
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
                          color: Purple,
                          fontSize: 20
                      ),
                    ),
                    Text('Fire Detector dashboard',
                      style: TextStyle(
                          fontFamily: 'Quenda',
                          color: Purple,
                          fontSize: 20
                      ),
                    ),
                    Text('Acin Fire Monitoring',
                      style: TextStyle(
                          fontFamily: 'Quenda',
                          color: Purple,
                          fontSize: 20
                      ),
                    ),
                    Text('System',
                      style: TextStyle(
                          fontFamily: 'Quenda',
                          color: Purple,
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
                height: 330,
                decoration: BoxDecoration(
                    color: deepPurple,
                    border: Border.all(color: pink, width: 2),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text('Fire', style: TextStyle(
                        color: morePink,
                        fontFamily: 'Quenda',
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )
                    ),
                    Text('Sensor', style: TextStyle(
                        color: morePink,
                        fontFamily: 'Quenda',
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )
                    ),
                    Lottie.asset(animation, height: 180, width: 180),
                    const SizedBox(height: 25,),
                    Text('Current Value : $sensorApi', style: TextStyle(
                        color: morePink,
                        fontFamily: 'Quenda',
                        fontSize: 20
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
                            color: Purple,
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
                        Lottie.asset('lib/assets/fire2.json', height: 120),
                        Text(ruangan, style: TextStyle(
                            color: Purple,
                            fontFamily: 'Quenda',
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        const SizedBox(height: 5,),
                      ],
                    ),
                  ),

                )
              ],
            )
          ],
        )
      ],
    );
  }
}
