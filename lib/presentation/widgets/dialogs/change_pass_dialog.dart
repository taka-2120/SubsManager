import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/auth/auth_services.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/auth/forget_pass.dart';
import 'package:subsmanager/presentation/widgets/textfields/textfield_set_widget.dart';
import 'package:subsmanager/use_case/functions/keyboard_func.dart';

class ChangePassDialog extends HookConsumerWidget {
  const ChangePassDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final currentPassController = TextEditingController();
    final newPassController = TextEditingController();
    final isEmptyError = useState(false);
    final isLoading = useState(false);

    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Change Password",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFieldSet(
              title: "Current Password",
              type: KeyType.norm,
              controller: currentPassController,
              secured: true,
              suggestion: true,
              divider: true,
              showTitle: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFieldSet(
              title: "New Password",
              type: KeyType.norm,
              controller: newPassController,
              secured: true,
              suggestion: true,
              divider: false,
              showTitle: false,
            ),
          ),
          isEmptyError.value
              ? const Text(
                  "Please cannot be empty these fields.",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              : const SizedBox(
                  height: 10,
                ),
          TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgetPass(),
                ),
              );
            },
            child: const Text("Forget Password"),
          ),
          const Divider(
            height: 1,
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: InkWell(
                  onTap: () async {
                    if (currentPassController.text == "" ||
                        newPassController.text == "") {
                      isEmptyError.value = true;
                    } else {
                      isLoading.value = true;
                      await AuthServices().updatePassword(
                        context,
                        currentPassword: currentPassController.text,
                        newPassword: newPassController.text,
                      );
                      isLoading.value = false;
                      Future.microtask(() {
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  child: Center(
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      l10n.d_cancel,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
