import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:ecommerce/presentation/auth/pages/siginin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController(
    text: "Süleyman ",
  );
  final TextEditingController _lastNameCon = TextEditingController(
    text: "Harbelioğlu",
  );
  final TextEditingController _emailCon = TextEditingController(
    text: "harba.suleyman@gmail.com",
  );
  final TextEditingController _passwordCon = TextEditingController(
    text: "cmylmZ.31",
  );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _siginText(),
            const SizedBox(height: 20),
            _form(context),
            const SizedBox(height: 20),
            _continueButton(context),
            const SizedBox(height: 20),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  _form(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _firstNameField(),
          const SizedBox(height: 20),
          _lastNameField(),
          const SizedBox(height: 20),
          _emailField(),
          const SizedBox(height: 20),
          _passwordField(context),
        ],
      ),
    );
  }

  Widget _siginText() {
    return const Text(
      'Create Account',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameField() {
    return TextFormField(
      controller: _firstNameCon,
      decoration: const InputDecoration(hintText: 'Firstname'),
      validator: (value) {
        if (value!.isEmpty) {
          return "enter your name";
        }
        return null;
      },
    );
  }

  Widget _lastNameField() {
    return TextFormField(
      controller: _lastNameCon,
      decoration: const InputDecoration(hintText: 'Lastname'),
      validator: (value) {
        if (value!.isEmpty) {
          return "enter your lastname";
        }
        return null;
      },
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email Address'),
      validator: (value) {
        if (!EmailValidator.validate(value!)) {
          return "enter valid email ";
        }
        return null;
      },
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Password'),
      validator: (value) {
        if (value!.length <= 5) {
          return "password must be more than 5 characters";
        }
        return null;
      },
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          AppNavigator.push(
            context,
            GenderAndAgeSelectionPage(
              userCreationReq: UserCreationReq(
                firstName: _firstNameCon.text,
                email: _emailCon.text,
                lastName: _lastNameCon.text,
                password: _passwordCon.text,
              ),
            ),
          );
        }
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Do you have an account? "),
          TextSpan(
            text: 'Signin',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.pushReplacement(context, SigninPage());
                  },
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
