
task :default => :build

task :build do
  sh('docker build -t openvpn ./')
end

task :run do
  sh('docker run -t -p 1194:1194 openvpn')
end

task :attach do
  sh('docker attach phabricator')
end

task :interactive do
  sh('docker rm phabricator')
  sh('docker run -t -p 1194:1194 -i openvpn')
end

task :shell do
  sh('docker rm phabricator')
  sh('docker run -t -p 1194:1194 -i openvpn /bin/bash')
end

task :kill do
  sh('docker ps -q | xargs docker kill')
end

