export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:~/workspace/diego-release/bin

# Path to the bash it configuration
export BASH_IT="/Users/pivotal/.bash_it"

# Lock and Load a custom theme file
export BASH_IT_THEME="bobby"

# Load Bash It
source $BASH_IT/bash_it.sh

export PATH=$PATH:~/workspace/go/bin
export GOPATH=~/workspace/diego-release

export PULL_DOCKER_IMAGE=false #do not pull docker images when using lattice-pipeline run_with_docker helper
export DOCKER_IMAGE=cloudfoundry/lattice-pipeline

alias cd-lattice="cd $GOPATH/src/github.com/cloudfoundry-incubator/lattice"
alias cd-gopath="cd $GOPATH"
alias cd-cli="cd $GOPATH/src/github.com/cloudfoundry-incubator/lattice/ltc"
alias cd-ltc="cd-cli"
alias reset-dns="sudo killall -HUP mDNSResponder"
alias empty-etcd="curl -L http://192.168.11.11:4001/v2/keys/v1/desired/?recursive=true -XDELETE"
alias empty-etcd-tasks="curl -L http://192.168.11.11:4001/v2/keys/v1/task/?recursive=true -XDELETE"
alias reload-dnsmasq="sudo launchctl stop homebrew.mxcl.dnsmasq && sudo launchctl start homebrew.mxcl.dnsmasq"
alias install-ltc="pushd $GOPATH/src/github.com/cloudfoundry-incubator/lattice/ltc && go install && popd"
alias recompile-lattice="cd ~/workspace && $GOPATH/src/github.com/cloudfoundry-incubator/lattice/pipeline/helpers/run_with_docker /workspace/diego-release/src/github.com/cloudfoundry-incubator/lattice/pipeline/01_compilation/compile_lattice_tar && mv -v ./lattice.tgz $GOPATH/src/github.com/cloudfoundry-incubator/lattice/ && cd-lattice"
alias remake-vagrant="cd-lattice; vagrant destroy --force; recompile-lattice && VAGRANT_LATTICE_TAR_PATH=/vagrant/lattice.tgz vagrant up --provider=virtualbox; get-ginkgo; go install github.com/cloudfoundry-incubator/lattice/ltc"
alias remake-condenser="cd-lattice; vagrant destroy --force; recompile-lattice && CONDENSER_ON=1 VAGRANT_LATTICE_TAR_PATH=/vagrant/lattice.tgz vagrant up --provider=virtualbox; get-ginkgo; go install github.com/cloudfoundry-incubator/lattice/ltc"
alias get-ginkgo="go get github.com/onsi/ginkgo/ginkgo && go get github.com/onsi/gomega"
$(boot2docker shellinit)
~/workspace/bosh-lite/bin/add-route
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
[ -f ~/.bashrc ] && source ~/.bashrc

