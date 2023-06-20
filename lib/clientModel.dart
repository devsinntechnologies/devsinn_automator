class ClientData {
  List<Data>? data;

  ClientData({this.data});

  ClientData.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? vendorName;
  String? address;
  String? vendorContact;
  String? vendorPhone;
  dynamic? totalAmount;
  String? emailAddress;

  Data(
      {this.vendorName,
      this.address,
      this.vendorContact,
      this.vendorPhone,
      this.totalAmount,
      this.emailAddress});

  Data.fromJson(Map<String, dynamic> json) {
    vendorName = json['Vendor Name'];
    address = json['Address'];
    vendorContact = json['Vendor Contact'];
    vendorPhone = json['Vendor Phone'];
    totalAmount = json['Total Amount'];
    emailAddress = json['Email Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Vendor Name'] = this.vendorName;
    data['Address'] = this.address;
    data['Vendor Contact'] = this.vendorContact;
    data['Vendor Phone'] = this.vendorPhone;
    data['Total Amount'] = this.totalAmount;
    data['Email Address'] = this.emailAddress;
    return data;
  }
}
