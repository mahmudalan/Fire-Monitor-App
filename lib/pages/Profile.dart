import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color deepPurple = const Color(0xff86469C);
  Color Purple = const Color(0xffBC7FCD);
  Color pink = const Color(0xffFB9AD1);
  Color morePink = const Color(0xffFFCDEA);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Profile Page',
              style: TextStyle(
                  color: deepPurple,
                  fontFamily: 'Quenda',
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.asset(
                      'lib/assets/profile.jpg',
                      width: 200,
                      height: 200,
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sintia Tri Apriani',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: deepPurple,
                        fontFamily: 'Quenda'),
                  ),
                  Text(
                    'sintiatriapriani@gmail.com',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: deepPurple,
                        fontFamily: 'Quenda'),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: pink,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'About me :',
                  style: TextStyle(color: deepPurple, fontSize: 18),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: pink,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            decoration: BoxDecoration(
              color: pink,
              border: Border.all(width: 2, color: pink),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Halo, perkenalkan, nama saya Sintia Tri Apriani. '
                'Saya adalah seorang mahasiswa di Universitas Gunadarma, jurusan Teknik Komputer. '
                'Di kampus, saya bekerja sebagai Staff Sekretariat Pameran & Kunjungan, khususnya menduduki posisi divisi data. '
                'Tugas saya adalah mengelola dan menganalisis data universitas gunadarma. '
                'Selain itu, saya juga menjabat sebagai Sekretaris di HIMATEKKOM, organisasi mahasiswa di jurusan saya. '
                'Tugas ini mengharuskan saya untuk mengkoordinasikan berbagai kegiatan dan mengurus administrasi organisasi. '
                'Di waktu luang, saya menikmati menggali lebih dalam ke dalam aplikasi Microsoft Office, yang menjadi minat saya. '
                'Ini membantu saya dalam tugas-tugas akademis dan kegiatan organisasi.',
                style: TextStyle(color: Colors.white, fontFamily: 'Quenda',fontSize: 17),
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: pink,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Contact us :',
                  style: TextStyle(color: deepPurple, fontSize: 18),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: pink,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/assets/gmail.png',
                    height: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'sintiatriapriani@gmail.com',
                    style: TextStyle(
                        color: deepPurple,
                        fontFamily: 'Quenda',
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Image.asset(
                    'lib/assets/instagram.png',
                    height: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '@sintiatriap_',
                    style: TextStyle(
                        color: deepPurple,
                        fontFamily: 'Quenda',
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Image.asset(
                    'lib/assets/whatsapp.png',
                    height: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '+6285283040242',
                    style: TextStyle(
                        color: deepPurple,
                        fontFamily: 'Quenda',
                        fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
