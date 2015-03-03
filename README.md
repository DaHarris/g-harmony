# g-harmony

Place to add articles that are relevant to our class
Users can tag articles with topics
Preload all students’ email addresses
Users must login first

Users (fname:string(*), lname:string(*), username:string(*), password:password_digest(*))
Have many Posts
Have many Likes
Have many Comments

Likes (user-id:integer, post-id:integer)
Belongs to Post
Belongs to User

Posts (URL:String, Code:String, Description:String) (*Either URL or Code)
Belongs to User
Have many Assignments
Have many Tags through Assignments

Assignments (post-id:integer, tag-id:integer)
Belong to Post
Belong to Tag

Tags (Title:String(*))
Have many Assignments
Have many Posts through Assignments

Comments (user-id:integer, post-id:integer)
Belongs to User
Belongs to Post

*Sidebar Toggle

1. Land on page
2. Login (Sessions & Registrations)
3. Recent Posts Feed
Tags on Left
Sort By: Recent, Likes
