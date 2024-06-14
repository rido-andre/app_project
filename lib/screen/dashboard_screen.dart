import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/screen/profilscreen.dart';
import 'package:app/screen/beranda_elektronik.dart';

class DashboardScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: 20), //mengatur ruang di setiap sisi body
          child: Column(
            children: [
              const SizedBox(height: 100),
              // item scatk
              Stack(
                alignment: Alignment
                    .center, //mengatur agar item stack images berada di tengah
                clipBehavior: Clip.none,
                children: [
                  Card(
                    //pembungkus item yang di timpa
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 199, 197, 197)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.all(16), //ruang di setiap sisi card
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                              height:
                                  50), //mengatur jarak text dengan heading atas
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, //agar text berada di tengah
                            children: [
                              Text(
                                'ADMIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 135, 156, 16)),
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Divider(
                              color: Colors.black,
                              thickness: 1), //membuat garis
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Toko Barang Bekas Bengkalis',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(color: Colors.black, thickness: 1),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      //mengatur item yang menumpuk
                      top: -75, //posisi item
                      // left: 20,
                      child: Container(
                          //pembungkus gmbar
                          width: 125,
                          height: 125, //besarnya gambar
                          decoration: BoxDecoration(
                            boxShadow: [],
                            image: DecorationImage(
                                image: AssetImage('assets/images/user.png'),
                                fit: BoxFit.fitWidth),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(125, 125)),
                          ))),
                ],
              ),
              // item stack di atas
              // item lain di bawah
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                //item tindakan cepat
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          // ...
                        },
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/images/box_kanan.png',
                            width:
                                45), // Ganti 'nama_file_gambar.png' dengan nama file gambar Anda
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Jumlah Barang')
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          // ...
                        },
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/box_kiri.png',
                          width: 40,
                        ), // Ganti 'nama_file_gambar.png' dengan nama file gambar Anda
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Stok')
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ), //item tindakan cepat
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profil_Screen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 239, 227, 227)),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      minimumSize: MaterialStateProperty.all(Size(150, 60)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add_shopping_cart),
                        SizedBox(width: 20),
                        Text('Elektronik'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 239, 227, 227)),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      minimumSize: MaterialStateProperty.all(Size(150, 60)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add_shopping_cart),
                        SizedBox(width: 20),
                        Text('Pakaian'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 239, 227, 227)),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      minimumSize: MaterialStateProperty.all(Size(150, 60)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add_shopping_cart),
                        SizedBox(width: 20),
                        Text('Kendaraan'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
