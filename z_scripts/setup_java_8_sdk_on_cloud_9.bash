function init(){
    echo_action "Setup Configs for Silent Java Install" true
    setup_configs_for_silent_java_sdk_install
    echo_action "Installing Java 8 SDK" true
    install_java_8_on_cloud_9_vm
    echo_action "Display Java Version" true
    display_java_version
    echo_action "Install Java 8 sdk script complete." true

}

function display_java_version(){
    java -version
}

function setup_configs_for_silent_java_sdk_install(){
    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
}

function install_java_8_on_cloud_9_vm()
{
    echo_action "Adding external APT repository." true
    sudo add-apt-repository ppa:webupd8team/java -y
    echo_action "Downloading package lists from the repositories and updating them." true
    sudo apt-get update
    echo_action "Installing Java Installer." true
    sudo apt-get install oracle-java8-installer -y
    echo_action "Setting default Java to Java8" true
    sudo apt-get install oracle-java8-set-default -y
}

function create_line_across_terminal()
{
    echo
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    echo
}

function echo_action()
{
    if [ "$2" = true ]
    then
        create_line_across_terminal
        echo "$1"
        create_line_across_terminal
    else
        echo ""
        echo "$1"
        echo ""
    fi
}

init