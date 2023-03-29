import 'package:flutter/material.dart';
import 'package:virtualvault/pages/authentication/authenticatewallet.dart';
import 'package:virtualvault/pages/authentication/newwallet.dart';
import 'package:virtualvault/widgets/custom_buttons.dart';

import '../../widgets/custom_textfields.dart';

class CreateWallet extends StatefulWidget {
  const CreateWallet({super.key});

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text("Create your wallet.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width / 7,
                  fontWeight: FontWeight.bold)),
          Text("We need your wallet access in order to sign transactions.",
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontSize: 20,
              )),
          const SizedBox(
            height: 20,
          ),
          // PhoneField(
          //   controller: phoneController,

          //   hintText: "98765XXXXX",
          //   labelText: "Phone number",
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // PrivateKeyField(
          //   controller: nameController,
          //   hintText: "username",
          //   labelText: "Username",
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          DefaultButton(
            text: "I have private key",
            onPress: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AuthenticateWallet())),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButtonBlack(
              text: "Create new one",
              onPress: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewWallet()))),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    )));
  }
}
