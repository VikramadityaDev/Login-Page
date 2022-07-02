import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginPagez extends StatefulWidget {
  const LoginPagez({Key? key}) : super(key: key);

  @override
  State<LoginPagez> createState() => _LoginPagezState();
}

class _LoginPagezState extends State<LoginPagez> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.white]),
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1595970353725-7ff5bcdc036b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
            fit: BoxFit.cover,
          ),
        ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 90),
              Text(
                  "Welcome",
                  style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                ),
                ),
              Text(
                "Explore the new experince with Azel",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 50),
              loginUI()
            ],
          ),
        ),
      ),
      ),
    );
  }
// creating a function login
  loginUI() {
    //loggedIn
    //loginControllers

    return Consumer<LoginController>(builder: (context, model, child) {

      //if we are already logged in
      if(model.userDetails!= null)
        {
          return Center(
            child: loggedIn(model),
          );
        }
      else
        {
          return loginControllers(context);
        }
    });
  }

  loggedIn(LoginController model)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      // our Ui will have 3 childern, name, email, photo, logout button

      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),

        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        // logout
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
          onPressed: ()
            {
              Provider.of<LoginController>(context, listen: false).logout();
            }
        )
      ],
    );
  }


  loginControllers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              "assets/images/google.png",
            width: 240,
            ),
            onTap: ()
              {
                Provider.of<LoginController>(context, listen: false).googleLogin();
              }
          ),

          SizedBox(height: 10,),

          // GestureDetector(
          //     child: Image.asset(
          //       "assets/images/fb.png",
          //       width: 240,
          //     ),
          //     onTap: ()
          //     {
          //       Provider.of<LoginController>(context, listen: false).facebooklogin();
          //     }
          // ),
        ],
      ),
    );
  }
}
