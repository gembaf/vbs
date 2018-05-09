#!/bin/sh
cd /srv/www/vbs/current
RAILS_ENV=production bundle exec rake unicorn:start
