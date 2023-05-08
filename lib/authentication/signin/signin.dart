import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mysports/authentication/userdetails.dart';
import 'package:mysports/authentication/widgets/button.dart';
import 'package:mysports/authentication/widgets/textformfield.dart';
import 'package:mysports/user/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signin extends StatefulWidget {
  final bool user;

  const signin({super.key, required this.user});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool _isotpsend = false;
  bool _loading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _numController = TextEditingController();

  Future _signin() async {
    try {
      setState(() {
        _loading = true;
      });
      final result = await Amplify.Auth.signUp(
        username: _emailController.text,
        password: _passController.text,
        options: CognitoSignUpOptions(
          userAttributes: <CognitoUserAttributeKey, String>{
            CognitoUserAttributeKey.name: _nameController.text,
            CognitoUserAttributeKey.phoneNumber: "+91${_numController.text}",
            CognitoUserAttributeKey.nickname: widget.user ? 'user' : 'owner',
          },
        ),
      );
      SharedPreferences add = await SharedPreferences.getInstance();
      add.setString('name', _nameController.text);
      add.setString('email', _emailController.text);
      add.setString('num', _numController.text);
      add.setString('type', widget.user ? 'user' : 'owner');
      setState(() {
        _isotpsend = result.isSignUpComplete;
        _loading = false;
      });
    } on AuthException catch (e) {
      setState(() {
        _isotpsend = false;
        _loading = false;
      });
      safePrint(e.message);
    }
  }

  Future _verifyotp() async {
    try {
      setState(() {
        _loading = true;
      });
      final result = await Amplify.Auth.confirmSignUp(
        username: _emailController.text,
        confirmationCode: _otpController.text,
      );
      setState(() {
        details.email = _emailController.text;
        details.name = _nameController.text;
        details.num = _nameController.text;
        details.type = widget.user ? 'user' : 'owner';
        if (result.isSignUpComplete) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const user_home(),
            ),
          );
        }
      });
    } on AuthException catch (e) {
      setState(() {
        _isotpsend = false;
        _loading = false;
      });
      _deleteuser();
      safePrint(e.message);
    }
  }

  Future _deleteuser() async {
    try {
      await Amplify.Auth.deleteUser();
      //print('Delete user succeeded');
    } on Exception catch (e) {
      //print('Delete user failed with error: $e');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/logos/transparent.png',
                  width: 260,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Register With Email",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                textformfield(
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                  hint: 'Email',
                  iconData: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                textformfield(
                  textEditingController: _nameController,
                  hint: 'Name',
                  iconData: Icons.person_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                textformfield(
                  textEditingController: _numController,
                  hint: 'Phone Number',
                  iconData: Icons.phone_android_outlined,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                textformfield(
                  textEditingController: _passController,
                  hint: 'Password',
                  pass: true,
                  iconData: Icons.security,
                ),
                _isotpsend
                    ? const SizedBox(
                        height: 20,
                      )
                    : Container(),
                _isotpsend
                    ? OtpTextField(
                        keyboardType: TextInputType.number,
                        numberOfFields: 6,
                        borderColor: const Color(0xFF512DA8),
                        showFieldAsBox: true,
                        onSubmit: (String verificationCode) {
                          _otpController.text = verificationCode;
                          _verifyotp();
                        },
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                _loading
                    ? CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )
                    : button(
                        text: _isotpsend ? "Verify" : "Sign In",
                        ontap: () {
                          if (!_isotpsend) {
                            _signin();
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
