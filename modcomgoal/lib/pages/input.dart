import 'dart:math';

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
  final _date = TextEditingController();
  DateTime? selectedDate; // creating an instance ot datetime
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
              child: Image.asset(
                'assets/piggy-bank.png',
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : null,
              )),
          //           textfields(goal,current_savings,monthly_contribution)
          // Lesson 2 - Material Styles
          Text(
            'E-Piggy Savings',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'Starting: ' +
                '${selectedDate == null ? ' Note Selected' : DateFormat('EEEE, MM/d/y').format(selectedDate ?? DateTime.now())}',
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
                  TextFormField(
                    readOnly: true,
                    onTap: () async {
                      // WAIT for user to select Date
                      _selectDate();
                    },
                    controller: _date,
                    decoration:
                        const InputDecoration(labelText: 'Start Saving'),
                  ),
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
                                'date': selectedDate
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

  Future _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 7)),
        lastDate: DateTime.now().add(const Duration(days: 60)));
    if (picked != null) {
      setState(() {
        // update Controller
        _date.text =
            DateFormat('EEEE, MM/d/y').format(selectedDate ?? DateTime.now());
        selectedDate = picked;
      });
    }
    // save date to _date (Format)
  }
}
