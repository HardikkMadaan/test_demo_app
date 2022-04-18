import 'dart:collection';

class CheckInList {
  List<CheckIn> checkInList;

  CheckInList({required this.checkInList});

  factory CheckInList.fromJson(dynamic json) => CheckInList(
    checkInList: UnmodifiableListView<CheckIn>(
      json.map<CheckIn>((employee) {
        final _data = Map.from(employee);
        return CheckIn.fromJson(_data);
      }).toList(),
    ),
  );

  List<dynamic> toJson() {
    return checkInList.map((v) => v.toJson()).toList();
  }
}

class CheckIn {
  String? checkin;
  String? location;
  String? purpose;
  String? id;
  String? employeeId;

  CheckIn(
      {this.checkin, this.location, this.purpose, this.id, this.employeeId});

  CheckIn.fromJson(Map<dynamic, dynamic> json) {
    checkin = json['checkin'];
    location = json['location'];
    purpose = json['purpose'];
    id = json['id'];
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['checkin'] = checkin;
    data['location'] = location;
    data['purpose'] = purpose;
    data['id'] = id;
    data['employeeId'] = employeeId;
    return data;
  }
}