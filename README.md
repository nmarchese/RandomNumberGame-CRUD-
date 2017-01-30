### Spring MVC C.R.U.D. project
Project done by Nicholas Marchese
I completed this project at the end of week eight at Skill Distillery. It showcases the features of a basic CRUD (Create, Read, Update, Delete) application.

#### Premise
I chose to make an application that uses user input and random number generation to pick a winner. The idea comes from my work as a valet. Whenever the valet is over-staffed someone is usually sent home. If more people are interested in leaving than the supervisor is willing to cut, the decision is usually made by playing the "Random Number Game." Each person that wants to go home writes their name and a number between 1 and 100 on a piece of paper. Then a website that generates a random number is used, and whoever wrote the number that is closest to the random number is the winner and gets to leave. My web application takes this concept and digitalizes the process, while adding some stat tracking in the process.

#### How it Works
When the application starts it reads in all previous player data from a file (Name and win count). Using the application is quite simple. On the welcome screen users can add players by inputing a name and a number. Once at least 2 players have been added the user can click the play button which generates a random number and then displays a results page which includes the winner, runner up, and a table with all current player data (Name, Number, Number of all-time wins). At any point the user can continue to add players, can update the number of any player, and can remove any players that have been created. Each time the game is played the application writes player data to a file (Name and wins including current play). Players are saved by their name, so returning users will have a persistent win count (as long as they input their name the same way each time).

#### Technologies Used

- Spring MVC
- Java
- HTML
- CSS
- Tomcat 8
- JSP/JSTL
- AWS
- Spring Tool Suite

#### Future Features/Project Reflection
Halfway through the process of writing my application I learned a new way to check the validity of user inputs with the help of Spring. Unfortunately, in order to implement this I would have had to re-write a large portion of my application because the way that I had written in a way that was not easily compatible with the Spring annotation driven validity checking. If I had more time I would like to refactor my code to use this newly learned technology.
