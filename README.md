CS157A-Team13 Database Management System Team Project

Project Title: URNotAlone [College Student Connection Platform]

Team member: Barnabas Yuen, Meiling Gao


Goal and Motivation
○ In 2020 and 2021, due to the COVID-19 pandemic, the traditional education
system was met with major challenges. Many students experienced in their academic and daily lives, 
related to mental health problems which stemmed from lack of communication, lack of concentration, 
and the feeling of isolation. With the development of online learning, it made distance learning 
possible and more accessible.

○ This project's main focus is to solve that described above - to help college students connect with 
each other, helping them rebuild the connections with their peers and gaining a happier college experience 
along with success in their academic goals.


Hardware and Software used

● Hardware
○ Macbook Pro(13-inch, 2020, Two Thunderbolt 3 ports)
○ Asus Zephyrus G

● Software
○ macOS Big Sur Version 11.5.2
○ Windows 10 Version 10.0.19043

RDBMS
● MySQL 8.0.26

Application Languages
● Java Version “14.0.2” 2020-07-14
● JavaScript
● Apache Tomcat/9.0.52



Functional Requirements 

Create account 
Student Login
Admin Login
Delete User
User update Description
User update Preferences
User update Classes and Interests
Search students by specific classes
Filter students by studying preference
View and edit student profile
User update Classes and Interest


ERD into Schemas 

Accounts(accountID, username, password)
StudentAccounts(accountID, studentName, campusID)
AdminAccount(accountID, AdminLevel)
Campus(campusID, campus_name)
Courses(courseID, course_name)
Enrollments(studentID, courseID, campusID)
Profile(profileID, description) 
InterestedIn(profileID, interestID)
Interests(interestID, interest_name)
Preferences(profileID, onlineOption, time, location)
HAS( profileID, accountID)
BelongsTo(campusID, accountID)


