import 'package:flutter/material.dart';
import 'dart:async';

Future<String> tenHocSinh() async {
  await Future.delayed(Duration(seconds: 30));
  return 'Nguyễn Văn A';
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: FutureBuilder<String>(
          future: tenHocSinh(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Lỗi: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Text('Tên: ${snapshot.data}');
            }
            return const Text('Không có dữ liệu');
          },
        ),
      ),
    ),
  );
}