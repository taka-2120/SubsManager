import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:subsmanager/domain/auth/auth_services.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/widgets/dialogs/alert.dart';
import 'package:subsmanager/presentation/widgets/loading_overlay_widget.dart';
import 'package:subsmanager/presentation/widgets/page_title_widget.dart';
import 'package:subsmanager/presentation/widgets/rounded_button_widget.dart';
import 'package:subsmanager/presentation/widgets/textfield_set_widget.dart';

class ForgetPass extends HookWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final isLoading = useState(false);
    final TextEditingController emailCtl = TextEditingController();

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
                          title: "Forget Password",
                          back: true,
                          rightButton: false,
                          rightFunc: null,
                          rightIcon: null,
                        ),
                        const SizedBox(height: 15),
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
                                divider: false,
                                showTitle: true,
                                bottomNotes:
                                    "The reset email will be sent to this address.",
                              ),
                              const SizedBox(height: 50),
                              RoundededButton(
                                text: "Send Reset Email",
                                fontColor: Colors.black,
                                topPad: 20,
                                isDisabled: false,
                                backgroundColor: Theme.of(context).primaryColor,
                                onTap: () async {
                                  if (emailCtl.text == "") {
                                    await showDialog(
                                      barrierColor: Colors.black26,
                                      context: context,
                                      builder: (_) {
                                        return const CustomAlertDialog(
                                          title: "Error",
                                          description:
                                              "Please enter your email.",
                                          isOkOnly: true,
                                        );
                                      },
                                    );
                                  } else {
                                    isLoading.value = true;
                                    await AuthServices().resetPassword(
                                      context,
                                      email: emailCtl.text,
                                    );
                                    isLoading.value = false;
                                  }
                                },
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
