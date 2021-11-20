import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/Profile/components/user_info.dart';
import 'package:food_delivery_app/Ui/screens/custom_background.dart';
import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:food_delivery_app/Ui/widgets/button.dart';

class MyAddress extends StatelessWidget {
  MyAddress({Key? key, required this.user}) : super(key: key);
  final _auth.User user;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String address = '';
    return Scaffold(
      body: Column(
        children: [
          CustomBackground(
            size: size,
            widget: UserInfo(
              hasBackButton: true,
              user: user,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: AddressTextInput(
                    color: Colors.black45,
                    size: size,
                    onPress: (val) {
                      address = val;
                    },
                  ),
                ),
                const SizedBox(height: 40,),
                CustomButton(size: size, text: 'Submit', onPress: (){})
              ],
            ),
          )
          
        ],
      ),
    );
  }
}

class AddressTextInput extends StatefulWidget {
  const AddressTextInput({
    Key? key,
    required this.size,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Function(String) onPress;

  @override
  State<AddressTextInput> createState() => _AddressTextInputState();
}

class _AddressTextInputState extends State<AddressTextInput> {
  bool isValidate = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: widget.size.height * 0.1,
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
          keyboardType: TextInputType.multiline,
         
          maxLines: 3,
          style: TextStyle(color: widget.color, fontSize: 18),
          autofillHints: const [AutofillHints.email],
          validator: (val) {
            if (val!.isEmpty) {
              setState(() {
                isValidate = false;
              });
              return 'Field can\'t be empty';
            }
          },
          onChanged: widget.onPress,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Address',
            hintStyle: TextStyle(
              color: widget.color,
            ),
            errorStyle: const TextStyle(fontSize: 13, letterSpacing: 0.8),
            icon: Icon(
              Icons.location_on_outlined,
              color: isValidate ? widget.color : Colors.red,
            ),
          ),
        ),
      ),
    ]);
  }
}
