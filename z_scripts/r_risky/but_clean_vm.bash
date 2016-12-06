function init_this(){
    clear;
    prompt_and_run;
    #just_run_it;
}

function clear_vm_for_testing(){
    
    # Switch shell to the directory this script is called from.
    # Sauce : http://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
    cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    
    # Move up two directories into what we hope is the repo root.
    cd ..
    cd ..
    
    # DELETE THINGS WE DO NOT WANT IF WE ARE LOADING IN TESTS!
    # Sauce : http://unix.stackexchange.com/questions/45676/how-do-i-remove-a-directory-and-all-its-contents
    #   and : https://www.cyberciti.biz/faq/howto-linux-unix-delete-remove-file/
    rm -rf src
    rm -rf data
    mkdir data
    rm LICENSE
    rm pom.xml
    
    if [ -d "target" ]; then
        rm -rf target
    fi
    : << 'EOP' # Useful for testing...
EOP
}

function prompt_and_run(){
    printf "\nTHIS SCRIPT WILL DELETE A WHOLE MESS OF YOUR STUFFS!\n\n"
    read -p "Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # do dangerous stuff
        clear_vm_for_testing
    fi
}

function just_run_it(){
    clear_vm_for_testing
}

init_this