import 'dart:convert';

class Loan {
  String id;
  final String fullname;
  final String address;
  final String acctNumber;
  final String bankName;
  final String phoneNo;
  final String amount;
  final String duration;
  final String reason;
  final bool isPaid;
  final String date_created;
  final int index;
  Loan({
    required this.id,
    required this.fullname,
    required this.address,
    required this.acctNumber,
    required this.bankName,
    required this.phoneNo,
    required this.amount,
    required this.duration,
    required this.reason,
    required this.isPaid,
    required this.date_created,
    required this.index,
  });

  Loan copyWith({
    String? id,
    String? fullname,
    String? address,
    String? acctNumber,
    String? bankName,
    String? phoneNo,
    String? amount,
    String? duration,
    String? reason,
    bool? isPaid,
    String? date_created,
    int? index,
  }) {
    return Loan(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      address: address ?? this.address,
      acctNumber: acctNumber ?? this.acctNumber,
      bankName: bankName ?? this.bankName,
      phoneNo: phoneNo ?? this.phoneNo,
      amount: amount ?? this.amount,
      duration: duration ?? this.duration,
      reason: reason ?? this.reason,
      isPaid: isPaid ?? this.isPaid,
      date_created: date_created ?? this.date_created,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'address': address,
      'acctNumber': acctNumber,
      'bankName': bankName,
      'phoneNo': phoneNo,
      'amount': amount,
      'duration': duration,
      'reason': reason,
      'isPaid': isPaid,
      'date_created': date_created,
      'index': index,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      id: map['id'] ?? '',
      fullname: map['fullname'] ?? '',
      address: map['address'] ?? '',
      acctNumber: map['acctNumber'] ?? '',
      bankName: map['bankName'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      amount: map['amount'] ?? '',
      duration: map['duration'] ?? '',
      reason: map['reason'] ?? '',
      isPaid: map['isPaid'] ?? false,
      date_created: map['date_created'] ?? '',
      index: map['index']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan.fromJson(String source) => Loan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Loan(id: $id, fullname: $fullname, address: $address, acctNumber: $acctNumber, bankName: $bankName, phoneNo: $phoneNo, amount: $amount, duration: $duration, reason: $reason, isPaid: $isPaid, date_created: $date_created, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Loan &&
      other.id == id &&
      other.fullname == fullname &&
      other.address == address &&
      other.acctNumber == acctNumber &&
      other.bankName == bankName &&
      other.phoneNo == phoneNo &&
      other.amount == amount &&
      other.duration == duration &&
      other.reason == reason &&
      other.isPaid == isPaid &&
      other.date_created == date_created &&
      other.index == index;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fullname.hashCode ^
      address.hashCode ^
      acctNumber.hashCode ^
      bankName.hashCode ^
      phoneNo.hashCode ^
      amount.hashCode ^
      duration.hashCode ^
      reason.hashCode ^
      isPaid.hashCode ^
      date_created.hashCode ^
      index.hashCode;
  }
}
