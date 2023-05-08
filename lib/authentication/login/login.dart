import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mysports/authentication/userdetails.dart';
import 'package:mysports/authentication/widgets/button.dart';
import 'package:mysports/authentication/widgets/textformfield.dart';
import 'package:mysports/user/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  final bool user;

  const login({super.key, required this.user});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _loading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  Future _login() async {
    try {
      setState(() {
        _loading = true;
      });
      final result = await Amplify.Auth.signIn(
        username: _emailController.text,
        password: _passController.text,
      );
      if (result.isSignedIn) {
        final user = await Amplify.Auth.fetchUserAttributes();
        print(user);
        SharedPreferences add = await SharedPreferences.getInstance();
        // ignore: unused_local_variable
        for (final data in user) {
          // ignore: unrelated_type_equality_checks
          if (data.userAttributeKey == 'name') {
            add.setString('name', data.value);
            details.name = data.value;
          }
          // ignore: unrelated_type_equality_checks
          else if (data.userAttributeKey == 'phone_number') {
            add.setString('num', data.value);
            details.num = data.value;
          }
        }
        //add.setString('name', _nameController.text);
        add.setString('email', _emailController.text);
        //add.setString('num', _numController.text);
        add.setString('type', 'user');
        details.email = _emailController.text;
        details.type = widget.user ? 'user' : 'owner';
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const user_home(),
          ),
          (route) => false,
        );
      }
    } on AuthException catch (e) {
      setState(() {
        _loading = false;
      });
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
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
                  "Login Now",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter details to continue",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                textformfield(
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                  hint: 'Email',
                  iconData: Icons.email,
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
                const SizedBox(
                  height: 20,
                ),
                _loading
                    ? CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )
                    : button(
                        text: 'Log In',
                        ontap: () {
                          _login();
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
