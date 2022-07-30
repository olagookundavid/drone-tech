import 'package:drone_app/storage_service.dart';
import 'package:flutter/material.dart';

TextEditingController id = TextEditingController();
TextEditingController weight = TextEditingController();
TextEditingController manufacturer = TextEditingController();
TextEditingController serviced = TextEditingController();
TextEditingController dateacquired = TextEditingController();
bool isTextEmpty() {
  if (id.text.isEmpty ||
      weight.text.isEmpty ||
      manufacturer.text.isEmpty ||
      serviced.text.isEmpty ||
      dateacquired.text.isEmpty) {
    return true;
  } else {
    return false;
  }
}

addNewDialog(context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      scrollable: true,
      title: const Text('Add New Drone'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller(id, hintText: 'ID'),
              controller(weight, hintText: 'Weight(KG)'),
              controller(manufacturer, hintText: 'Manufactuter'),
              controller(serviced, hintText: 'Serviced/UnServiced'),
              controller(dateacquired, hintText: 'Date(DD/MM/YY)')
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultButton(
              color: Colors.blue.withOpacity(0.6),
              textcolor: Colors.white,
              onpressed: () {
                if (id.text.isEmpty ||
                    weight.text.isEmpty ||
                    manufacturer.text.isEmpty ||
                    serviced.text.isEmpty ||
                    dateacquired.text.isEmpty) {
                  return;
                } else {
                  StorageService().addDrone(id.text, weight.text,
                      manufacturer.text, serviced.text, dateacquired.text);
                  id.clear();
                  weight.clear();
                  manufacturer.clear();
                  serviced.clear();
                  dateacquired.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Drone'),
            ),
            DefaultButton(
              color: Colors.red.withOpacity(0.6),
              textcolor: Colors.black,
              onpressed: () {
                id.clear();
                weight.clear();
                manufacturer.clear();
                serviced.clear();
                dateacquired.clear();
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

TextField controller(TextEditingController controller,
    {String? hintText, Widget? suffix}) {
  return TextField(
    controller: controller,
    decoration:
        InputDecoration(suffixIcon: suffix, filled: true, hintText: hintText),
  );
}

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.child,
      required this.color,
      required this.textcolor,
      required this.onpressed})
      : super(key: key);
  final Widget child;
  final Color color;
  final Color textcolor;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: textcolor),
          )),
      onPressed: onpressed,
      child: child,
    );
  }
}
