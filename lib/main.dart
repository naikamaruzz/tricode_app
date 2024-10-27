import 'package:flutter/material.dart';

void main() => runApp(CitySeedApp());

class CitySeedApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: SignUpLoginPage(),
		);
	}
}

class SignUpLoginPage extends StatefulWidget {
	@override
	_SignUpLoginPageState createState() => _SignUpLoginPageState();
}

class _SignUpLoginPageState extends State<SignUpLoginPage> {
	bool isSignUp = true; // Toggle between sign up and log in
	String selectedOption = "CitySeed";
	List<String> loginOptions = ["CitySeed", "CityCo"];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("City Seed", textAlign: TextAlign.center),
				centerTitle: true,
				backgroundColor: Colors.green,
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: [
						Text(
							isSignUp ? "Sign Up" : "Log In",
							textAlign: TextAlign.center,
							style: TextStyle(
								fontSize: 24,
								fontWeight: FontWeight.bold,
								color: Colors.green,
							),
						),
						SizedBox(height: 24),
						if (isSignUp) ...[
							DropdownButtonFormField(
								value: selectedOption,
								items: loginOptions.map((String option) {
									return DropdownMenuItem<String>(
										value: option,
										child: Text(option),
									);
								}).toList(),
								onChanged: (String? newValue) {
									setState(() {
										selectedOption = newValue!;
									});
								},
								decoration: InputDecoration(
									labelText: "Login as",
									border: OutlineInputBorder(),
								),
							),
							SizedBox(height: 24),
						],
						TextField(
							decoration: InputDecoration(
								labelText: "Username",
								border: OutlineInputBorder(),
							),
						),
						SizedBox(height: 16),
						if (isSignUp) // Show email field only during sign-up
							TextField(
								decoration: InputDecoration(
									labelText: "Email",
									border: OutlineInputBorder(),
								),
							),
						SizedBox(height: 16),
						TextField(
							decoration: InputDecoration(
								labelText: "Password",
								border: OutlineInputBorder(),
							),
							obscureText: true,
						),
						SizedBox(height: 24),
						ElevatedButton(
							onPressed: () {
								// Add sign-up or log-in logic here
							},
							child: Text(isSignUp ? "Sign Up" : "Log In"),
							style: ElevatedButton.styleFrom(
								backgroundColor: Colors.green,
							),
						),
						SizedBox(height: 16),
						TextButton(
							onPressed: () {
								setState(() {
									isSignUp = !isSignUp; // Toggle the form
								});
							},
							child: Text(
								isSignUp ? "Already have an account? Log In" : "Don't have an account? Sign Up",
								style: TextStyle(color: Colors.green),
							),
						),
					],
				),
			),
		);
	}
}
