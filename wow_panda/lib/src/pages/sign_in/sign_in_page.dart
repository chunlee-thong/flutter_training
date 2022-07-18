import 'package:flutter/material.dart';
import 'package:wow_panda/src/pages/sign_up/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ///
  TextEditingController emailTC = TextEditingController(text: "");
  TextEditingController passwordTC = TextEditingController(text: "");

  GlobalKey<FormState> formKey = GlobalKey();

  bool _obscureText = false;
  bool rememberme = false;

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
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 64,
                      foregroundColor: Colors.white,
                      child: const Icon(Icons.fastfood, size: 64),
                    ),
                    const SizedBox(height: 24),
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
                          onTap: () => setState(() => _obscureText = !_obscureText),
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
                          onChanged: (value) => setState(() => rememberme = value!),
                        ),
                        const Text("Remember me?"),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool isValidate = formKey.currentState!.validate();
                          if (isValidate) {}
                        },
                        child: const Text("Sign In"),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Doesn't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignUpPage();
                                },
                              ),
                            );
                          },
                          child: const Text("Sign up now"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
