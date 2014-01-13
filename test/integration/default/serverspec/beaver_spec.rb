require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "beaver log shipper" do

  it "has a running service of beaver" do
    expect(service("beaver")).to be_running
  end

  describe service('beaver') do
      it { should be_enabled   }
      it { should be_running   }
  end

  describe file('/etc/beaver.conf') do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should contain "transport: tcp" }
  end

  describe file('/var/cache/beaver') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 750 }
  end

end
