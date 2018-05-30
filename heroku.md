Add PG gem to production
Move sqlite gem to development test


Find the line ​gem 'sqlite3' and move it to within the​

group :development section​                                      .

Then create a ​group :production section and enter the gems: ​pg and ​rails_12factor It should look like this:

group :production do

gem 'pg'

gem 'rails_12factor'

end




Run following commands in the terminal



bundle install --without production
git init
git add .
git commit -m “heroku push”
git remote add origin https://github.com/USERNAME/OTHERREPOSITORY.git
git push -u origin master
heroku version
Verify  heroku CLI is available
heroku login
heroku keys:add
if keys update in unsuccessful, generate new keys with below command
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/nandini/.ssh/id_rsa):
you must recive above message, press enter to continue and replace existing key.
Ensure keys are successfully pushed onto heroku
heroku create
Creating app... done, fathomless-beyond-39164
https://damp-fortress-5769.herokuapp.com/ |
https://git.heroku.com/damp-fortress-5769.git

git push heroku master
heroku run rake db:migrate
git remote -v
running above command helps you to verify if the app was deployed under the name of the app you intended to.
To see your newly deployed application visit the address that you saw when you ran heroku create.
If you get errors (the Application Error message on your Heroku site), you can always type heroku logs​ in​ your terminal to see the last 100 lines of logs.
Also ​heroku logs --tail will show you an ongoing print out of the logs. To stop this type ctrl+c
