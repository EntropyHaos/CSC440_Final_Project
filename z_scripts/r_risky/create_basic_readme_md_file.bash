function create_file(){
    local file_name_of_file_being_created=$1;
    printf "CREATING FILE : %s\n" $file_name_of_file_being_created
    
    cat << EOT >> $file_name_of_file_being_created
# ${PWD##*/} README.md file!

# WHO?

# WAT?

# WEN?

# WHY?

# WER?

# HOW?
EOT
}

function get_useable_file_name() {
    local __return_file_name=$1
    local initial_file_name=$2
    local temp_file_name=$initial_file_name
    
    if [[ "$__return_file_name" ]]; then

        local append_int=1;
        local file_exists="true";
    
        while [ $file_exists != "false" ]
        do
            if [ -e "$temp_file_name" ]
            then
                printf "* EXISTS FILE : %s\n" $temp_file_name;
                temp_file_name=$(printf '%s' "${initial_file_name%.md}$append_int.md" );
                let "append_int+=1";
            else
                printf "FILE to WRITE : %s\n" $temp_file_name;
                file_exists="false";
            fi
        done
        
        eval $__return_file_name="'$temp_file_name'"
    fi
}

function init(){
    get_useable_file_name useable_file_name README.md
    create_file "$useable_file_name"
}

init

# HAOS_BASH * FALL 2016