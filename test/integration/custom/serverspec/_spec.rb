require 'serverspec'

# Required by serverspec
set :backend, :exec


describe package('smartmontools') do
  it { should be_installed }
end

describe file('/etc/default/smartmontools') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /^start_smartd=yes/ }
end

describe file('/etc/smartd.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /^\/dev\/sda -a -o on -S on -s \(S\/..\/..\/.\/02\|L\/..\/..\/6\/03\)/ }
    its(:content) { should match /^\/dev\/sdb -a -I 194 -W 4,45,55 -R 5 -m admin@example.com/ }
end
