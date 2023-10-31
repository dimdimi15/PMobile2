import "package:flutter/material.dart";
import "package:flutter_application_1/page/profile.dart";
import "package:fluttertoast/fluttertoast.dart";

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final globalkey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = new TextEditingController();
  get onPressed => print('Clicked!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalkey,
        body: Container(
            padding: EdgeInsets.only(
              top: 64,
              bottom: 64,
              left: 24,
              right: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'EDIT PROFILE',
                      style: TextStyle(fontSize: 40, color: Colors.blueAccent),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama kamu',
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  child: TextButton(
                      onPressed: () {
                        if (nameController.text == '') {
                          //showToast('Silahkan masukkan nama kamu');
                          //showSnackBar('Silahkan masukkan nama kamu');
                          showAlertDialogMaterial(
                              'Silahkan masukkan nama kamu');
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => profile(
                                name: nameController.text,
                              ),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17,
                        ),
                      )),
                ),
              ],
            )));
  }

  showToast(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        webPosition: "center",
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showSnackBar(text) {
    final snackbar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          print('Clicked Undo');
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  showAlertDialogMaterial(text) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Info',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              print('Cliecked No');
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 247, 94, 74)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)))),
            child: Text(
              'No',
              style: TextStyle(
                color: Color.fromARGB(255, 243, 243, 243),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              print('Cliecked Yes');
            },
            child: Text('Yes'),
          ),
        ],
        elevation: 5,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      barrierColor: const Color.fromARGB(255, 44, 44, 44).withOpacity(0.7),
      barrierDismissible: false,
    );
  }
}
