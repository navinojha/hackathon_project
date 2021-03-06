# How to Run the Project on Your Machine

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.6](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [6.1.2](https://github.com/organization/project-name/blob/master/Gemfile#L12)

##### 1. Clone out the repository

```bash
git clone https://github.com/navinojha/hackathon_project.git
```

##### 2. Create database.yml file(Not required if you are using mysql database)

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
 rails db:create
 rails db:migrate
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

And now you can visit the site with the URL http://localhost:3000
