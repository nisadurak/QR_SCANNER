// ignore_for_file: implementation_imports

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_scanner_app_flutter/qrpage.dart';
import 'package:qr_scanner_app_flutter/scan_history_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child:
      SafeArea(
      child:Column(children: <Widget>[

       const SizedBox(height: 30,),
       Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        
                  
                  const Text("QR SCANNER",style: TextStyle(
                  fontSize: 36,
                  color: Color.fromARGB(255, 49, 2, 95),
                  fontWeight: FontWeight.w500,)),
                  
                  
                  Container( 
                  padding: const EdgeInsets.all(0.00001),
                  decoration:  BoxDecoration( borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 63, 3, 123),),
                  alignment: Alignment.topCenter,
                  child:
        IconButton(    
            icon: const Icon(Icons.close,color: Color.fromARGB(255, 255, 255, 255),),
            
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => exit(0))))
                  ),
   
        ]),
         const SizedBox(
          height: 190,
        ),
        
        Text('QR Scanner Uygulamasına Hoş Geldiniz.'),
                
        Column(children: <Widget>[
           
            const SizedBox(
              width: 300.0,
              height: 240.0,
            ),


            //QR SAYFASINA GİDEN BUTON
            SizedBox( 
              width: 350.0,
              child: FloatingActionButton(
                heroTag: 3,
                onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const QRPage()));
              },
              backgroundColor:const Color.fromARGB(255, 58, 18, 177),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), child:const Text('QR OKUT',style:TextStyle(color: Colors.white)
              ),
              )
              ),
              
              
              
            const SizedBox(
              width: 100.0,
              height: 10.0,
            ),
            

        // QR GEÇMİŞİNİ GÖSTEREN BUTON 
             SizedBox( 
              width: 350.0,
              child: FloatingActionButton(
                heroTag: 8,
               onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScanHistoryPage()));
                  },
              backgroundColor:const Color.fromARGB(255, 110, 9, 135),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), child:const Text('GEÇMİŞ',style:TextStyle(color: Colors.white)
              ),
              )
              ),
              
        
      ]
      )
      
      
     
      ])
     )
      )
      );
  }
}


