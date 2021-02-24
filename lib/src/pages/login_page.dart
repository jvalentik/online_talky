import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:online_talky/src/common/utils.dart';
import 'package:online_talky/src/model/form_data.dart';
import 'package:online_talky/src/model/user.dart';
import 'package:online_talky/src/pages/home_page.dart';
import 'package:online_talky/src/widgets/loader.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormData formData = FormData();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Email is required'),
                        EmailValidator(errorText: 'Please enter a valid email'),
                      ],
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Your email address',
                      labelText: 'Email',
                    ),
                    onChanged: (value) {
                      formData.email = value;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: RequiredValidator(errorText: 'Full name is required'),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Full name',
                    ),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) {
                      formData.name = value;
                    },
                  ),
                  if (isLoading) const Loader(),
                  ElevatedButton(
                    child: Text('Sign In'),
                    onPressed: isLoading
                        ? null
                        : () async {
                            var currentFocus = FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus &&
                                currentFocus.focusedChild != null) {
                              FocusManager.instance.primaryFocus.unfocus();
                            }
                            var isValid = _formKey.currentState.validate();
                            if (!isValid) {
                              _showDialog('Please fill in your email and password');
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Signing in...'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                              simulateLoginCheck(
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  HomePage.routeName,
                                  arguments: User.formFormData(formData),
                                ),
                              );
                            }
                          },
                  ),
                ].expand(
                  (widget) => [
                    widget,
                    SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
