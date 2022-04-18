import 'dart:collection';

class EmployeeList {
  List<Employee> employeeList;

  EmployeeList({required this.employeeList});

  factory EmployeeList.fromJson(dynamic json) => EmployeeList(
    employeeList: UnmodifiableListView<Employee>(
      json.map<Employee>((employee) {
        final _data = Map.from(employee);
        return Employee.fromJson(_data);
      }).toList(),
    ),
  );

  List<dynamic> toJson() {
    return employeeList.map((v) => v.toJson()).toList();
  }
}

class Employee {
  String? createdAt;
  String? name;
  String? avatar;
  String? email;
  String? phone;
  List<String>? department;
  String? birthday;
  String? country;
  String? id;

  Employee(
      {this.createdAt,
      this.name,
      this.avatar,
      this.email,
      this.phone,
      this.department,
      this.birthday,
      this.country,
      this.id});

  Employee.fromJson(Map<dynamic, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    phone = json['phone'];
    department = json['department'].cast<String>();
    birthday = json['birthday'];
    country = json['country'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['avatar'] = avatar;
    data['email'] = email;
    data['phone'] = phone;
    data['department'] = department;
    data['birthday'] = birthday;
    data['country'] = country;
    data['id'] = id;
    return data;
  }
}
