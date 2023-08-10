# exit on error
#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails db:migrate RAILS_ENV=production
bundle exec rails db:seed


#if you have seeds to run add:
# bundle exec rails db:seed