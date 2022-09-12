# Question 1: Understand A Relation

>"Read the following relation represented as a table and answer the questions."
>
>![ERD diagram](./img/q1.png)

What is the name of this relation: MotorVehicleCollisions

What is the degree of this relation: 11

What is the cardinality of this relation: 9

What might be the primary key of this relation: COLLISION_ID

What is the domain of ZIP CODE: char(5)

What is the domain of CRASH DATE: date

# Question 2: Interpret an ERD

>"Translate the ERAD to a Relational Model. Make sure you represent the Relational Model by a set of Relational Schemas, and explicitly represent the primary key(s) and foreign key(s)."
>
>![ERD diagram](./img/q1.png)

- Drivers(Name, EmployeeID, SSN, DoB, Phone, MentorID(fk), DivisionName(fk))
- Drivers_Drivers(EmployeeID(fk), FriendID(fk))
- Dependents(ID, Name, Gender, DoB, EmployeeID(fk))
- Cars(CarID, Manufactor, Model, Year)
- Driver_Car(EmployeeID(fk), CarID(fk))
- Division(DivisionName, Location, Phone, Email)
