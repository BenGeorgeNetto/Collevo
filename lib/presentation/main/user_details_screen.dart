import 'package:collevo/services/preferences/preferences_service.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final preferencesService = PreferencesService();

  String? name;
  String? email;
  String? rollNo;
  String? dept;
  String? sid;
  String? batch;
  late String batchYear;
  late String batchClass;
  late String deptExpanded;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    final preferencesService = PreferencesService();
    email = await preferencesService.getEmail();
    name = await preferencesService.getName();
    rollNo = await preferencesService.getRollNo();
    sid = await preferencesService.getStudentId();
    batch = await preferencesService.getBatch();
    dept = await preferencesService.getDept();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var batchSplit = batch!.split('_');
    String batchYear = '${batchSplit[1]} - ${int.parse(batchSplit[1]) + 4}';

    switch (dept) {
      case 'CSE':
        deptExpanded = 'Computer Science and Engineering';
        break;
      case 'ECE':
        deptExpanded = 'Electronics and Communication Engineering';
        break;
      case 'EEE':
        deptExpanded = 'Electrical and Electronics Engineering';
        break;
      case 'ME':
        deptExpanded = 'Mechanical Engineering';
        break;
      case 'CE':
        deptExpanded = 'Civil Engineering';
        break;

      default:
        deptExpanded = 'Department not found';
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '$name',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Student ID",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '$sid',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Class Roll No",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '$rollNo',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Department",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                deptExpanded,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Batch",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                batchYear,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Email",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '$email',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
