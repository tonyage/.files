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
alias dip="docker inspect -f '{{ .NetworkSettings.IPAddress }}'"
dig() { docker inspect $1 | grep IPAddress; }

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drip() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias dripf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
drmi() { docker rmi -f $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
alias dalias="sed -n 51,65p $HOME/.file/shell-config/docker.zsh"

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
BEGINCOMMENT
	dl    = "docker ps -lq"
	dps   = "docker ps"
	dpa   = "docker ps -a"
	di    = "docker images"
	dip   = "docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
	dig   = "docker inspect $1 | grep IPAddress"
	dkd   = "docker run -dP"  # run daemonized container      - $dkd base /bin/echo hello
	dki   = "docker run -itP" # run interactive container     - $dki base /bin/bash
	dex   = "docker exec -it" # execute interactive container - $dex base /bin/bash
	dstop = "docker stop $(docker ps -aq)"   # stop all containers
	drip  = "docker rm $*$(docker ps -aq)"   # remove all containers
	dripf = "docker stop $(docker ps -aq) && docker rm $(docker ps -aq)" # stop and remove all containers
	drmi  = "docker rmi $*$(docker images -q)" # remove all images
	dbu   = "docker build -t = $1 ." # Dockerfile build - $dbu <buildname>
	dbash = "docker exect -it $(docker ps -aqf "name = $1") bash" # bash into running container
ENDCOMMENT
