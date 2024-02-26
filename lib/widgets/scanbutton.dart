// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:cse_organizers_app/Services/data_manager.dart';
import 'package:cse_organizers_app/data/event_data.dart';
import 'package:cse_organizers_app/data/user_data.dart';
import 'package:cse_organizers_app/pages/home/participants_page.dart';
import 'package:cse_organizers_app/widgets/participant.dart';
import 'package:flutter/material.dart';
import 'package:cse_organizers_app/icons/c_s_e_organizers_app_icons.dart';
import 'package:cse_organizers_app/constants.dart' as constants;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatefulWidget {
  const ScanButton({super.key});

  @override
  State<ScanButton> createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButton> {
  @override
  Widget build(BuildContext context) {
    bool Verified = false;
    String _scanBarcode = 'Unknown';

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

    bool traitementCode(String code) {
      for (var element in UserData.participants) {
        if (element.id == code) {
          Verified = true;
        } else {
          print("why");
          Verified = false;
        }
      }
      if (Verified) {
        // await updateScannedParticipants( )
        return true;
      } else {
        return false;
      }
    }

    void _showDialog(BuildContext context, bool Verified) {
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
                  (Verified)
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
                  icon: (Verified)
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

    double l = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: (() async {
        UserData.participants = [];
        await getParticipants(EventsData.eventInfo!.id);
      }),
      child: GestureDetector(
        child: Container(
          width: l * 0.819,
          height: h > 600 ? h * 0.07 : h * 0.15,
          decoration: BoxDecoration(
              color: constants.colors['secondary']![500],
              borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.only(bottom: 20),
          child: MaterialButton(
            onPressed: () async {
              await scanQR();
              //ici se fait la logique de traitement
              // à ce point l'information generee a partir du code qr est dans la variable _scanBarcode
              bool done = traitementCode(
                  _scanBarcode); //elle retourne toujours la meme chose
              _showDialog(context, done);
              if (done) {
                //je modifie le champs scanned de mon participant
                await updateScannedParticipants(_scanBarcode, true);
                UserData.participants = [];
                await getParticipants(EventsData.eventInfo!.id);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Icon(
                      CSEOrganizersApp.camera,
                      color: Colors.white,
                    )),
                const Text(
                  'Scan',
                  style: TextStyle(
                      color: Colors.white,
                      // fontFamily: 'CSEOrganizersApp',
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
