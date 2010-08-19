
set :use_sudo,            false
set :git_shallow_clone,   1
set :keep_releases,       5
set :application,         "linuxfi-loja"
set :user,                "deployer"
set :password,            "654321"
set :deploy_to,           "/home/deployer/loja"
set :runner,              "deployer"
set :repository,          "git@github.com:fredpolaro/linuxfi-loja.git"
set :scm,                 :git
set :real_revision,       lambda { source.query_revision(revision) { |cmd| capture(cmd) } }

ssh_options[:paranoid]    = false
default_run_options[:pty] = true

role :app, "184.106.216.254"
role :web, "184.106.216.254"
role :db,  "184.106.216.254", :primary => true


namespace :deploy do

  task :start do
    sudo "/etc/init.d/unicorn start"
  end

  task :stop do
    sudo "/etc/init.d/unicorn stop"
  end

  task :restart do
    sudo "/etc/init.d/unicorn reload"
  end

end