import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/constants.dart' as constants;

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666", // Couleur de la barre de recherche (facultatif)
      "Annuler", // Texte du bouton d'annulation (facultatif)
      true, // Utiliser l'appareil photo avant (facultatif)
      ScanMode.QR, // Mode de numérisation (QR, AZTEC, PDF417, etc.)
    );

    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanResult;
    });
  }

  bool traitementCode(String xxx) {
    return false;
  }

  void _showDialog(BuildContext context, bool isVerified) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon(
              //   Icons.check_circle, // Icône de vérification
              //   color: Colors.green,
              //   size: 50.0,
              // ),
              // SizedBox(height: 20.0),
              Text(
                (isVerified)
                    ? 'Participant ID is valid'
                    : "Participant ID is unvalid",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Ferme la boîte de dialogue
                },
                icon: (isVerified)
                    ? Icon(
                        CSEOrganizersApp.checkboxChecked,
                        color: constants.colors["success"]![100],
                        size: 40.0,
                      )
                    : Icon(
                        CSEOrganizersApp.unvalid,
                        color: constants.colors["fail"]![100],
                        size: 40.0,
                      ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () async {
                              await scanQR();
                              //ici se fait la logique de traitement
                              // à ce point l'information generee a partir du code qr est dans la variable _scanBarcode
                              bool done = traitementCode(
                                  _scanBarcode); //elle retourne toujours la meme chose
                              _showDialog(context, done);
                              if (done) {
                                //afficher le done et fait le traitement
                              } else {}
                            },
                            child: Text('Start QR scan')),
                        Text('Scan result : $_scanBarcode\n',
                            style: TextStyle(fontSize: 20))
                      ]));
            })));
  }
}

//-------------------------------- QR generator

class QrGenerator extends StatelessWidget {
  String uid;
  QrGenerator({required this.uid});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Generator'),
        ),
        body: Center(
          child: QrImage(
            data: uid, // Chaîne de caractères représentant l'UID
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
