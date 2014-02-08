
task :default => :build

task :build do
  sh('docker build -t openvpn ./')
end

task :run do
  sh('docker run -privileged -t -p 443:443/udp openvpn')
end

task :attach do
  sh('docker attach openvpn')
end

task :interactive do
  sh('docker run -privileged -t -p 443:443/udp -i openvpn')
end

task :shell do
  sh('docker run -privileged -t -p 443:443/udp -i openvpn /bin/bash')
end

task :kill do
  sh('docker ps -q | xargs docker kill')
end

