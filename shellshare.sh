module load igmm/apps/python/2.7.10

id=`finger -l $USER | grep Name | awk '{print $NF}'`
name=${1:-$id}

python /tmp/bailey/shellshare -n $name --room ${USER}_${name} --password $USER 
