import 'package:flutter/material.dart';
import 'package:heacker_app/authentication/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heacker_app/authentication/Auth.dart';
import 'package:heacker_app/authentication/login_view.dart';

class RegisterPage extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController cPasswordController = TextEditingController(text: "");
  TextEditingController umurController = TextEditingController(text: "");

  Gender selectedGender;
  List<Gender> genders = [Gender("Male"), Gender("Female")];

  List<DropdownMenuItem> generateItems(List<Gender> genders) {
    List<DropdownMenuItem> items = [];
    for (var item in genders) {
      items.add(DropdownMenuItem(
        child: Text(item.type),
        value: item,
      ));
    }
    return items;
  }

  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            _iconRegistrasi(),
            _titleDescription(),
            _textField(),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _iconRegistrasi() {
    return Image.asset(
      "assets/images/Logo.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Registrasi",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        )
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Full Name",
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Email Address",
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 3.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Password",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.white),
          obscureText: true,
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: cPasswordController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 3.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Comfirm Password",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.white),
          obscureText: true,
          autofocus: false,
        ),
        Container(
          padding: EdgeInsets.only(top: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
                decoration: InputDecoration(
                    hintText: "Gender",
                    fillColor: Colors.white,
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.underlineTextField,
                        width: 3.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.wc, color: Colors.white)),
                value: selectedGender,
                items: generateItems(genders),
                onChanged: (item) {
                  setState(() {
                    selectedGender = item;
                  });
                }),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        InkWell(
          onTap: () async {
            // Varibale Logs
            print('Name: ${nameController.text}');
            print('Email: ${emailController.text}');
            print('Password: ${passwordController.text}');
            print('Confirm Password: ${cPasswordController.text}');
            print('Gender: ${selectedGender.type}');

            if (passwordController.text.trim() !=
                cPasswordController.text.trim()) {
              Fluttertoast.showToast(
                  msg: "Password must be same",
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              await Auth.signUp(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      selectedGender.type)
                  .then((value) {
                if (value != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }
              });
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              'Registrasi',
              style: TextStyle(color: ColorPalette.primaryColor),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        )
      ],
    );
  }
}

class Gender {
  String type;
  Gender(this.type);
}

// class RegisterPage extends StatefulWidget {
//   static const routeName = "/RegisterPage";
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// TextEditingController nameController = TextEditingController(text: "");
// TextEditingController emailController = TextEditingController(text: "");
// TextEditingController passwordController = TextEditingController(text: "");
// TextEditingController confimPasswordController =
//     TextEditingController(text: "");
// // TextEditingController umurController = TextEditingController(text: "");

// Gender selectedGender;
// List<Gender> genders = [Gender("Pria"), Gender("Wanita")];

// List<DropdownMenuItem> generateItems(List<Gender> genders) {
//   List<DropdownMenuItem> items = [];
//   for (var item in genders) {
//     items.add(DropdownMenuItem(
//       child: Text(item.type),
//       value: item,
//     ));
//   }
//   return items;
// }

// class _RegisterPageState extends State<RegisterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: ColorPalette.primaryColor,
//         padding: EdgeInsets.all(20.0),
//         child: ListView(
//           children: <Widget>[
//             _iconRegistrasi(),
//             _titleDescription(),
//             _textField(),
//             _buildButton(context),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _iconRegistrasi() {
//   return Image.asset(
//     "assets/images/Logo.png",
//     width: 150.0,
//     height: 150.0,
//   );
// }

// Widget _titleDescription() {
//   return Column(
//     children: <Widget>[
//       Padding(
//         padding: EdgeInsets.only(top: 16.0),
//       ),
//       Text(
//         "Registrasi",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16.0,
//         ),
//       )
//     ],
//   );
// }

// Widget _textField() {
//   return Column(
//     children: <Widget>[
//       Padding(
//         padding: EdgeInsets.only(top: 12.0),
//       ),
//       TextFormField(
//         controller: nameController,
//         decoration: const InputDecoration(
//           border: UnderlineInputBorder(),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: ColorPalette.underlineTextField,
//               width: 1.5,
//             ),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.white,
//               width: 3.0,
//             ),
//           ),
//           hintText: "Full Name",
//           hintStyle: TextStyle(color: Colors.white),
//         ),
//         style: TextStyle(color: Colors.white),
//         autofocus: false,
//       ),
//       Padding(
//         padding: EdgeInsets.only(top: 12.0),
//       ),
//       TextFormField(
//         controller: emailController,
//         decoration: const InputDecoration(
//           border: UnderlineInputBorder(),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: ColorPalette.underlineTextField,
//               width: 1.5,
//             ),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.white,
//               width: 3.0,
//             ),
//           ),
//           hintText: "Email Address",
//           hintStyle: TextStyle(color: Colors.white),
//         ),
//         style: TextStyle(color: Colors.white),
//         autofocus: false,
//       ),
//       Padding(
//         padding: EdgeInsets.only(top: 12.0),
//       ),
//       TextFormField(
//         controller: passwordController,
//         decoration: const InputDecoration(
//           border: UnderlineInputBorder(),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: ColorPalette.underlineTextField,
//               width: 3.0,
//             ),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.white,
//               width: 3.0,
//             ),
//           ),
//           hintText: "Password",
//           hintStyle: TextStyle(color: ColorPalette.hintColor),
//         ),
//         style: TextStyle(color: Colors.white),
//         obscureText: true,
//         autofocus: false,
//       ),
//       TextFormField(
//         controller: confimPasswordController,
//         decoration: const InputDecoration(
//           border: UnderlineInputBorder(),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: ColorPalette.underlineTextField,
//               width: 3.0,
//             ),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.white,
//               width: 3.0,
//             ),
//           ),
//           hintText: "Comfirm Password",
//           hintStyle: TextStyle(color: ColorPalette.hintColor),
//         ),
//         style: TextStyle(color: Colors.white),
//         obscureText: true,
//         autofocus: false,
//       ),
//       Container(
//         width: 300,
//         height: 100,
//         child: DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//             decoration: InputDecoration(
//                 hintText: "Gender",
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10.0),
//                   ),
//                 ),
//                 prefixIcon: Icon(
//                   Icons.wc,
//                 )),
//             value: selectedGender,
//             items: generateItems(genders),
//             onChanged: (item) {
//               setState(() {
//                 selectedGender = item;
//               });
//             },
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _buildButton(BuildContext context) {
//   return Column(
//     children: <Widget>[
//       Padding(
//         padding: EdgeInsets.only(top: 16.0),
//       ),
//       InkWell(
//         onTap: () async {
//           // Varibale Logs
//           print('Username: ${nameController.text}');
//           print('Password: ${emailController.text}');
//           print('Username: ${passwordController.text}');
//           print('Password: ${confimPasswordController.text}');

//           if (passwordController.text.trim() !=
//               confimPasswordController.text.trim()) {
//             Fluttertoast.showToast(
//                 msg: "Password must be same",
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 16.0);
//           } else {
//             print('Accept!');
//           }
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 8.0),
//           width: double.infinity,
//           child: Text(
//             'Registrasi',
//             style: TextStyle(color: ColorPalette.primaryColor),
//             textAlign: TextAlign.center,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.only(top: 16.0),
//       ),
//       Text(
//         'or',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 12.0,
//         ),
//       ),
//       FlatButton(
//         child: Text(
//           'Login',
//           style: TextStyle(color: Colors.white),
//         ),
//         onPressed: () {
//           Navigator.pushNamed(context, "/");
//         },
//       )
//     ],
//   );
// }

// class Gender {
//   String type;
//   Gender(this.type);
// }
