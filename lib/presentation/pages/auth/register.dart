import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/widgets/loading_overlay_widget.dart';
import 'package:subsmanager/presentation/widgets/page_title_widget.dart';
import 'package:subsmanager/presentation/widgets/rounded_button_widget.dart';
import 'package:subsmanager/presentation/widgets/textfield_set_widget.dart';
import 'package:subsmanager/use_case/auth_controller.dart';
import 'package:subsmanager/use_case/functions/keyboard_func.dart';

class Register extends HookWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final isLoading = useState(false);
    final TextEditingController nameCtl = TextEditingController();
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
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const PageTitle(
                          title: "Join Us Now!",
                          back: true,
                          rightButton: false,
                          rightFunc: null,
                          rightIcon: null,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "lib/assets/start.png",
                              height: 120,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              TextFieldSet(
                                title: l10n.username,
                                type: KeyType.norm,
                                controller: nameCtl,
                                secured: false,
                                suggestion: true,
                                divider: true,
                                showTitle: true,
                              ),
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
                              RoundededButton(
                                text: l10n.register,
                                topPad: 20,
                                isDisabled: false,
                                onTap: () => AuthController().connectFB(
                                  context,
                                  isLoading: isLoading,
                                  isLogin: false,
                                  email: emailCtl.text,
                                  pass: passCtl.text,
                                  name: nameCtl.text,
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
