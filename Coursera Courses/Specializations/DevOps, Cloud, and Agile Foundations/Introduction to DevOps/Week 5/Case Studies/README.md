# Scenario 1 Thinking DevOps

>The Acme company decided to implement DevOps. Since they already had a Dev team and an Ops team, they thought the best approach was to create a new DevOps team in addition to the already existing teams. They thought it would cause minimal disruption to the existing teams. They also allowed the teams to continue to use the ticket system.
>
>Miguel has just joined the new DevOps team at the Acme company. He has been instructed to work closely with the Dev team and the Ops team as a liaison. In his normal day, he maintains the Continuous Integration/Continuous Delivery (CI/CD) pipelines and makes sure that the developers have what they need from Ops and makes sure that Ops has what they need from the developers. When the Dev team has a request, Miguel uses the ticket queue to make that request to Ops on Dev’s behalf. One morning, the Dev team needed virtual machines (VMs) provisioned in a hurry to deploy their application by the deadline.
>
>Miguel thought he had a good relationship with Charles, the SysAdmin, and asked him if he could get the VMs done that day. Charles curtly reminded him that they had a well-established ticket queue system, and that he would have to open a ticket like everyone else. Miguel opened a ticket and let the developers know that he made the request for the VMs. Several days passed. Nancy, on the Dev team, asked Miguel where the VMs were. She reminded him about the deadline and said, “We’ll miss it unless you get us those VMs.”
>
>Two more days passed. In a meeting with the Dev team, Jim, one of the team members, said, “Well, I do kind of have access to something.” He explained that he had a personal Cloud account where he could have the VMs provisioned within the hour. Miguel asked whether this was in concert with corporate policy. Jim replied, “We have to do what it takes to meet customer commitments.” They deployed the application on Jim’s cloud account.

Questions: 

1. How could the company organize to reflect a DevOps culture?
2. Which of these is a positive step toward having a DevOps culture?
3. How could the application deployment have been handled that would be consistent with DevOps culture?

# Scenario 2 Organizing DevOps

> Roopa is an application developer at a company that is building their own e-commerce website. She just picked up a story from the Kanban board to add a new feature that requires input from the user. Since she is a back-end developer, she must coordinate with the front-end team to add new data fields to the user interface. She opens an issue on the front-end team’s GitHub to add the required fields. Her feature requires a schema change (that is, a change to the table structure in the database) to hold the new data. So, she opens a ticket with the database team to make the change.
>
>She works on the application logic for her feature and checks the code into the development branch in GitHub. Unfortunately, she can’t test her code until the front-end team updates the user interface (UI) and the database team updates the schema. Because she is blocked, she begins working on another feature story.
>
> Two weeks later, the front-end team and the database team make their changes. Roopa stops working on the feature she is currently working on to go back and merge those changes with her previous code. Her attempt to merge encounters several merge conflicts. It takes several hours to resolve the merge conflicts because the code has drifted over time. She commits her updated code to the development branch. At the end of the month, the development team merges the development branch back into the master branch to prepare for release. Unfortunately, some quick bug fixes that were applied to the master branch now conflict with Roopa’s code in the development branch. She has to spend an entire day remediating those conflicts.
>
> The development team gets everything working and they are ready to deploy to production. They manually deploy the new release into production only to have it fail. The team had to roll back the release so they could determine the cause of the failure. They meticulously went through every feature change to find the cause of the failure. It took three days to test each new feature in isolation. They determined that the schema update for Roopa’s new feature was never applied. Once the schema was updated, everything started working. Roopa overhears a manager complain about how long this took. One developer shrugs and says, “It’s pretty much always like this.”

Questions: 

1. What could the company do differently to avoid having to spend time coordinating across teams?
2. What could have been done to avoid the missing schema change?
3. Should the development team have merged the development branch back into the master branch sooner?  
4. What could the development team have done differently to avoid the merge conflicts at the end of the month? 

# Scenario 3 Social Coding

>Beta company has several teams that maintain their e-commerce website. They have adopted the microservices architecture and organized their teams along business domains so that they have an account team, a product team, an orders team, and a warehouse team.
>
>The account team has decided to give customers a more personalized experience. They want to be able to recommend products a customer might like based on what other customers are buying. They notice that the product team has a similar function for recommending products and accessories that go with what the customer is viewing online.
> 
>Jeff, the account team lead, decided to ask Susan from the product team if they could add this new capability to their existing recommendation function. Susan said the product team was very busy and, “It will be about a month before we can get to it.” Jeff asked whether he could make the changes. Susan replied, “Our code repository is private, and we don’t like to give access to people outside our team.”
>
>Jeff didn’t want to wait and instead, had the account team write 100% of the code from scratch. He didn’t think it would be that difficult and that they would be able to do it faster than waiting for the product team to do it. Unfortunately, it was harder than Jeff expected.
>
>Jeff knew Kiet, one of the most experienced product team members, from a previous project and asked if he could help them with the new feature. Kiet spent two weeks reviewing the account team’s code with them and making suggestions that got the account team back on track.
>
>The account team eventually completed the feature. They delivered two weeks later than anticipated, but because they created a completely new feature, each of the five account team members received an Innovative Contribution Award that included a $500 bonus.
>
>Kiet, who never received any credit for his contribution thought to himself, “That’s the last time I help the account team with anything.”

Questions: 

1. Who contributed the most to the project in terms of social coding?
2. What could the product team have done differently to align with social coding principles?
3. What could the company have done differently to align with social coding principles?
