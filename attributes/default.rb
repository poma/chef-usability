default['usability']['packages-base'] = %w{ne tree git screen wget curl man-db telnet lsof zip unzip bash-completion traceroute htop pv}
default['usability']['packages-wsl'] = %w{locate build-essential autoconf automake mysql-client ruby python python-pip nodejs openjdk-9-jre dotnet-runtime-2.0.0 google-cloud-sdk php7.1 php7.1-cli php7.1-curl php7.1-xml php7.1-zip php7.1-gd php7.1-mysql php7.1-mbstring memcached composer}
default['usability']['packages'] = []
default['usability']['zsh']['plugins-base'] = %w{git zsh-autosuggestions zsh-syntax-highlighting zsh-completions command-not-found}
default['usability']['zsh']['plugins-wsl'] = %w{wd vagrant aws}
default['usability']['zsh']['plugins'] = []
default['usability']['zsh']['includes'] = []
default['usability']['root']['default-user'] = 'ubuntu'

