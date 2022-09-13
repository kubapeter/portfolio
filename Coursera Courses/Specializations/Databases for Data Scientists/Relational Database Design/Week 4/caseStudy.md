# Step 1: Background

> "Your client, PetsCare, is a local clinic that takes care of pets, including pet wellness and vaccination, medical services, surgery including spay and neuter, dental cleaning and treatment, grooming, etc. PetsCare has served the community for more than 20 years, and has been successful in the business.
> 
> Recently, the current owner, Claire, who is the daughter of the founder of PetsCare, realized that the old file system solution is very inefficient. She and her team have to spend lots of time taking records, querying for information, and maintaining the data. She decided to turn to you, for a Relational Database Management System.
> 
> PetsCare wants to record information about customers, pets, staff, visits. Claire will be available to meet via Zoom tomorrow to discuss details. You should prepare questions for building the DBMS.
> 
> **Task:** What questions should you ask during the meeting?

You should prepare two categories of questions:

1. The interest of the business, what information should be recorded, what might be the entities for holding the information, what might be used as identities, etc.

2. The relationship of the entities, especially the mandatory/optional participation, and the cardinalities. We will need them to clear confusions and to create the Entity Relationship Model. 

# Step 2: Build the Entity Relationship Model

> "Congratulations! Thanks to the efficient communication between Claire and you, now you understand the details of the business, and you are ready to write down narrative statements for your Entity Relationship Model. 
> 
> You should lay out your own assumptions and your own ER Model."

After several rounds of discussion, below is the one confirmed with the client. 

Here is what you summarized about the entities:
- Customers: CustomerID, FirstName, LastName, Address, Email, Phone, DoB, PaymentInfo, JoinDate. CustomerID is the identifier.
- Pets: CustomerID, Pet#, NickName, Address, Email, Phone, Category, Species/Breed, Species/Breed Description, Gender, DoB, Notes. CustomerID and Pet# together as the identifier.
- Staff: EmployeeID, FirstName, LastName, SSN, Address, Email, Phone, DoB. EmployeeID is the identifier.
- Visit: VisitID, Date, Time, Customer, Pet, ServiceID, ServiceName, ServicePrice, ServiceDescription, Staff, Bill, Paid. VisitID is the identifier.

Their relationships are:
- A customer may have one or more (zero or more) pets; A pet must belong to one and only one (exactly one) customer.
- A staff may treat one or more pets (zero or more); and A pet may be familiar with one or more (zero or more) staff.
- A customer may have one or more (zero or more) visits; and each visit must be done by one and only one (exactly one) customer. 
- A pet may have one or more (zero or more) visits; and each visit may involve one (zero or one) pet. 
- A staff must be in charge of one or more (one or more) visits; and a visit must be charged by one and only one (exactly one) staff.
- A customer may be referred by one (zero or one) customer; and a customer may refer one or more (one or more) customers. 
- A staff must have one and only one (exactly one) supervisor; A staff may supervise one or more (zero or more) staff.

# Step 3: Create the Entity Relationship Diagram

> "Now you have collected the information needed for the ER Model, and you are ready to draw the ERD."



# Step 4: Convert the ERD to the Relational Model



# Step 5: Normalize the Relational Model to 3NF



# Step 6: Final Output for Implementation

