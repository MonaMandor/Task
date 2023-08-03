import 'package:flutter/material.dart';
import 'package:posts_app/layouts/home_layout.dart';
import 'package:posts_app/shared/constans/context_extentions.dart';

import '../layouts/view_screen.dart';
import '../shared/component/custom_buttom.dart';
import '../shared/component/custom_form_filed.dart';
import '../shared/component/icon_row.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';

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
              'Welcome Back!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.propHeight(20)),
            Text('Login to access your personalized real estate experience',
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
                  "Remember me ",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.0,
                  ),
                ),
                Spacer(),
                Text(
                  "Forgot Password? ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.propHeight(20)),
            CustomButton(
              height: context.propHeight(60),
              title: 'continue',
              onPressed: () {
                //if (_formKey.currentState!.validate()) {
                //print('Validated');
                // }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewScreen(),
                    ));
              },
            ),
            SizedBox(height: context.propHeight(90)),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconRow(
                  onFacebookPressed: () {},
                  onGooglePressed: () {},
                  onApplePressed: () {},
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
