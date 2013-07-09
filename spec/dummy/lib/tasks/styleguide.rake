require 'open-uri'

namespace :styleguide do
  repo_url = 'git@github.com:challengepost/reimagine.git'
  desc 'setup github pages'
  task :setup_deploy do
    FileUtils.mkdir_p '_deploy'
    cd "_deploy" do
      system "git init"
      system "echo 'hello' > bye"
      system "git add ."
      system "git commit -m \"init\""
      system "git branch -m gh-pages"
      system "git remote add origin #{repo_url}"
    end
  end

  desc 'generate a static styleguide'
  task :generate => %w[environment assets:precompile] do
    site = '_deploy'

    server = spawn( { 'BUILDING_STYLEGUIDE' => 'true', 'RAILS_ENV' => 'production' }, 'bundle exec rails s thin -p 3001' )

    cd 'public' do
      system 'rm -rf *.html'
      system 'rm -rf **/*.html'
    end

    sleep 10

    paths = ['/']
    files = []

    while path = paths.shift
      open("http://localhost:3001#{path}")
    end

    system "rsync -a public/* #{site}"

    Process.kill("INT", server)
    Process.wait(server)

    system "bundle exec rake assets:clean"
  end

  desc 'cleans deploy dir'
  task :clean_deploy do
    cd "_deploy" do
      system "git rm -rf *"
    end
  end

  desc 'publishes static styleguide'
  task :publish => %w[clean_deploy environment generate] do
    cd "_deploy" do
      system 'git add .'
      system "git commit -m '#{Time.now}'"
      system 'git push'
    end
  end
end

