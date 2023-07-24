// to convert the response into a non nullable object (model)

import 'package:complete_advanced_flutter/app/extensions.dart';
import 'package:complete_advanced_flutter/data/responses/responses.dart';
import 'package:complete_advanced_flutter/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseModel on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      id: this?.id?.orEmpty() ?? EMPTY,
      name: this?.name?.orEmpty() ?? EMPTY,
      numberOfNotifications: this?.numberOfNotifications?.orZero() ?? ZERO,
    );
  }
}

extension ContactsResponseModel on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      email: this?.email?.orEmpty() ?? EMPTY,
      link: this?.link?.orEmpty() ?? EMPTY,
      phone: this?.phone?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponseModel on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      contacts: this?.contacts?.toDomain(),
      customer: this?.customer?.toDomain(),
    );
  }
}
