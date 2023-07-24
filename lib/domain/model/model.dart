class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class Customer {
  String id;
  String name;
  int numberOfNotifications;

  Customer({
    required this.id,
    required this.name,
    required this.numberOfNotifications,
  });
}

class Contacts {
  String email;
  String phone;
  String link;

  Contacts({
    required this.email,
    required this.phone,
    required this.link,
  });
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication({
    required this.customer,
    required this.contacts,
  });
}

class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo({
    required this.name,
    required this.identifier,
    required this.version,
  });
}
