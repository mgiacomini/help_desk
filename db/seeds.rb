departments_quantity = 5
tickets_quantity = 20
staffs_quantity = 5
posts_quantity = 10

Status.create(short_title: 'staff_wait', title: 'Waiting for Staff Response')
Status.create(short_title: 'customer_wait', title: 'Waiting for Customer')
Status.create(short_title: 'on_hold', title: 'On Hold')
Status.create(short_title: 'cancelled', title: 'Cancelled')
Status.create(short_title: 'completed', title: 'Completed')

1.upto(departments_quantity){|i| Department.create(title: "Sample Departament ##{i}")}

Ticket.create(
	customer_name: "Drobazko Alex", 
	customer_email: "drobazko@gmail.com",
	subject: Faker::Lorem.sentence, 
	body: Faker::Lorem.paragraph,
	department: Department.find(rand(1..departments_quantity))
)

1.upto(tickets_quantity){|i| 
	Ticket.create(
		customer_name: Faker::Name.name, 
		customer_email: Faker::Internet.email,
		subject: Faker::Lorem.sentence, 
		body: Faker::Lorem.paragraph,
		department: Department.find(rand(1..departments_quantity))
	)
}

Staff.create!(
	name: 'Admin', 
	email: 'admin@helpdesk.com', 
	password: '12345678', 
	password_confirmation: '12345678', 
	role: 'admin'
)

Staff.create(name: 'Admin', email: 'admin@helpdesk.com', password: '12345678', password_confirmation: '12345678', role: 'admin')

1.upto(staffs_quantity){|i| 
	staff = Staff.new(
		name: Faker::Name.name, 
		email: "member_#{i}@helpdesk.com", 
		password: '12345678', 
		password_confirmation: '12345678'
	)

	1.upto(posts_quantity){|j| staff.posts.new(
		body: "It's Simple Sample Stuff ##{i} Post ##{j}. #{Faker::Lorem.paragraph} Enjoy It!",
		ticket: Ticket.find(rand(1..tickets_quantity))
		)
	}
	
	staff.save
}



