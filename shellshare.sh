
# A Unix wrapper for a modified version of shellshare
# by Bailey harrington, 29 October 2020

# This wrapper and the version of shellshare it calls
#ensures the URL will remain the same for the same
# user+system combination and writes the URL to a file
# for easy sharing and reference.

####################################################################################

# Usage: sh shellshare.sh [optional_name_argument]


# Check for a python interpreter; exit with error if none is found.
case `hostname` in
    *ecdf.ed.ac.uk)
        . /etc/profile.d/modules.sh
        which python &> /dev/null || module load python/2.7.10
        ;;
    *)
        if `which python &> /dev/null`
        then
            :
        else
            echo 'ERROR: Could not find Python.'
            exit 1
        fi
        ;;
esac 

# Get the user's id.
id=`finger $USER | grep Name | tr -s ' ' '\t' | cut -f 4- | tr -d '\t'`

# Assign an optionally-specified name argument to name, or default to the value of $id.
name=${1:-$id}

# Runs shellshare, passing the user's id and specifying a unique roomname that
# remains the same for future uses.
python ./shellshare -n $name --room ${USER}_${name} --password $USER 
