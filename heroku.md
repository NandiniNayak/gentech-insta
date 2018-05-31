## Steps to Push to heroku with sqlite gem as default in rails 5:


### Note : Heroku works well with postgres db, and rails by default uses sqlite gem, if you have not made a switch to postgres at the start of the rails project, yet you want to deploy your app on heroku. You will have to move sqlite gem to developments section and add PG gem to production section.

### Follow he steps below

- Add PG gem to production
- Move sqlite gem to development test
  - Find the line ​gem 'sqlite3' and move it  within the​ 'group :development section'​                                      

- eg: You gem file must look like this
```
group :development do
  gem 'sqlite3' # note: move gem sqlite into development section and retain rest of the code in the development section as it is

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
```

- Then create a ​group :production section and enter the gems: ​pg and ​rails_12factor It should look like this:

```
group :production do

  gem 'pg'

  gem 'rails_12factor'

end
```

### Run following commands in the terminal

- ```bundle install --without production```
- ```git init```
- ``git add .``
- ``git commit -m “heroku push”``
- ``git remote add origin https://github.com/USERNAME/OTHERREPOSITORY.git``
- ``git push -u origin master``
- ``heroku version``
   - Verify  heroku CLI is available
- ``heroku login``
- ``heroku keys:add``
    - if keys update is unsuccessful, generate new keys with below command
    - ``ssh-keygen``
        - you recive the message "generating public/private rsa key pair.
Enter file in which to save the key (/home/user_name/.ssh/id_rsa):
        - you must receive above message, press enter to continue and replace existing key.
Ensure keys are successfully pushed onto heroku
- ```heroku create ENTER_YOUR_APP_NAME```
     - note: If you don't enter app name and just run heroku create, heroku will automatically create some random app name.
     - you will see the message " Creating
       app... done, fathomless-beyond-39164
https://YOUR_APP_NAME.herokuapp.com/ |
https://git.heroku.com/YOUR_APP_NAME.git

- ```git push heroku master```
- ``heroku run rake db:migrate``
- ``git remote -v``

     - Running above command helps you to verify if the app was deployed under the name of the app you intended to.
To see your newly deployed application visit the address that you saw when you ran heroku create.

### At this stage there could be two scenarios.

- Scenario 1: yayy :) I can access my application on the path https://YOUR_APP_NAME.herokuapp.com/.

   - All good, continue coding and deploying. If your app could not be deployed on the heroku site, follow the steps below to debug

- Scenario 2: Deploying is not always 100% successful, sometimes you might have to debug the issue.

### Was your app successfully deployed?? Great :). More often than not, you will have trouble deploying the app, how can you debug the error??... follow the steps below to debug the problem.

- If you get errors (the Application Error message on your Heroku site),
- Enter heroku logs​ in​ your terminal to see the last 100 lines of logs.
- Also ​heroku logs --tail will show you an ongoing print out of the logs. To stop this type ctrl+c


### If you are new to heroku and github, there might be a case where you will stuff up the heroku remote master are you might delete it and now if you want to push your  code to another remote master?? Follow the step below.

- Note : if you want to change the master on heroku  to a different git run below command:
  - ```git remote set-url heroku ENTER_YOUR_NEW_HEROKU_GIT```

- Also, if you want to switch to a new git master on git hub.
  -  ```git remote set-url origin ENTER_YOUR_NEW_GITHUB_REPOSITORY```
