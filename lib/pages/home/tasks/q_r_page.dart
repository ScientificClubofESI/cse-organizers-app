import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class QRPage extends StatelessWidget {
  const QRPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'flutter',
      home: qrscannerPage(),
      routes: {
        'MyHomePage' :(context) => qrscannerPage(),
        'ID_valid':(context) => ID_valid(),
        'ID_unvalid':(context) => ID_unvalid()
      },
    );
  }
}

class qrscannerPage extends StatefulWidget {
  const qrscannerPage({Key? key}) : super(key: key);

  @override
  State<qrscannerPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<qrscannerPage> {
  bool _isScanned = false;

  @override
  Widget build(BuildContext context) {
   
    return 
    
     Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
             if (!_isScanned)
             
              MobileScanner(
                
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                    final qrCode = barcodes[0].rawValue;
                  setState(() {
                    _isScanned = true;
                  });
                 
                  if (qrCode == "Assil") {
                    Navigator.pushNamed(context, 'ID_valid').then((value) {
                      if (value == true) { // Update the state of _isScanned when returning from the ID_valid page
                        setState(() {
                          _isScanned = true;
                        });
                      }
                    });
                  } else {
                    Navigator.pushNamed(context, 'ID_unvalid').then((value) {
                      if (value == true) { // Update the state of _isScanned when returning from the ID_unvalid page
                        setState(() {
                          _isScanned = true;
                        });
                      }
                    });
                  }
                },
              ),
            QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.6)),
          ],
        ),
      ),
    );
  }
}

class ID_valid extends StatelessWidget {
  const ID_valid({Key? key})
      : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        leading: IconButton(

          icon: Icon(Icons.close),
          onPressed: () {
             Navigator.pop(context, true);
          },
        ),
        
      ),
      body:Stack(children: [
      
      ColorFiltered(
        
        colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6), BlendMode.srcOut), // This one will create the magic
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  backgroundBlendMode: BlendMode
                      .dstOut), // This one will handle background + difference out
            ),
            
          ],
        ),
      ),
     
     Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      
                      height: 144,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(children: [
                        SizedBox(height: 30),
                        Text(
                  "Participant ID is valid",
                  style: TextStyle(color: Colors.black,fontSize:16 ),
                  
                ),
                SizedBox(height: 20),
                Image.asset("assets/Vector(1).png"),
                      
                      ]),
                    ),
                  ),
                ),
               
              ],
            ),

    ]));
  }
}


class ID_unvalid extends StatelessWidget {
  const ID_unvalid({Key? key})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        leading: IconButton(

          icon: Icon(Icons.close),
          onPressed: () {
             Navigator.pop(context, true);
          },
        ),
        
      ),
   body: Stack(children: [
      
      ColorFiltered(
        
        colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6), BlendMode.srcOut), // This one will create the magic
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  backgroundBlendMode: BlendMode
                      .dstOut), // This one will handle background + difference out
            ),
            
          ],
        ),
      ),
     
     Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      
                      height: 144,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(children: [
                        SizedBox(height: 30),
                        Text(
                  "Participant ID is unvalid",
                  style: TextStyle(color: Colors.black,fontSize:16 ),
                  
                ),
                SizedBox(height: 20),
                Image.asset("assets/Vector(2).png"),
                      
                      ]),
                    ),
                  ),
                ),
               
              ],
            ),

    ]));
  }
}


class QRScannerOverlay extends StatelessWidget {
  const QRScannerOverlay({Key? key, required this.overlayColour})
      : super(key: key);

  final Color overlayColour;

  @override
  Widget build(BuildContext context) {
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 200.0;
    return Stack(children: [
      
      ColorFiltered(
        
        colorFilter: ColorFilter.mode(
            overlayColour, BlendMode.srcOut), // This one will create the magic
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  backgroundBlendMode: BlendMode
                      .dstOut), // This one will handle background + difference out
            ),
            
            Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: scanArea,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: scanArea,
                      width: scanArea,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
               
              ],
            ),
            
          ],
        ),
      ),
     
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
 SizedBox(height: 230),
       Align(
        
        alignment: Alignment.center,
      child:Text(
                  "Place the code inside the frame",
                  style: TextStyle(color: Colors.white,fontSize:12 ),
                  
                ),
                )
                
     ] )

    ]);
  }
}


class BarReaderSize {
  static double width = 200;
  static double height = 200;
}

class OverlayWithHolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addOval(Rect.fromCircle(
                center: Offset(size.width - 44, size.height - 44), radius: 40))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}


