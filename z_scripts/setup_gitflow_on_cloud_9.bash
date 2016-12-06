function init(){
    install_gitflow_completion_on_c9;
}

function install_gitflow_completion_on_c9(){
    cd $GOPATH
    cd ..
    
    sudo apt-get update
    
    curl -OL https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
    chmod +x gitflow-installer.sh
    sudo ./gitflow-installer.sh
    rm gitflow-installer.sh
    
    cd $GOPATH
    sudo apt-get install git bash-completion -y
    git clone git@github.com:CarrollCapstoneCrew/git-flow-completion.git temp
    sudo cp $GOPATH/temp/git-flow-completion.bash /etc/bash_completion.d/git-flow-completion.bash
    rm -rf temp
    cd $GOPATH
}

init