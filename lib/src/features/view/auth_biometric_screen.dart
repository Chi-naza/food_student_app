import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app2/src/utilities/snackbar_custom.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text(
                    "BIOMETRIC HERE",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      checkAvailableBiometrics();
                    },
                    child: Container(
                      height: 45,
                      width: 145,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Text("CHECK",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                  SizedBox(height: 20),
                  IconButton(
                    onPressed: () {
                      startBiometrics();
                    },
                    icon: Icon(Icons.fingerprint),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> checkBiometrics() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    print("CAN AUTHENTICATE: $canAuthenticateWithBiometrics");
  }

  Future<void> checkAvailableBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      print("AVAILABLE BIOMETRICS: $availableBiometrics");
    } else {
      print("NO BIOMETRICS FOUND");
    }
  }

  Future<void> startBiometrics() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        options: const AuthenticationOptions(useErrorDialogs: false),
      );

      if (didAuthenticate) {
        print("Authentication Passed");
      } else {
        showSnackBar(message: "Authentication Failed woefully!");
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        // ...
      } else {
        // ...
      }
    }
  }
}
