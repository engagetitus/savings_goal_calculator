import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'display.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final _goal = TextEditingController();
  final _current = TextEditingController();
  final _monthly = TextEditingController();
  DateTime now = DateTime.now(); // creating an instance ot datetime
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Savings'),
      ),
      body: Column(
        children: [
          SizedBox(
              // Lesson 1 - MediaQuery
              height: MediaQuery.of(context).size.height * .15,
              child: Image.asset('assets/piggy-bank.png')),
          //           textfields(goal,current_savings,monthly_contribution)
          // Lesson 2 - Material Styles
          Text(
            'E-Piggy Savings',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'Starting: ' + DateFormat('EEEE, MM/d/y').format(now),
            style: Theme.of(context).textTheme.titleLarge,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _goal,
                    decoration: const InputDecoration(labelText: 'Your Goal'),
                  ),
                  TextFormField(
                    controller: _current,
                    decoration:
                        const InputDecoration(labelText: 'Current Savings'),
                  ),
                  TextFormField(
                    controller: _monthly,
                    decoration: const InputDecoration(labelText: 'Monthly'),
                  ),
                  // datetimepicker (start_date)
                  // button (calculate)
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Map<String, dynamic> results = {
                                'goal': _goal.text,
                                'current': _current.text,
                                'monthly': _monthly.text,
                                'date': now
                              };
                              // navigate to display
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Display(
                                            results: results,
                                          )));
                            },
                            child: const Text('Calculate')),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
