namespace :assets do
  desc 'Compile TypeScript Files'
  task :tsc do
    system('node_modules/.bin/tsc')
  end
end

Rake::Task['assets:precompile'].enhance ['assets:tsc']
