
set :scm, :git
#set :deploy_via, :remote_cache
# set :deploy_via, :export
set :deploy_via, :copy
default_run_options[:pty] = true
set :copy_exclude, [".git/*", ".svn/*"]
set :repository,  "git@github.com:leomao10/found.git"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :application, "Found"
set :scm_username, "leomao10"
set :scm_passphrase, "leo1022"
set :scm_verbose, true

set :use_sudo,false
set :user, "chentian"
set :branch, "master"



set :deploy_to, "~/var/found"

role :web, "sh1node1.mel.hosting-services.net.au:2683"                          # Your HTTP server, Apache/etc
role :app, "sh1node1.mel.hosting-services.net.au:2683"                          # This may be the same as your `Web` server
role :db,  "sh1node1.mel.hosting-services.net.au:2683", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end