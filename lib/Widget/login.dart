import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DB/Login_DB.dart';
import 'chart.dart';

class Login extends StatefulWidget {
  const Login({ Key key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double screenW, screenH;
  LoginDb _loginDb;
  String  Token; 
  Future<void> getjaon() async {
    
    var url = Uri.parse("https://smartfarmpro.com/v1/api/security/token");
    var resp = await http.post(url, body: {
      "Grant_Type": 'password', "Username": 'Orange', "Password": "SmartFarm@Orange2022"
    });
    _loginDb=loginDbFromJson(resp.body);
    setState(() {
          Token = _loginDb.accessToken;  
          loading = false;
        });  
  } 
   bool loading = true;
  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.33),
            radius: 1.0,
            colors: <Color>[Colors.white, Colors.green],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           buildLogin(),
           buildSignUp(),
          ],),
        ),
      ),
    );


    
  }

  Container buildLogo() {
    return Container(width: screenW * 0.6,);
  }


  Container buildLogin() {
    try{
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenW * 0.75,
      height: screenH * 0.07,
      child: ElevatedButton(
        onPressed: () {
          getjaon();
         loading
            ? CircularProgressIndicator()
            : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Summary(Token: _loginDb.accessToken),
                            ),
                          );
        },
        
        //  Navigator.pushNamed(context, '/showMapPresent'),
        child: Text('Log in',style: TextStyle(
                    fontSize: 23,
                    color: Colors.green
                  ),),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
    }catch(e){
      print('e ===> ${e.toString()} ');
    }
  }
  Container buildSignUp() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenW * 0.75,
      height: screenH * 0.07,
      child: ElevatedButton(
        onPressed: () {
         
        },
        //  Navigator.pushNamed(context, '/showMapPresent'),
        child: Text('Sign Up', style: TextStyle(
                    fontSize: 23,
                  ),),
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}