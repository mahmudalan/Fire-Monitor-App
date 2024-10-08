import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../services/realtime_db.dart';

class Smoke extends StatefulWidget {
  const Smoke({super.key});

  @override
  State<Smoke> createState() => _SmokeState();
}

class _SmokeState extends State<Smoke> {
  String sensorAsap = '';
  @override
  void initState() {

    dataAsap.onValue.listen((event) {
      final getdataAsap = event.snapshot;
      setState(() {
        sensorAsap = getdataAsap.value as String;
      });
    }
    );

    super.initState();
  }

  Color deepPurple = Color(0xff86469C);
  Color Purple = Color(0xffBC7FCD);
  Color pink = Color(0xffFB9AD1);
  Color morePink = Color(0xffFFCDEA);
  @override
  Widget build(BuildContext context) {

    String status;
    String ruangan;
    String animation;

    if (sensorAsap != null){
      if (sensorAsap == "1" ){
        status = "There's a smoke!";
        ruangan = 'Smoke Alert!';
        animation = 'lib/assets/smoke.json';
      } else {
        status = "No Smoke";
        ruangan = "Safe";
        animation = 'lib/assets/clean smoke.json';
      }
    } else {
      status = 'Loading';
      ruangan = 'Loading';
      animation = 'lib/assets/clean smoke.json';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.white,width: 2)),
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 5,),
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
                  SizedBox(height: 10,),
                  Lottie.asset('lib/assets/house2.json',height: 110),
                  SizedBox(height: 10,),
                ],
              )
            ],
          ),
          ),

        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Smoke Detector Dashboard',
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                '${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Quenda',
                  color: Purple,
                ),
              ),
              SizedBox(width: 10), // Tambahkan jarak antara tanggal dan waktu
              StreamBuilder<DateTime>(
                stream: Stream.periodic(Duration(seconds: 1), (i) => DateTime.now()),
                builder: (context, snapshot) {
                  return Text(
                    '${DateFormat('HH:mm').format(snapshot.data ?? DateTime.now())}',
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

        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: pink, width: 2),
              borderRadius: BorderRadius.circular(20)
          ),
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset('lib/assets/house.json', height: 180),
                Column(
                  children: [
                    Text('Welcome to Smoke',
                      style: TextStyle(
                          fontFamily: 'Quenda',
                          color: Purple,
                          fontSize: 20
                      ),
                    ),
                    Text('Detector dashboard',
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
        SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Container(
                height: 330,
                decoration: BoxDecoration(
                    color: deepPurple,
                    border: Border.all(color: pink, width: 2),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text('Smoke', style: TextStyle(
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
                    Lottie.asset(animation, height: 180, width: 180,),
                    SizedBox(height: 25,),
                    Text('Current Value : $sensorAsap', style: TextStyle(
                        color: morePink,
                        fontFamily: 'Quenda',
                        fontSize: 20
                    )
                    ),
                    SizedBox(height: 15,)
                  ],
                ),
              ),
            ),
            SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.only(right: 15),
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
                        SizedBox(height: 10,),
                        Text('Current Status :',
                            style: TextStyle(
                                color: deepPurple,
                                fontFamily: 'Quenda',
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            )
                        ),
                        SizedBox(height: 10,),
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

                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Container(
                    width: 192.5,
                    decoration: BoxDecoration(
                        color: morePink,
                        border: Border.all(color: pink, width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text('Room Status :',
                            style: TextStyle(
                                color: deepPurple,
                                fontFamily: 'Quenda',
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            )
                        ),
                        SizedBox(height: 15,),
                        Image.asset('lib/assets/steam.png', height: 105),
                        SizedBox(height: 10,),
                        Text(ruangan, style: TextStyle(
                            color: Purple,
                            fontFamily: 'Quenda',
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        SizedBox(height: 5,),
                      ],
                    ),
                  ),

                )
              ],
            )
          ],
        )

      ]
    );
  }
}

