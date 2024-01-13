# Test-task

a web application built using Ruby on Rails for realtime search with analytics.

## Features

- Realtime Search: The application allows users to perform searches on article titles or bodies in real-time. As users type, the search results are dynamically updated on the page.
- Search Term Tracking: Every user's search terms are recorded and stored. This feature helps to analyze user search behavior and trends.
- Analytics Page: The application includes an analytics page that provides insights into the most frequently used keywords in searches. The keywords are presented in a visually appealing table, ordered in descending order based on usage frequency.

## Tech Stack

- Ruby 3.2.2
- Ruby on Rails 7.0.8
- PostgreSQL

## Installation

To get the app up and running:

1. Clone this repository:

   ``` shell
    git clone https://github.com/ibraheemz/Test-task.git
   ```

2. Change into the project directory:

    ``` shell
    cd Test-task
    ```

3. Install dependencies:

    ``` shell
    bundle install
    ```

    ***NOTE**: Make sure that you have the ruby version defined in .ruby-version installed on your device*

4. Setup needed environment variables(optional):

      We're using dotenv gem to load needed environment variables needed. You can find an example of what environment variables you need to define in `.env.example` as `.env` is git ignored.
      For example you can specify the database username and password by defining them in `.env` as environment variables.

5. Setup Database:

    ``` shell
    rails db:setup
    ```

    ***Note**: The default database username and password is `task` but you can define your own values. See above step*

6. Finally, Start the application

    ``` shell
    rails server
    ```

    ***NOTE**: By default the port is 3000 but you can specify one by -p argument i.e. `rails server -p 4000`*

    Now, open your browser and visit <http://localhost:3000> to explore the project

## Potential Improvement

Improvements that I wish had more time to do:
