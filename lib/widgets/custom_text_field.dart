import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.size,
    required this.onPress,
    required this.icon,
    required this.textHint,
  }) : super(key: key);

  final Size size;
  final ValueChanged<String> onPress;
  final IconData icon;
  final String textHint;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isValidate = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: widget.size.height * 0.06,
        width: widget.size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: isValidate ? Colors.black45 : Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          autofillHints: const [AutofillHints.email],
          validator:
              (widget.textHint == 'Email') ? validateEmail : validateName,
          onChanged: widget.onPress,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: widget.textHint,
            errorStyle: const TextStyle(fontSize: 13, letterSpacing: 0.8),
            icon: Icon(
              widget.icon,
              color: isValidate ? Colors.black45 : Colors.red,
            ),
          ),
        ),
      ),
    ]);
  }

  String? validateEmail(String? value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value!)) {
      setState(() {
        isValidate = false;
      });
      return 'Enter a valid email address';
    } else {
      setState(() {
        isValidate = true;
      });
      return null;
    }
  }

  String? validateName(String? value) {
    if (value!.trim().isEmpty) {
      setState(() {
        isValidate = false;
      });
      return 'Name can\'t be empty';
    } else {
      setState(() {
        isValidate = true;
      });
      return null;
    }
  }
}
