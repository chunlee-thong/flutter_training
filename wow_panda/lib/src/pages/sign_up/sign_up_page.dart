import 'package:flutter/material.dart';
import 'package:wow_panda/src/constant/app_style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ///
  TextEditingController emailTC = TextEditingController(text: "");
  TextEditingController passwordTC = TextEditingController(text: "");

  GlobalKey<FormState> formKey = GlobalKey();

  bool _obscureText = false;
  String? _gender;

  List<String> genders = ["Male", "Female"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailTC.dispose();
    passwordTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "email is invalid";
                      }
                      return null;
                    },
                    controller: emailTC,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordTC,
                    obscureText: _obscureText,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value!.length < 6) {
                        return "password must be at least 6 characters";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      hintText: "Password",
                      border: kInputBorder,
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _gender,
                    decoration: InputDecoration(
                      hintText: "Gender",
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.green[50],
                      border: kInputBorder,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    items: [
                      for (var i in genders)
                        DropdownMenuItem(
                          value: i,
                          child: Text(i),
                        ),
                    ],
                    onChanged: (value) {
                      _gender = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool isValidate = formKey.currentState!.validate();
                        if (isValidate) {}
                      },
                      child: const Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
