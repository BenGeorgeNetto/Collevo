// TODO: Write activity list with corresponding points
// ? Fetch user points for activityType before selecting dropdown3 or after

import 'package:flutter/material.dart';

class NewRequest extends StatefulWidget {
  const NewRequest({Key? key}) : super(key: key);

  @override
  State<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  String? _selectedItem1;
  String? _selectedItem2;
  String? _selectedItem3;

  final List<String> _dropdownItems1 = ['Option 1', 'Option 2', 'Option 3'];
  final Map<String, List<String>> _dropdownItems2 = {
    'Option 1': ['Option 1.1', 'Option 1.2', 'Option 1.3'],
    'Option 2': ['Option 2.1', 'Option 2.2', 'Option 2.3'],
    'Option 3': ['Option 3.1', 'Option 3.2', 'Option 3.3'],
  };
  final Map<String, List<String>> _dropdownItems3 = {
    'Option 1.1': ['Option 1.1.1', 'Option 1.1.2', 'Option 1.1.3'],
    'Option 1.2': ['Option 1.2.1', 'Option 1.2.2', 'Option 1.2.3'],
    'Option 1.3': ['Option 1.3.1', 'Option 1.3.2', 'Option 1.3.3'],
    'Option 2.1': ['Option 2.1.1', 'Option 2.1.2', 'Option 2.1.3'],
    'Option 2.2': ['Option 2.2.1', 'Option 2.2.2', 'Option 2.2.3'],
    'Option 2.3': ['Option 2.3.1', 'Option 2.3.2', 'Option 2.3.3'],
    'Option 3.1': ['Option 3.1.1', 'Option 3.1.2', 'Option 3.1.3'],
    'Option 3.2': ['Option 3.2.1', 'Option 3.2.2', 'Option 3.2.3'],
    'Option 3.3': ['Option 3.3.1', 'Option 3.3.2', 'Option 3.3.3'],
  };

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
                        _selectedItem2 = null;
                        _selectedItem3 = null;
                      });
                    },
                    items: _dropdownItems1.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    dropdownColor: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Visibility(
                visible: _selectedItem1 != null,
                child: Container(
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
                          _selectedItem3 = null;
                        });
                      },
                      items:
                          _dropdownItems2[_selectedItem1]?.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      dropdownColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Visibility(
                visible: _selectedItem2 != null,
                child: Container(
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
                        });
                      },
                      items:
                          _dropdownItems3[_selectedItem2]?.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      dropdownColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),
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
