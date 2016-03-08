# helpers

def rhel6?
  redhat? && os[:release].to_f.between?(6.0, 6.9)
end

def rhel7?
  redhat? && os[:release].to_f.between?(7.0, 7.9)
end

def redhat?
  os[:family] == 'redhat'
end

def linux?
  %w(redhat ubuntu debian amazon).include?(os[:family])
end

def release?(test_version)
  os[:release] == test_version
end

def debian?
  %w(debian).include?(os[:family])
end

def ubuntu?
  %w(ubuntu).include?(os[:family])
end

def firewalld?
  redhat? && os[:release].to_f >= 7.0
end

def iptables?
  redhat? && os[:release].to_f < 7.0
end

def windows?
  %w(windows).include?(os[:family])
end
