// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Chargers CLI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> _commands = const [
    {
      'name': 'Change Availability',
      'command': 'changeAvailability',
    },
    {
      'name': 'Delete Charger',
      'command': 'deleteCharger',
    },
    {
      'name': 'List Chargers',
      'command': 'listChargers',
    },
    {
      'name': 'Remote Auth',
      'command': 'remoteAuth',
    },
    {
      'name': 'Request Variables',
      'command': 'requestVariables',
    },
    {
      'name': 'Reset Charger',
      'command': 'resetCharger',
    },
    {
      'name': 'Send Local List',
      'command': 'sendLocalList',
    },
    {
      'name': 'Stop Transaction',
      'command': 'stopTransaction',
    },
    {
      'name': 'Transaction Status',
      'command': 'transactionStatus',
    },
    {
      'name': 'Trigger Message',
      'command': 'triggerMessage',
    },
    {
      'name': 'Unlock Connector',
      'command': 'unlockConnector',
    },
    {
      'name': 'Update Charger',
      'command': 'updateCharger',
    },
    {
      'name': 'Update Variables',
      'command': 'updateVariables',
    },
    {
      'name': 'Variable Table',
      'command': 'variablesTable',
    },
  ];

  final TextEditingController _controller = TextEditingController();

  void _insertCommand(String command) {
    setState(() {
      _controller.text = command;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 75.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: mediaQuery.width * .7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Charger Name - ID',
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 350,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color.fromARGB(255, 226, 228, 243)),
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return const Text(
                                  '> Place Holder Text \n\n This will be dynamically populated with incoming messages from the charging station once we build out the backend most likely using FutureBuilder class');
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: _controller,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: EdgeInsets.only(top: 7.0),
                                child: Text(
                                  '>',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              hintText: 'Enter command...',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Send',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: mediaQuery.width * .2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Commands',
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _commands.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0,
                                    bottom: 4.0,
                                    right: 8.0,
                                    left: 8.0),
                                child: ElevatedButton(
                                  onPressed: (() => _insertCommand(
                                      _commands[index]['command'] as String)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      _commands[index]['name'] as String,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
