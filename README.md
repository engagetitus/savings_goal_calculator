# savings_goal_calculator
Flutter Training Resource

## Structure:
- Input Screen: Enter savings goal, current savings, and monthly contribution.
- Result Screen: Display time to reach goal.
## Steps:
- Create input fields for savings details.
- Calculate time to reach the goal.
- Display the result.

# Lab Session
screens - input,Display,data (.dart)
input 
- textfields(goal,current_savings,monthly_contribution)
- datetimepicker (start_date)
- button (calculate)

display
- background image
- Image (money/bank)
- text (% achieved) 
- text (time to reach goal)
- text (next installment)
- button
logic here
- % achieved - (goal-current/goal)%
- time to reach goal - (goal-current)/monthly_contribution - (in Months)
- next installment (add 30 days from (startdate))
