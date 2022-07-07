import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:subsmanager/use_case/get_favicon.dart';

class Favicon extends HookWidget {
  const Favicon({
    required this.url,
    required this.altColor,
    Key? key,
  }) : super(key: key);

  final String url;
  final Color altColor;

  @override
  Widget build(BuildContext context) {
    final favicon = useState<Image?>(null);
    final hasIcon = useState(false);

    useEffect(() {
      getFavicon(url: url).then((list) {
        favicon.value = list[0];
        hasIcon.value = list[1];
      });
      return;
    });

    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(4),
      child: hasIcon.value
          ? favicon.value
          : Icon(
              Icons.brightness_1_rounded,
              color: altColor,
            ),
    );
  }
}
