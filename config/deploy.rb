require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/assets"
load "config/recipes/tail"
load "config/recipes/seed"
load "config/recipes/check"
load "config/recipes/monit"
load "config/recipes/sys"
load "config/recipes/memcached"

load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/bundler"
# load "config/recipes/redis"
load "config/recipes/imagemagick"
load "deploy/assets"

server "208.68.39.160", :web, :app, :db, primary: true

set :application, "blarg"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:dallas22ca/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:migrate"
after "deploy", "deploy:cleanup"

after "deploy:install", "deploy:autoremove"