import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/textfield_set_widget.dart';
import 'package:subsmanager/use_case/user_data/notifier/user_data.dart';

class UsernameDialog extends HookConsumerWidget {
  const UsernameDialog({
    Key? key,
    required this.title,
    required this.currentName,
  }) : super(key: key);

  final String title, currentName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final userData = ref.watch(userDataProvider.select((value) => value));
    final readUserData = ref.read(userDataProvider.notifier);
    final newNameCtl = TextEditingController();

    useEffect(() {
      newNameCtl.text = currentName;
      return;
    });

    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFieldSet(
              title: currentName,
              type: KeyType.norm,
              controller: newNameCtl,
              secured: false,
              suggestion: true,
              divider: false,
              showTitle: false,
            ),
          ),
          userData.error
              ? Text(
                  l10n.e_username_empty,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                )
              : const SizedBox(
                  height: 10,
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
                    await readUserData.updateUsername(newNameCtl.text);
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      l10n.d_save,
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
