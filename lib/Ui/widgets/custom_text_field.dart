import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.size,
    required this.onPress,
    required this.icon,
    required this.textHint,
    this.color = Colors.black45,
  }) : super(key: key);

  final Size size;
  final ValueChanged<String> onPress;
  final IconData icon;
  final String textHint;
  Color color;

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
          color: Colors.white.withOpacity(0.2),
          border: Border.all(
            color: isValidate ? widget.color : Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          style: TextStyle(color: widget.color, fontSize: 18),
          textCapitalization: (widget.textHint == 'Email')
              ? TextCapitalization.none
              : TextCapitalization.words,
          autofillHints: const [AutofillHints.email],
          validator:
              (widget.textHint == 'Email') ? validateEmail : validateName,
          onChanged: widget.onPress,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: widget.textHint,
            hintStyle: TextStyle(
              color: widget.color,
            ),
            errorStyle: const TextStyle(fontSize: 13, letterSpacing: 0.8),
            icon: Icon(
              widget.icon,
              color: isValidate ? widget.color : Colors.red,
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
