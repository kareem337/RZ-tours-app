import 'package:flutter/material.dart';
import 'package:rz_tours/widgets/ADD_Form.dart';
import 'package:rz_tours/widgets/Form_textformfield.dart';
class Add_product extends StatefulWidget {
  static String id = "Addprouct";
  const Add_product({Key? key}) : super(key: key);

  @override
  State<Add_product> createState() => _Add_productState();
}

class _Add_productState extends State<Add_product> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  String category = 'Category1';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Museum'),
        ),
        body: Form_page());
  }
}
