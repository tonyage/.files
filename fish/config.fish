set -g theme_newline_cursor yes
set -g theme_newline_prompt '╰- '

set -g theme_display_user yes
set -g theme_nerd_fonts yes

set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1 
set -g theme_date_format "+%a %b %d"

set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes

# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1" 

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -it"

# Stop all containers
alias dstop='docker stop (docker ps -a -q)'

# Remove all containers
alias drip='docker rm (docker ps -a -q)'

# Stop and Remove all containers
function dripf
	docker stop (docker ps -a -q)
	docker rm (docker ps -a -q)
end

# Remove all images
alias drmi='docker rmi -f (docker images -q)'

alias dspf='docker system prune -f' 

alias drmv='docker volume rm (docker volume ls -q)'

function dnuke
	dripf
	drmi
	dspf
	drmv
end

# Dockerfile build, e.g., $dbu tcnksm/test 
alias dbu='docker build -t=$1 .'

# Show all alias related docker
alias dalias="sed -n 55,71p $HOME/.file/shell-config/docker.zsh"

# Bash into running container
function dbash  
	docker exec -it (docker ps -aqf "name=$argv") bash
end
