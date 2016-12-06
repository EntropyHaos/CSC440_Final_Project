function init(){
    source $called_from_directory/setup_java_8_sdk_on_cloud_9.bash
    source $called_from_directory/setup_current_maven_version_on_cloud_9.bash
    source $called_from_directory/setup_gitflow_on_cloud_9.bash
    source $called_from_directory/setup_mongo_db_on_cloud_9.bash
}
called_from_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

init
