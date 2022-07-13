import 'package:flutter/material.dart';

enum KeyType {
  num,
  email,
  url,
  norm,
}

TextInputType setKeyType(KeyType type) {
  switch (type) {
    case KeyType.num:
      return TextInputType.number;
    case KeyType.email:
      return TextInputType.emailAddress;
    case KeyType.url:
      return TextInputType.url;
    case KeyType.norm:
      return TextInputType.text;
  }
}
