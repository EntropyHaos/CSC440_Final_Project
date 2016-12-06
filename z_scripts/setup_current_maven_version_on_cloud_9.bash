function init(){
    echo_action "Installing Current Maven Version"  true
    install_maven_cloud_9_vm
    echo_action "Version Installed" true
    display_maven_version
    echo_action "Install Current Maven Version Script Complete" true
}

function display_maven_version(){
    mvn --version
}
function install_maven_cloud_9_vm(){
    echo_action "Installing Maven" true
    sudo apt-get update
    sudo apt-get remove maven2 -y
    sudo apt-get install maven -y
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