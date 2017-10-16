default['usability']['packages-base'] = %w{ne tree git screen wget curl man-db telnet lsof zip unzip bash-completion traceroute htop}
default['usability']['packages-wsl'] = %w{vagrant mysql-client}
default['usability']['packages'] = []
default['usability']['zsh']['plugins-base'] = %w{git zsh-autosuggestions zsh-syntax-highlighting zsh-completions command-not-found}
default['usability']['zsh']['plugins-wsl'] = %w{wd vagrant aws}
default['usability']['zsh']['plugins'] = []
default['usability']['zsh']['includes'] = []
default['usability']['root']['default-user'] = 'ubuntu'

