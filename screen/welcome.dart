import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/signin.dart';
import 'package:flutter_application_1/screen/signup.dart';
import 'package:flutter_application_1/widgets/custom_scaffold.dart';
import 'package:flutter_application_1/widgets/welcome_button.dart';


class welcomescreen extends StatelessWidget {
const welcomescreen({super.key});
@override
Widget build(BuildContext context) {
return CustomScaffold(
child: Column(
children: [
Flexible(
flex: 8,
child: Container(
padding: const EdgeInsets.symmetric(
vertical: 0,
horizontal: 40.0,
),
child: Center(
child: RichText(
textAlign: TextAlign.center,
text: const TextSpan(
children: [
TextSpan(
text: 'Welcome Back! \n',
style: TextStyle(
fontSize: 45.0,
fontWeight: FontWeight.w600,
)),
TextSpan(
text:
'\n enter personal details tot your employee account',

style: TextStyle(
fontSize: 20,
)),
],
),
),
),
)),
const Flexible(
flex: 1,
child: Align(
alignment: Alignment.bottomRight,
child: Row(
children: [
Expanded(
child: welcome_button(
buttontext: 'Sign in',
onTap: Signin(),
),
),
Expanded(
child: welcome_button(
buttontext: 'Sign Up',
onTap: Signup(),
),
),
],
),
),
),
],
),
);
}
}