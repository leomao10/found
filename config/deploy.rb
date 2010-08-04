set :application, "Found"
set :use_sudo,false
set :user, "chentian"
set :branch, "master"
set :runner, "chentian"

set :scm_verbose, true

set :repository,  "git@github.com:leomao10/found.git"

set :scm, :git
set :deploy_via, :remote_cache
# set :deploy_via, :export
# set :deploy_via, :copy
set :copy_strategy, :export
set :copy_exclude, [".git/*", ".svn/*"]
set :port, 2683
set :deploy_to, "~/var/found"


default_run_options[:pty] = true



# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`









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