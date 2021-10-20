import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({
    Key? key,
    required this.size,
    required this.onPress,
  }) : super(key: key);

  final Size size;
  final ValueChanged<String> onPress;

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool obscurePassword = true;
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
      SizedBox(
        height: widget.size.height * 0.08,
        width: widget.size.width * 0.75,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: widget.size.width * 0.40,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp("[0-9a-zA-Z@#\$%^&*_-]"))
              ],
              validator: (value) {
                if (value!.length < 8) {
                  setState(() {
                    isValidate = false;
                  });
                  return "Password must be of six characters long.";
                } else {
                  setState(() {
                    isValidate = true;
                  });
                  return null;
                }
              },
              onChanged: widget.onPress,
              keyboardType: TextInputType.multiline,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Password",
                errorStyle: const TextStyle(
                    fontSize: 13,
                    letterSpacing: 0.8,
                    overflow: TextOverflow.ellipsis),
                icon: Icon(
                  Icons.lock_outline,
                  color: isValidate ? Colors.black45 : Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            alignment: Alignment.bottomRight,
            onPressed: () {
              obscurePassword = !obscurePassword;
              setState(() {});
            },
            icon: Icon(Icons.visibility_outlined,
                color: isValidate ? Colors.black45 : Colors.red),
          ),
        ),
      ),
    ]);
  }
}
