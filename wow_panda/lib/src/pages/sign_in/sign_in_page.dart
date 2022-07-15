import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ///
  TextEditingController emailTC = TextEditingController(text: "chunlee@gmail.com");
  TextEditingController passwordTC = TextEditingController(text: "123456");

  GlobalKey<FormState> formKey = GlobalKey();

  ///

  bool _obscureText = false;
  bool rememberme = false;
  String? gender;

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
                  // const SizedBox(height: 600),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    onChanged: (value) {},
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: rememberme,
                        onChanged: (value) {
                          setState(() {
                            rememberme = value!;
                          });
                        },
                      ),
                      const Text("Remember me?"),
                    ],
                  ),
                  // DropdownButtonFormField<String>(
                  //   value: gender,
                  //   items: const [
                  //     DropdownMenuItem(
                  //       value: "Male",
                  //       child: Text("Male"),
                  //     ),
                  //     DropdownMenuItem(
                  //       value: "Female",
                  //       child: Text("Female"),
                  //     ),
                  //   ],
                  //   onChanged: (value) {
                  //     setState(() {
                  //       gender = value!;
                  //     });
                  //   },
                  // ),
                  // Slider.adaptive(
                  //   value: 1,
                  //   onChanged: (value) {},
                  //   min: 0.0,
                  //   max: 100,
                  // ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool isValidate = formKey.currentState!.validate();
                        if (isValidate) {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019),
                            lastDate: DateTime.now(),
                          );

                          // await showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return AlertDialog(
                          //       content: Column(
                          //         mainAxisSize: MainAxisSize.min,
                          //         children: [
                          //           Text(emailTC.text),
                          //           Text(passwordTC.text),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // );
                        }
                      },
                      child: const Text("Sign In"),
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
