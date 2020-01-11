# Volunteery

## By **Chris Sanchez**

Volunteery is a CRUD (Create, Read, Update, Delete) application built for non-profit employees to create Projects and add Volunteers to them. It servers as an internal website to track volunteers working on projects for a site manager.  

Administrators can create multiple projects, and from the homepage sort them alphabetically, or search for projects returning partial or full matches. The projects can have their titles updated, and projects can be deleted altogether, which is reflected in the database. Administrators can also create volunteers for each project, and update their names or delete them from the project- these changes are also reflected in the database.

![screenshot of landing page for project website](https://i.imgur.com/XnAoj29.png "read")

### User Stories
- As a non-profit employee, I want to view, add, update, and delete projects.
- As a non-profit employee, I want to view and add volunteers.
- As a non-profit employee, I want to add volunteers to a project.
- - - -
### Setup/Installation Requirements

![image of Github repository file system](https://i.imgur.com/UStodOA.jpg "read")

#### Zip:

1. Click [here](https://github.com/sanchito59/volunteery.git) to go to the repository location where you will find the clone/download menu.

 2. Navigate to the directory (folder) that contains your browser's downloads.
 3. Double-click on **Volunteery** directory (folder).
 4. Open directory contents by extracting/unzipping documents from folder.
 5. In the terminal/command line, and with NPM and Ruby 2.5.1 installed, and within the folder, run `bundle install`.
 6. Finally, run `ruby volunteery.rb` to use **Volunteery**.

#### Clone: 

 1. To clone the repository, from your terminal or command line enter: "git clone  https://github.com/sanchito59/volunteery.git"
 2. Once the repository finishes downloading you will need to navigate to it in the terminal/command line.
 5. With NPM and Ruby 2.5.1 installed, and within the folder, run `bundle install`.
 6. Finally, run `ruby script.rb` to use **Volunteery**.

- - - -

### Specifications:

|Behavior|Input|Output|
|---|---|---|
|(Read/GET)|User is on the homepage. |Homepage displays a list of all projects, or if there aren't any: 'There are currently no projects. Let's set one up!'|
|(Create/POST) User adds a project to the catalogue of projects. |'Teaching Kids to Code: Ruby'|The homepage now has the project added, and so does the database.|
|(Read/GET)|User is on the project page. |Project page displays a list of all volunteers, or if there aren't any: 'There are no volunteers listed for this project yet.' Included is the ability to add a volunteer to a project.|
|(Update/PATCH) User changes the project title. |'Teaching Kids To Code: Ruby and PostgreSQL'|The homepage now reflects the changes, and so does the database.|
|(Create/POST) User adds a volunteer to the list of volunteers on a specific project. |'Mike Smith' is added to the project 'Teaching Kids to Code: Ruby'|The Project page now has the volunteer added, and so does the database.|
|(Update/PATCH) User changes the volunteer's name. |'Michael Smith'|The project page now reflects the changes, and so does the database.|
|(Delete/DELETE) The user removes a volunteer from a project. |'Michael Smith'|The project page now reflects the changes, and so does the database.|
|(Delete/DELETE) The user deletes a project. |'Teaching Kids To Code: Ruby and PostgreSQL'|The homepage and database no longer have the project.|
- - - -

### Technologies Used

 - Ruby
 - Sinatra
 - PostgreSQL
 - Behavior Driven Development / User Stories
 - Testing for Behavior and Integration

- - - -
### Support and Contact

If you run into any issues running **Volunteery**, please contact **Chris Sanchez**.

### License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2020 **Chris Sanchez**