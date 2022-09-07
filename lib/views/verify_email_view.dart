import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/extensions/buildcontext/loc.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.verify_email),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                context.loc.verify_email_view_prompt,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextButton(
                onPressed: () async {
                  context.read<AuthBloc>().add(
                        const AuthEventSendEmailVerification(),
                      );
                },
                child: Text(context.loc.verify_email_send_email_verification),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  side: const BorderSide(color: Colors.white, width: 1),
                  elevation: 5,
                  minimumSize: const Size(100, 50),
                  shadowColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        const AuthEventLogOut(),
                      );
                },
                child: Text(context.loc.restart),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  side: const BorderSide(color: Colors.white, width: 1),
                  elevation: 5,
                  minimumSize: const Size(100, 50),
                  shadowColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
