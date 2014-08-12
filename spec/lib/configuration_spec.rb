require 'spec_helper'

describe Reimagine2::Configuration do

  describe "default settings" do
    it { expect(subject.root_host).to eq 'challengepost.com' }
    it { expect(subject.post_host).to eq 'post.challengepost.com' }
    it { expect(subject.help_host).to eq 'help.challengepost.com' }
  end

  describe "configured settings" do
    before do
      subject.root_host = 'platform.dev'
      subject.post_host = 'post.dev'
      subject.help_host = 'help.dev'
    end
    it { expect(subject.root_host).to eq 'platform.dev' }
    it { expect(subject.post_host).to eq 'post.dev' }
    it { expect(subject.help_host).to eq 'help.dev' }
  end
end
