#!/bin/bash
#遍历文件夹、删除指定目录
 
function scandir() {
    local cur_dir parent_dir workdir
    workdir=$1
    cd ${workdir}
    if [ ${workdir} = "/" ]
    then
        cur_dir=""
    else
        cur_dir=$(pwd)
    fi
 
    for dirlist in $(ls -a ${cur_dir})
    do
        if [ ${dirlist} = $2 ];then
            echo ${dirlist}
            rm -rf ${dirlist}
        elif test -d ${dirlist} -a ! ${dirlist} = '.' -a ! ${dirlist} = '..';then
            scandir ${cur_dir}/${dirlist} $2
            cd ..
        fi
    done
}
 
if test -d $1
then
    scandir $1 $2
elif test -f $1
then
    echo "you input a file but not a directory,pls reinput and try again"
    exit 1
else
    echo "the Directory isn't exist which you input,pls input a new one!!"
    exit 1
fi

