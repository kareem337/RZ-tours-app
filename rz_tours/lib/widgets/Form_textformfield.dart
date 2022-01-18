
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Form_field extends StatefulWidget {

  const Form_field({ Key? key, }) : super(key: key);
  @override
  _FormState createState() => _FormState();
}
class _FormState extends State<Form_field> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  String category = 'Category1';
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Container(
      child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                TextFormField(
                  controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                    isDense: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty ) {
                      return 'Unfilled field';
                    }
                  },
                ),
                SizedBox(height: 10)
                
              ],
          ),
              
      ),
    ),
    );
  }
}
  
  
