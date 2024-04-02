import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flexi_sense_companion/services/authmanagement.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flexi_sense_companion/screens/page_2.dart'; // Assuming page_2.dart is renamed to new_screen.dart

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Loading(), // Assuming Loading() widget defined elsewhere
                  );
                  try {
                    // Perform sign-in (replace with your loginMethod())
                    final user = await signInWithGoogle(context);

                    if (user != null) {
                      Navigator.pop(context); // Hide progress dialog
                      Navigator.pushReplacementNamed(context, '/newscreen' );
                    } else {
                      Navigator.pop(context); // Hide progress dialog (even on error)
                      // Handle login failure (optional)
                    }
                  } catch (error) {
                    Navigator.pop(context); // Hide progress dialog on error
                    print('Error during sign-in: $error');
                    // Display an error message to the user
                  }
                },
                child: Text('Sign in with Google'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      // Perform Google Sign-in logic here
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user; // Return the Firebase User object
      } else {
        print('Sign-in cancelled');
        return null;
      }
    } catch (error) {
      print('Error during sign-in: $error');
      return null; // Indicate login failure
    }
  }
}

// Assuming Loading() widget (replace with your actual implementation)
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
