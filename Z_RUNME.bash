function init(){
    switch_repo_to_dev_branch
    run_cloud9_setup_scripts
    init_git_flow_on_repo
    explain_things
    read -p "Attempt to reset terminal now? " -n 1 -r
    printf"\n"
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        reset_terminal
    fi
}

function run_cloud9_setup_scripts(){
    local called_from_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    local setup_script_name_and_path=$(printf "%s/z_scripts/setup_c9_to_work_on_repo.bash" $called_from_directory)  
    bash $setup_script_name_and_path
}

function switch_repo_to_dev_branch(){
    local called_from_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    cd $called_from_directory
    git checkout develop
    cd $GOPATH    
}

function init_git_flow_on_repo(){
    local called_from_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    cd $called_from_directory
    git flow init -d
    cd $GOPATH    
}

function reset_terminal(){
    # Sauce : http://askubuntu.com/questions/611648/exit-terminal-after-running-a-bash-script
    kill -9 $PPID
}

function explain_things(){
    clear
    printf "This script has tried too:\n"
    printf "    Setup Java 8 JDK\n"
    printf "    Removed Maven2 and Setup more current version.\n"
    printf "    Installed MongoDB and created a run script.\n"
    printf "    Installed GitFlow and GitFlow completion.\n"
    printf "    Initilized the repository for GitFlow\n"
    printf "\n"
    printf "To start the MongoDB server:\n"
    printf "\n"
    printf "bash <path to root of repo>/mongodb_run.bash\n"
    printf "\n"
    printf "To run the program:\n"
    printf "\n"
    printf "cd <path to root of repo>/\n"
    printf "mvn spring-boot:run\n"
    printf "\n"
    printf "NOTE - Reset terminal to use GitFlow Completion.\n"
    printf "\n"
}

init