select * from customer where last_name = 'Sender';
select count(package_id) from package INNER JOIN pickup on package.package_id = pickup.fk_package_id where pickup.address like "%Vienna"
select customer.first_name, customer.last_name, package.size from customer INNER JOIN package ON package.package_id = customer.customer_id WHERE package.size > 1;
select employee.first_name, employee.last_name, processes.date from employee INNER JOIN processes on processes.fk_employee_id = employee.employee_id WHERE processes.date = "2020-07-11"
select customer.first_name, customer.last_name, receives.time from customer INNER JOIN receives on receives.fk_customer_id = customer.customer_id WHERE receives.time between "2020-07-10 9:00" and "2020-07-12 9:00"
select customer.first_name, customer.last_name, processes.date, delivery.address from customer INNER JOIN processes on processes.fk_customer_id = customer.customer_id INNER JOIN delivery on customer.customer_id = delivery.fk_customer_id WHERE delivery.address like "%1130 Vienna"
/*bonus*/ select customer.first_name, customer.last_name, pickup.address, receives.time, processes.time, delivery.name, delivery.address from customer INNER JOIN receives on customer.customer_id = receives.fk_customer_id INNER JOIN pickup on customer.customer_id = pickup.fk_customer_id INNER JOIN processes on customer.customer_id = processes.fk_customer_id INNER JOIN delivery on customer.customer_id = delivery.fk_customer_id