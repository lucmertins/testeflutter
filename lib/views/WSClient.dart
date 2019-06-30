import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:testeflutter/utils/NetworkUtil.dart';
import 'package:progress_dialog/progress_dialog.dart';

class WSClient extends StatefulWidget {
  @override
  WSClientState createState() => WSClientState();
}

class WSClientState extends State<WSClient> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _mobile;
  ProgressDialog _pr;

  @override
  Widget build(BuildContext context) {
//    _getId(context).then((onValue) {
//      print("device " + onValue);
//    });
    // Build a Form widget using the _formKey created above.
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Form Validation'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.text,
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile'),
          keyboardType: TextInputType.phone,
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: _getRestfulString,
          child: new Text('Validate'),
        )
      ],
    );
  }

  void _validateInputs() {
    _getId(context).then((onValue) {
      print("device " + onValue);
    });
  }

  void _getRestfulString() {
    _pr = new ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage('Aguarde...');
    _pr.show();
    NetworkUtil netUtil = new NetworkUtil();
    netUtil
        .get(
            "http://192.168.0.49:8080/wsrest/jfrmservices/dev/status/getdescpathjson/testemob")
        .then((dynamic value) {
      _pr.hide();
      print(value.toString());
    }).catchError((onError){
      _pr.hide();
      print(onError);
    });
  }

  Future<String> _getId(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}
