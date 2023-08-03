import 'package:flutter/material.dart';
import 'package:posts_app/moduls/login_screen.dart';

import 'package:posts_app/shared/constans/context_extentions.dart';

import '../shared/component/custom_buttom.dart';
import '../shared/component/custom_form_filed.dart';
import '../shared/component/icon_row.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  bool _agreeToTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: context.propWidth(20)),
                Text(
                  'Need Help?',
                  style: TextStyle(
                    color: Color.fromARGB(158, 33, 149, 243),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.propHeight(20)),
            Text(
              'Register your new account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.propHeight(20)),
            Text('Enter your information below ',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: context.propHeight(20)),
            CustomTextField(
              labelText: 'Name',
              hintText: 'Enter your name',
              width: context.propWidth(500),
              validator: (value, errorText) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: context.propHeight(20)),
            CustomTextField(
              labelText: 'Email',
              hintText: 'Enter your email',
              width: context.propWidth(500),
              validator: (value, errorText) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: context.propHeight(20)),
            CustomTextField(
              labelText: 'Password',
              hintText: 'Enter your password',
              width: context.propWidth(500),
              validator: (value, errorText) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: context.propHeight(20)),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                Text(
                  "By creating an account, you agree to our terms\n and conditions ",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.propHeight(20)),
            CustomButton(
              title: 'Create Account',
              height: context.propHeight(60),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
            ),
            SizedBox(height: context.propHeight(25)),
            Row(
              children: [
                IconRow(
                  onFacebookPressed: () {
                    // Handle Facebook button press here
                  },
                  onGooglePressed: () {
                    // Handle Google button press here
                  },
                  onApplePressed: () {
                    // Handle Apple button press here
                  },
                ),
                SizedBox(height: 16.0),
                // Other widgets in your layout
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
