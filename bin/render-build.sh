# exit on error
#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake db:migrate

#if you have seeds to run add:
# bundle exec rails db:seed