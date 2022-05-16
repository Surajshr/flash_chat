import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../Components/cutsomRoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, //ticker provider
      duration: Duration(seconds: 2),
    );
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // controller.reverse(from: 1.0);
    //
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.forward();
    controller.addListener(
      () {
        setState(() {});
        // print(animation.value);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Flash Chat',
                            speed: const Duration(milliseconds: 500)),
                      ],
                      onTap: () {

                      },
                      totalRepeatCount: 5,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            CustomButtom(
              onPress: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
              buttonTitle: 'Log In',
              buttonColor: Colors.lightBlueAccent,
            ),
            CustomButtom(
              onPress: (){
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              buttonTitle: "Register",
              buttonColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
