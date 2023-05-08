import 'package:flutter/material.dart';
import 'package:mysports/authentication/login/login.dart';
import 'package:mysports/authentication/signin/signin.dart';
import 'package:mysports/authentication/widgets/button.dart';

class choise extends StatefulWidget {
  final bool user;

  const choise({super.key, required this.user});
  @override
  State<choise> createState() => _choiseState();
}

class _choiseState extends State<choise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cricket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logos/transparent.png',
              width: 260,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You Need to Log In or Create an Account to Contine.",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            button(
              text: "log In with Email",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => login(
                      user: widget.user,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            button(
              text: "Sign In with Email",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => signin(
                      user: widget.user,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            widget.user
                ? button(
                    text: "Join With Us",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const choise(
                            user: false,
                          ),
                        ),
                      );
                    },
                  )
                : Container(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
