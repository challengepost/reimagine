require 'spec_helper'

describe Reimagine2::Configuration do

  describe "default settings" do
    it { expect(subject.root_host).to eq 'devpost.com' }
    it { expect(subject.secure_root_host).to eq 'secure.devpost.com' }
    it { expect(subject.post_host).to eq 'post.devpost.com' }
    it { expect(subject.help_host).to eq 'help.devpost.com' }
    it { expect(subject.new_user_session_url).to eq 'https://secure.devpost.com/users/login' }
    it { expect(subject.new_user_registration_url).to eq 'https://secure.devpost.com/users/register' }
  end

  describe "configured settings" do
    before do
      subject.root_host = 'platform.dev'
      subject.post_host = 'post.dev'
      subject.help_host = 'help.dev'
      subject.secure_root_host = 'secure.platform.dev'
      subject.new_user_session_url = 'https://secure.devpost.dev/users/login'
      subject.new_user_registration_url = 'https://secure.devpost.dev/users/register'
    end
    it { expect(subject.root_host).to eq 'platform.dev' }
    it { expect(subject.secure_root_host).to eq 'secure.platform.dev' }
    it { expect(subject.post_host).to eq 'post.dev' }
    it { expect(subject.help_host).to eq 'help.dev' }
    it { expect(subject.new_user_session_url).to eq 'https://secure.devpost.dev/users/login' }
    it { expect(subject.new_user_registration_url).to eq 'https://secure.devpost.dev/users/register' }
  end
end
