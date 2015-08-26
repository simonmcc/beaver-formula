require 'serverspec'

# Set backend type
set :backend, :exec

describe "beaver log shipper" do

  describe service('beaver') do
      it { should be_enabled   }
      it { should be_running   }
  end

  describe file('/etc/beaver.conf') do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should contain "transport: stdout" }
  end

  describe file('/var/cache/beaver') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 750 }
  end

end
