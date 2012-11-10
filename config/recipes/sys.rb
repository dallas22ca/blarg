namespace :sys do
  desc "Reboot"
  task :reboot do
    run "#{sudo} reboot"
  end
end
