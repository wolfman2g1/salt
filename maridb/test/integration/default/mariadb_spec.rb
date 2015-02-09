require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe " mariadb installed" do
  describe pacakge('mariadb-server'), :if=>os[:family] == 'redhat' do
    it {should be_installed}
    it {should be_running}
    it {should be_enabled}
  end

  describe pacakge('mariadb-server'), :if=>os[:family] == 'ubuntu' do
    it {should be_installed}
    it {should be_running}
    it {should be_enabled}
  end

end
