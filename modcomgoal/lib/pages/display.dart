import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Display extends StatefulWidget {
  final Map<String, dynamic> results;
  const Display({super.key, required this.results});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late int goal = int.tryParse(widget.results['goal']) ?? 0;

  late int current = int.tryParse(widget.results['current']) ?? 0;
  late int monthly = int.tryParse(widget.results['monthly']) ?? 0;
  late DateTime start =
      DateTime.parse(widget.results['date'].toString()); // DateTime
// logic here
// - % achieved - (goal-current/goal)%
// - time to reach goal - (goal-current)/monthly_contribution - (in Months)
// - next installment (add 30 days from (startdate))

  double achieved() {
    //Lesson 3 - Error Handling
    double percentage = 0;
    try {
      percentage = ((goal - current) / goal) * 100;
    } catch (e) {
      percentage = 0;
    }
    return percentage;
  }

  int timeToGoal() {
    return (goal - current) ~/ monthly;
  }

  DateTime nextInstallment() {
    DateTime next = start.add(const Duration(days: 30));
    return next;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.displaySmall;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings Plan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${achieved().toStringAsFixed(2)} % Achieved',
            style: style!.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            'Current ' + NumberFormat().format(current),
            style: style.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
              // Lesson 1 - MediaQuery
              height: MediaQuery.of(context).size.height * .15,
              child: Image.asset('assets/piggy-bank.png')),
          //           textfields(goal,current_savings,monthly_contribution)
          // Lesson 2 - Material Styles

// - text (time to reach goal)
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  '${timeToGoal()}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Text(
                'months to reach goal',
              ),
            ],
          ),
// - text (next installment)
          Text(
            'Next Installation On:\n ${DateFormat('EEE d MMM y').format(nextInstallment())}',
            style: style,
          ),
          //
          Text(
            'Next Installation in ${nextInstallment().difference(start).inHours} Hours',
            style: style,
          )
// - button
        ],
      ),
    );
  }
}
