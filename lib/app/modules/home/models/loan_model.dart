import 'dart:convert';

class Loan {
  String id;
  final String fullname;
  final String address;
  final String acctNumber;
  final String backName;
  final String phoneNo;
  final String amount;
  final String duration;
  Loan({
    required this.id,
    required this.fullname,
    required this.address,
    required this.acctNumber,
    required this.backName,
    required this.phoneNo,
    required this.amount,
    required this.duration,
  });

  Loan copyWith({
    String? id,
    String? fullname,
    String? address,
    String? acctNumber,
    String? backName,
    String? phoneNo,
    String? amount,
    String? duration,
  }) {
    return Loan(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      address: address ?? this.address,
      acctNumber: acctNumber ?? this.acctNumber,
      backName: backName ?? this.backName,
      phoneNo: phoneNo ?? this.phoneNo,
      amount: amount ?? this.amount,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'address': address,
      'acctNumber': acctNumber,
      'backName': backName,
      'phoneNo': phoneNo,
      'amount': amount,
      'duration': duration,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      id: map['id'] ?? '',
      fullname: map['fullname'] ?? '',
      address: map['address'] ?? '',
      acctNumber: map['acctNumber'] ?? '',
      backName: map['backName'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      amount: map['amount'] ?? '',
      duration: map['duration'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan.fromJson(String source) => Loan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Loan(id: $id, fullname: $fullname, address: $address, acctNumber: $acctNumber, backName: $backName, phoneNo: $phoneNo, amount: $amount, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Loan &&
      other.id == id &&
      other.fullname == fullname &&
      other.address == address &&
      other.acctNumber == acctNumber &&
      other.backName == backName &&
      other.phoneNo == phoneNo &&
      other.amount == amount &&
      other.duration == duration;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fullname.hashCode ^
      address.hashCode ^
      acctNumber.hashCode ^
      backName.hashCode ^
      phoneNo.hashCode ^
      amount.hashCode ^
      duration.hashCode;
  }
}
