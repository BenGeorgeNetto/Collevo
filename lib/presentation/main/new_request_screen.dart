// ? Fetch user points for activityType before selecting dropdown3 or after

import 'package:flutter/material.dart';
import 'package:collevo/data/activities_lists.dart';

class NewRequest extends StatefulWidget {
  const NewRequest({Key? key}) : super(key: key);

  @override
  State<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  String? _selectedItem1;
  String? _selectedItem2;
  String? _selectedItem3;

  int? _selectedIndex1;
  int? _selectedIndex2;
  int? _selectedIndex3;

  final List<String> _dropdownItems1 = dropdownItems1;
  final Map<String, List<String>> _dropdownItems2 = dropdownItems2;
  final Map<String, List<String>> _dropdownItems3 = dropdownItems3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Request"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Activity Type',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text('Select Activity Type'),
                    value: _selectedItem1,
                    isExpanded: true,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedItem1 = newValue;
                        _selectedIndex1 = _dropdownItems1.indexOf(newValue!);
                        _selectedItem2 = null;
                        _selectedIndex2 = null;
                        _selectedItem3 = null;
                        _selectedIndex3 = null;
                      });
                    },
                    items: _dropdownItems1.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.visible,
                        ),
                      );
                    }).toList(),
                    dropdownColor: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Visibility(
                visible: _selectedItem1 != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Activity',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text('Select Activity'),
                          value: _selectedItem2,
                          isExpanded: true,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedItem2 = newValue;
                              _selectedIndex2 = _dropdownItems2[_selectedItem1]
                                  ?.indexOf(newValue!);
                              _selectedItem3 = null;
                              _selectedIndex3 = null;
                            });
                          },
                          items: _dropdownItems2[_selectedItem1]
                              ?.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.visible,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            );
                          }).toList(),
                          dropdownColor: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Visibility(
                visible: _selectedItem2 != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Activity Level',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text('Select Activity Level'),
                          value: _selectedItem3,
                          isExpanded: true,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedItem3 = newValue;
                              _selectedIndex3 = _dropdownItems3[_selectedItem2]
                                  ?.indexOf(newValue!);
                            });
                          },
                          items: _dropdownItems3[_selectedItem2]
                              ?.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.visible,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            );
                          }).toList(),
                          dropdownColor: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Visibility(
                visible: _selectedItem3 != null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Activity Type: $_selectedItem1',
                      ),
                      Text(
                        'Selected Activity: $_selectedItem2',
                      ),
                      Text(
                        'Selected Activity Level: $_selectedItem3',
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Activity ID: ${_selectedIndex1}_${_selectedIndex2}_$_selectedIndex3',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
