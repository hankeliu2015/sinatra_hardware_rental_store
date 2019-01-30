# Tool.create(name: "Palm Sander", quantity: 1, rental_date: "Jan 26th, 2019", return_date: "Jan 31st, 2019", cost_per_day: 5, conditions: "fair")
# Tool.create(name: "Electric Jig Saw", quantity: 1, rental_date: "Jan 27th, 2019", return_date: "Jan 30st, 2019", cost_per_day: 10, conditions: "good")
# Tool.create(name: "Table Saw", quantity: 1, rental_date: "Jan 28th, 2019", return_date: "Jan 30st, 2019", cost_per_day: 15, conditions: "good")
# Tool.create(name: "Floor Sander", quantity: 1, rental_date: "", return_date: "", cost_per_day: 50, conditions: "Need repair")
# Tool.create(name: "Floor Stripper", quantity: 1, rental_date: "", return_date: "", cost_per_day: 65, conditions: "broken")

# Customer.create(username: "hank", email: "hank@gmail.com", password: "password")
# Customer.create(username: "henry", email: "henry@gmail.com", password: "password")

Customer.create(username: "mike", email: "mike@gmail.com", password: "password")
Customer.create(username: "michael", email: "michael@gmail.com", password: "password")

Tool.create(name: "Floor Polisher", quantity: 1, rental_date: "Jan 29th, 2019", return_date: "Feb 1st, 2019", cost_per_day: 110, conditions: "fair", customer_id: 1)
Tool.create(name: "Wet Vacuum", quantity: 1, rental_date: "Jan 29th, 2019", return_date: "Feb 2nd, 2019", cost_per_day: 115, conditions: "good", customer_id: 2)
