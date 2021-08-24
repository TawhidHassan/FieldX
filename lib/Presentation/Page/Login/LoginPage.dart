// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:fieldx/Bloc/User/user_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Presentation/Widgets/Button/MaterialRoundButton.dart';
import 'package:fieldx/Presentation/Widgets/Button/ProgressAnimatedButton.dart';
import 'package:fieldx/Presentation/Widgets/TextField/NormalTextField.dart';
import 'package:fieldx/Presentation/Widgets/TextField/PasswordField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_button/progress_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emilController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  TextEditingController deviceNameController=new TextEditingController();
  SharedPreferences sharedPreferences;
  final _globalkey = GlobalKey<FormState>();
  bool circule;
  bool validate;
  ButtonState progressButtonState = ButtonState.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if(state is LoginSuccessful){
            final data =(state as LoginSuccessful).login;
            if(data==null){
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  headerAnimationLoop: false,
                  animType: AnimType.TOPSLIDE,
                  title: 'Warning',
                  desc: 'Are you credentials wrong',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {})
                  .show();
              setState(() {
                progressButtonState = ButtonState.normal;
              });
            }else{
              storeToken(data.token, data.user.first_name, data.user.last_name, data.user.email, data.user.organization_id);
              Navigator.pushNamed(context, HOME_PAGE);
            }
          }
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          height: 250,
                          child: Lottie.asset('assets/lottie/loginLotti.json'),
                        ),
                        Text("Login",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Login to your account",
                          style: TextStyle(
                              fontSize: 15,
                              color:Colors.grey[700]),)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        key: _globalkey,
                        child: Column(
                          children: <Widget>[
                            // InkWell(
                            //     onTap: (){
                            //       setState(() {
                            //         progressButtonState = ButtonState.normal;
                            //       });
                            //     },
                            //     child: Text("sssss")),
                            NormalInputField(controller:emilController ,hintText: "Enter Your Email",icon: Icons.alternate_email,),
                            SizedBox(height: 10,),
                            PasswordTextField(label: "Password",controller: passwordController,),
                            SizedBox(height: 10,),
                            NormalInputField(controller:deviceNameController ,hintText: "Enter Your Device Name",icon: Icons.mobile_friendly_sharp,),

                            ProgressAnimatedButton(text: "Login",colors: Colors.redAccent,progressButtonState: progressButtonState,tap: (){
                              if (_globalkey.currentState.validate()) {
                                setState(() {
                                  validate = true;
                                  progressButtonState = ButtonState.inProgress;
                                });
                                print(emilController.text);
                                BlocProvider.of<UserCubit>(context).logIn(emilController.text,passwordController.text,deviceNameController.text);

                              }

                            },)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  void storeToken(String token,String name,String lastName,String email,String orgId) async{
    sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
    sharedPreferences.setString("name", name);
    sharedPreferences.setString("lastName", lastName);
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("orgId", orgId);

  }

}



