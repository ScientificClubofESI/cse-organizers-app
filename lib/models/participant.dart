class Participants {
  final String id, fullName, phone, team;
  bool scannedbool;

  Participants({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.team,
    required this.scannedbool,
  });

  // Getter for the ID
  /*String get participantId => id;

  // Getter for the full name
  String get participantFullName => fullName;

  // Getter for the phone number
  String get participantPhone => phone;

  // Getter for the team
  String get participantTeam => team;

  // Getter for the scanned boolean
  bool get isScanned => scannedbool;

  // Setter for the scanned boolean
  set setScanned(bool newScannedStatus) {
    // Additional logic if needed before setting the value
    scannedbool = newScannedStatus;
  }*/
}
