# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "Compiler"
set :repo_url, "git@github.com:pavanKumar2/online-compiler.git"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/compiler"

# Default value for :format is :airbrussh.
# set :format, :airbrussh
append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end