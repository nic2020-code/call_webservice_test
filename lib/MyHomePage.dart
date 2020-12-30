import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ConnectDevice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormConnectState();
  }
}

class _FormConnectState extends State<ConnectDevice>
    with WidgetsBindingObserver {
  // final _connectController = TextEditingController();
  TextEditingController textFieldCtrl1;
  TextEditingController textFieldCtrl2;
  TextEditingController textFieldCtrl3;
  // FocusNode focusNode;
  // bool _connectValidate = false;
  String _serial, _pincode, _status;

  void getInfo() async {
    String objText =
        '[{"serial": "$_serial", "pincode": "$_pincode", "status": "$_status",}]';
    String objBody = '<?xml version="1.0" encoding="utf-8"?>' +
        '<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
        '<soap12:Body>' +
        '<RegSerialNo xmlns="http://tempuri.org/">' +
        '<serial>$objText</serial>' +
//         '<pincode>$objText</pincode>' +
//         '<status>$objText</status>' +
        '</RegSerialNo>' +
        '</soap12:Body>' +
        '</soap12:Envelope>';

    final response = await http.post(
        "http://cavn.vn:8020/WebServiceSeateach.asmx",
        body: objBody,
        headers: {
          'Content-Type': 'text/xml; charset=utf-8',
        });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  void initState() {
    textFieldCtrl1 = TextEditingController();
    textFieldCtrl2 = TextEditingController();
    textFieldCtrl3 = TextEditingController();
    // focusNode = FocusNode()..addListener(_rebuildOnFocusChange);
    super.initState();
  }

  void _validateButton() {
    // setState(() {
    getInfo();
    // textFieldCtrl.text.isEmpty || textFieldCtrl.text.length < 6
    //     ? _connectValidate = true
    //     : _connectValidate = false;
    // });
  }

  // void _rebuildOnFocusChange() => setState(() {});

  // void _onButtonPressed() {}

  // void dispose() {
  //   _connectController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Connect Device",
      home: Scaffold(
          body: SafeArea(
              minimum: const EdgeInsets.only(top: 40),
              child: Container(
                child: Column(
                  children: <Widget>[
                    //Appbar
                    SizedBox(height: 38),

                    //Connect device form
                    Flexible(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-z0-9]"))
                              ],
                              maxLength: 6,
                              autofocus: true,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(17, 57, 125, 1))),
                                labelText: 'Nhập mã kết nối',
                                // errorText: _connectValidate
                                //     ? '\* Mã kết nối chưa chính xác\. Vui lòng thử lại'
                                //     : null,
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(193, 199, 208, 1)),
                              ),
                              controller: textFieldCtrl1,
                              // focusNode: focusNode,
                              onChanged: (text) {
                                setState(() {
                                  _serial = text;
                                  // _connectValidate = false;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-z0-9]"))
                              ],
                              maxLength: 6,
                              autofocus: true,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(17, 57, 125, 1))),
                                labelText: 'Nhập mã kết nối',
                                // errorText: _connectValidate
                                //     ? '\* Mã kết nối chưa chính xác\. Vui lòng thử lại'
                                //     : null,
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(193, 199, 208, 1)),
                              ),
                              controller: textFieldCtrl2,
                              // focusNode: focusNode,
                              onChanged: (text) {
                                setState(() {
                                  _pincode = text;
                                  // _connectValidate = false;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-z0-9]"))
                              ],
                              maxLength: 1,
                              autofocus: true,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(17, 57, 125, 1))),
                                labelText: 'Nhập mã kết nối',
                                // errorText: _connectValidate
                                //     ? '\* Mã kết nối chưa chính xác\. Vui lòng thử lại'
                                //     : null,
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(193, 199, 208, 1)),
                              ),
                              controller: textFieldCtrl3,
                              // focusNode: focusNode,
                              onChanged: (text) {
                                setState(() {
                                  _status = text;
                                  // _connectValidate = false;
                                });
                              },
                            ),
                            SizedBox(
                              height: 48,
                            ),

                            //Button
                            SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: new FlatButton(
                                onPressed: _validateButton,
                                child: Text(
                                  'Kết nối'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                textColor: Colors.white,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ))),
      debugShowCheckedModeBanner: false,
    );
  }
}
