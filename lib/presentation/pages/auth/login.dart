import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/auth/forget_pass.dart';
import 'package:subsmanager/presentation/pages/auth/register.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/widgets/loading_overlay_widget.dart';
import 'package:subsmanager/presentation/widgets/buttons/rounded_button_widget.dart';
import 'package:subsmanager/presentation/widgets/textfields/textfield_set_widget.dart';
import 'package:subsmanager/use_case/auth_controller.dart';
import 'package:subsmanager/use_case/functions/keyboard_func.dart';

class LogIn extends HookWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final isLoading = useState(false);
    final TextEditingController emailCtl = TextEditingController();
    final TextEditingController passCtl = TextEditingController();

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: const DefaultAppBar(),
          body: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "lib/assets/icon.png",
                                  height: 120,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Text(
                                l10n.welcome,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: Column(
                            children: [
                              TextFieldSet(
                                title: l10n.email,
                                type: KeyType.email,
                                controller: emailCtl,
                                secured: false,
                                suggestion: false,
                                divider: true,
                                showTitle: true,
                              ),
                              TextFieldSet(
                                title: l10n.pass,
                                type: KeyType.norm,
                                controller: passCtl,
                                secured: true,
                                suggestion: false,
                                divider: false,
                                showTitle: true,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ForgetPass(),
                                    ),
                                  );
                                },
                                child: Text(l10n.forget_pass),
                              ),
                              const SizedBox(height: 30),
                              RoundededButton(
                                text: l10n.login,
                                fontColor: Colors.black,
                                topPad: 20,
                                isDisabled: false,
                                backgroundColor: Theme.of(context).primaryColor,
                                onTap: () => AuthController().connectFB(
                                  context,
                                  isLoading: isLoading,
                                  isLogin: true,
                                  email: emailCtl.text,
                                  pass: passCtl.text,
                                ),
                              ),
                              RoundededButton(
                                text: l10n.register,
                                topPad: 20,
                                isDisabled: false,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Register(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLoading.value) const LoadingOverlay()
      ],
    );
  }
}
