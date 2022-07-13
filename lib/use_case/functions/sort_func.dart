import 'package:subsmanager/l10n/l10n.dart';

enum SortOptions {
  alphAcc,
  alphDec,
  dateAcc,
  dateDec,
  priceAcc,
  priceDec,
}

String getSortOptionsString(L10n l10n, SortOptions sortOptions) {
  switch (sortOptions) {
    case SortOptions.alphAcc:
      return l10n.alph_acc;
    case SortOptions.alphDec:
      return l10n.alph_dec;
    case SortOptions.dateAcc:
      return l10n.date_acc;
    case SortOptions.dateDec:
      return l10n.date_dec;
    case SortOptions.priceAcc:
      return l10n.price_acc;
    case SortOptions.priceDec:
      return l10n.price_dec;
  }
}
