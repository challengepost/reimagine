class Git
  attr_reader :account_name, :project_name
  alias_method :app_name, :project_name

  def initialize(account_name, project_name)
    @account_name = account_name
    @project_name = project_name
  end

  def current_branch
    `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/refs\/heads\//, '')
  end

  # Return remote name of challengepost platform
  def upstream_remote_name
    upstream_matcher = %r{#{account_name}\/#{app_name}}
    # ["origin\tgit@github.com:challengepost/platform.git (fetch)", ... (push)"]
    upstream, * = `git remote -v`.split("\n").grep(upstream_matcher) { |remote| remote.split("\t") }.first
    raise "No upstream remote branch found matching #{upstream_matcher}" unless upstream
    upstream
  end

  # source: name of source git branch to merge from
  # target: name of target git branch to merge into
  def merge_push(source, target, options = {})
    verify_clean_working_directory!

    upstream = upstream_remote_name

    `git fetch #{upstream} -v`

    if source != target
      `git branch -f #{target} #{upstream}/#{target}`

      `git checkout #{target}`

      if options[:force]
        `git reset --hard #{source}`
      else
        `git merge #{source}`
        verify_clean_merge!(target)
      end
    end

    `git push -f #{upstream} #{target}`

    if source != target
      `git checkout #{source}`
    end
  end

  private

  def clean_directory
    `git status` =~ /working (directory|tree) clean/
  end

  def verify_clean_working_directory!
    return if clean_directory
    raise "Must have clean working directory"
  end

  def verify_clean_merge!(with_branch)
    return if clean_directory
    raise <<-MSG

      Deploy halted! There are merge conflicts.

      Follow three easy steps to continue the deploy:

      1. Fix the conflicts and commit changes
      2. Push to #{with_branch}:   git push #{upstream_remote_name} #{with_branch}
      3. Deploy to #{with_branch}: rake "deploy:staging:branch[staging]"

    MSG
  end
end
