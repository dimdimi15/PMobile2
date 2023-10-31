import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  final String name;
  profile({required this.name});

  @override
  State<profile> createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            print('kembali ke awal');
          },
        ),
        title: Center(child: Text('Profile')),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                  'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/b106b80c-8787-48df-b3c1-dc2b49c46e6b/width=450/5699db0a-55ca-4392-b6d6-3984bf3630e3_width=512&height=768%20-%20Copia%20-%20Copia%20-%20Copia%20-%20Copia%20-%20Copia%20-%20Copia%20(3)%20-%20Copia.jpeg'),
            ),
            SizedBox(
              height: 13,
            ),
            Center(
                child: Text(
              widget.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
