import 'package:flutter/material.dart';
import 'package:qr_scanner_app_flutter/homepage.dart';
import 'package:qr_scanner_app_flutter/qrpage.dart';

class ScanHistoryPage extends StatefulWidget {
  const ScanHistoryPage({super.key});

  @override
  State<ScanHistoryPage> createState() => _ScanHistoryPageState();
}

class _ScanHistoryPageState extends State<ScanHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child:
      SafeArea(
      child:Column(children: <Widget>[

       const SizedBox(height: 20,),
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
                  
                  
       child:IconButton(    
            icon: const Icon(Icons.arrow_back,color: Color.fromARGB(255, 255, 255, 255),),
            
             onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Homepage())))
                    ),
   
        ]),


      
      SizedBox(
        
        child:
      SingleChildScrollView(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "QR İçerik Geçmişi",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
            
              height: 460,
              child: ListView.builder(
                itemCount: qrlinks.length,
                itemBuilder: (context, index) {
                  return Text(
                    qrlinks[index],
                    style: const TextStyle(fontSize: 28),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.001),
            child:
            //history sayfasındaki clear butonu 
              SizedBox(
              width: 250.0,
              
              child: FloatingActionButton(
                heroTag: 3,
               onPressed: () {
                  qrlinks.clear();
                },
              backgroundColor:const Color.fromARGB(255, 47, 9, 135),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), child:const Text('Temizle',style:TextStyle(color: Colors.white)
              ),
              )
              ),
          )
        ],
        )
        ))
        ] 
      )
      )
    )
    );
  }
}
