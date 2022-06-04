import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../widgets/page_title.dart';

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            PageTitle(
              title: l10n.credits,
              back: true,
              rightButton: false,
              rightFunc: null,
              rightIcon: null,
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: const [
                              Text(
                                  "Icons made by Freepik from www.flaticon.com"),
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
