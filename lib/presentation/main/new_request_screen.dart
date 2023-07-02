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

  final List<String> _dropdownItems1 = [
    'Communication Skills',
    'Hardware Skills',
    'Technical Skill Development',
    'NSS/NCC',
    'Sports and Games',
    'Cultural Activities',
    'Leadership and Management',
    'Professional Self Initiatives',
    'Entrepreneurship and Innovation',
    'Community Outreach'
  ];

  final Map<String, List<String>> _dropdownItems2 = {
    'Communication Skills': ['Communicative English'],
    'Hardware Skills': ['IEDC Lab'],
    'Technical Skill Development': ['Simulation Software', 'SDP'],
    'NSS/NCC': [
      'Participation',
      'Outstanding Performance',
      'Best NSS Volunteer',
      'Participation in National Integration Camp',
      'Pre Republic Day Parade camp',
      'Participation in Republic Day Parade camp',
      'International Youth Exchange Program'
    ],
    'Sports and Games': [
      'Sports: Participation',
      'Sports: First Prize',
      'Sports: Second Prize',
      'Sports: Third Prize',
      'Games: Participation',
      'Games: First Prize',
      'Games: Second Prize',
      'Games: Third Prize'
    ],
    'Cultural Activities': [
      'Music: Participation',
      'Music: First Prize',
      'Music: Second Prize',
      'Music: Third Prize',
      'Performing Arts: Participation',
      'Performing Arts: First Prize',
      'Performing Arts: Second Prize',
      'Performing Arts: Third Prize',
      'Literary Arts: Participation',
      'Literary Arts: First Prize',
      'Literary Arts: Second Prize',
      'Literary Arts: Third Prize'
    ],
    'Leadership and Management': [
      'Student Professional Bodies',
      'Department Association',
      'Festival/Tech Event/Sports',
      'Hobby Clubs',
      'Student Representative (Senate)'
    ],
    'Professional Self Initiatives': [
      'Tech Fest and Tech Quiz',
      'MOOC with Certification',
      'Foreign Language Skills',
      'Competitions by Professional Societies',
      'Attending Seminar/Workshop other than with tech fest',
      'Paper Presentation at IIT/NIT/Reputed Institution',
      'Paper publication in International/National Journals',
      'Paper Presentation at other places',
      'Poster Presentation at IIT/NIT/Reputed Institution',
      'Poster Presentation at other places',
      'Industrial Training/Internship',
      'IV/Exhibition Visit'
    ],
    'Entrepreneurship and Innovation': [
      'Startup',
      'Patent',
      'Prototype developed and tested',
      'Awards for products developed',
      'Innovative tech developed and used by industries or other stakeholders',
      'Received venture capital for funding for innovative ideas/products',
      'Startup Employment',
      'Societal Innovation'
    ],
    'Community Outreach': ['Community Outreach Activities']
  };
  final Map<String, List<String>> _dropdownItems3 = {
    'Communicative English': ['Level 1', 'Level 2'],
    'IEDC Lab': ['Basic hardware lab'],
    'Simulation Software': ['By Department', 'By IEDC', 'Others'],
    'SDP': ['By Department', 'By IEDC', 'Others'],
    'Participation': ['NSS', 'NCC'],
    'Outstanding Performance': ['NSS', 'NCC'],
    'Best NSS Volunteer': ['University Level', 'State Level', 'National Level'],
    'Participation in National Integration Camp': ['NSS', 'NCC'],
    'Pre Republic Day Parade camp': ['NSS', 'NCC'],
    'Participation in Republic Day Parade camp': ['NSS', 'NCC'],
    'International Youth Exchange Program': ['NSS', 'NCC'],
    'Sports: Participation': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Sports: First Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Sports: Second Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Sports: Third Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Games: Participation': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Games: First Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Games: Second Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Games: Third Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Music: Participation': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Music: First Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Music: Second Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Music: Third Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Performing Arts: Participation': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Performing Arts: First Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Performing Arts: Second Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Performing Arts: Third Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Literary Arts : Participation': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Literary Arts : First Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Literary Arts : Second Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Literary Arts : Third Prize': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Student Professional Bodies': [
      'Core Cordinator',
      'Sub Cordinator',
      'Volunteer',
    ],
    'Department Association': [
      'Core Cordinator',
      'Sub Cordinator',
      'Volunteer',
    ],
    'Festival/Tech Event/Sports': [
      'Core Cordinator',
      'Sub Cordinator',
      'Volunteer',
    ],
    'Hobby Clubs': [
      'Core Cordinator',
      'Sub Cordinator',
      'Volunteer',
    ],
    'Student Representative (Senate)': [
      'Chairman',
      'Secretary',
      'Other Member',
      'Class Representative',
      'Editor',
      'Editorial Board'
    ],
    'Tech Fest and Tech Quiz': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Competitions by Professional Societies': [
      'Level 1',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level 5'
    ],
    'Paper Presentation at IIT/NIT/Reputed Institution': [
      'Participation',
      'Certificate of Recogniton'
    ],
    'Paper publication in International/National Journals': [
      'Participation',
      'Certificate of Recogniton'
    ],
    'Paper Presentation at other places': [
      'Participation',
      'Certificate of Recogniton'
    ],
    'Poster Presentation at IIT/NIT/Reputed Institution': [
      'Participation',
      'Certificate of Recogniton'
    ],
    'Poster Presentation at other places': [
      'Participation',
      'Certificate of Recogniton'
    ],
    'IV/Exhibition Visit': ['IV', 'Exhibition Visit'],
    'Startup': ['Company registered legally'],
    'Patent': [
      'Patent Filed',
      'Patent Published',
      'Patent Approved',
      'Patent Licensed'
    ],
    'Prototype developed and tested': ['Prototype developed and tested'],
    'Awards for products developed': ['Awards for products developed'],
    'Innovative tech developed and used by industries or other stakeholders': [
      'Innovative tech developed and used by industries or other stakeholders'
    ],
    'Received venture capital for funding for innovative ideas/products': [
      'Received venture capital for funding for innovative ideas/products'
    ],
    'Startup Employment': [
      'Offering jobs to two persons not less than 15K INR per month'
    ],
    'Societal Innovation': ['Societal Innovation'],
    'Community Outreach Activities': ['1 week', '2 weeks']
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
                        _selectedItem2 = null;
                        _selectedItem3 = null;
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
                              _selectedItem3 = null;
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
