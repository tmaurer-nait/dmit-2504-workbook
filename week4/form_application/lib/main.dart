import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("User Signup Form")),
            body: const Padding(
                padding: EdgeInsets.all(16.0), child: UserSignupForm())));
  }
}

class UserSignupForm extends StatefulWidget {
  const UserSignupForm({super.key});

  @override
  State<StatefulWidget> createState() => _UserSignupFormState();
}

class _UserSignupFormState extends State<UserSignupForm> {
  // The key we can use to acces our forms current state
  // This key uniquely identifes the form widget
  final _formKey = GlobalKey<FormState>();

  // create controllers to access the field values
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed to free up memory
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Assigning the key to our form
      child: Column(
        children: [
          const Text("New User Form"),
          TextFormField(
            controller: _userNameController,
            validator: (value) => value == null || value.trim() == ""
                ? "userName cannot be empty"
                : null,
            decoration: const InputDecoration(label: Text("username")),
          ), // Password Input
          PasswordFormField(controller: _passwordController),
          ElevatedButton(
              onPressed: () {
                // Validate the input
                if (_formKey.currentState!.validate()) {
                  // If valid display something to show that the input is valid
                  // Normally this is where we would submit the user data to a server
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Username: ${_userNameController.text} Password: ${_passwordController.text}")));
                }
              }, // Placeholder function
              child: const Text("Sign Up")) // Signup Button
        ],
      ),
    );
  }
}

class PasswordFormField extends FormField<String> {
  final TextEditingController controller;

  PasswordFormField(
      {Key? key,
      FormFieldSetter<String>? onSaved,
      FormFieldValidator<String>? validator,
      required this.controller})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            builder: (state) {
              return TextFormField(
                controller: controller,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.trim() == "") {
                    return "Password must not be empty";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(label: Text("password")),
                // Required for correct validation of this field
                onChanged: (value) {
                  state.didChange(value);
                },
              );
            });
}
