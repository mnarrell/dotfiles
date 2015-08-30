#!/usr/bin/env bash

confirm(){
    echo -n "$@ "
    read ans
    for res in y Y yes; do
        if [ "_${ans}" == "_${res}" ]; then
            return 0
        fi
    done
    return 1
}

mklink(){
    filename=`echo $1 | sed 's/\.\///'`
    link_file="${HOME}/.`echo ${filename} | sed 's/.*\/\([a-z_.A-Z]*\).symlink/\1/'`"
    orig_file="`pwd`/${filename}"
    # if the link already exists and pointing to the right place - continue
    if [ -L $link_file ]; then
        target=`readlink ${link_file}`
        if [ "${target}" == "${orig_file}" ]; then
            return 0
        fi
    fi

    if [ -e $link_file ]; then
        confirm "Replace ${link_file}? (y/N)"
        if [ $? -eq 1 ]; then
            return 1
        fi
    fi
    echo ln -fs $orig_file $link_file
    ln -fs $orig_file $link_file
}

# Create base config
if [ ! -f ~/.localrc ]; then
    echo "export DOTFILES=`pwd`" >> ~/.localrc
fi

for topic in topics/*; do
    topic_name=`echo ${topic} | sed 's/.*\///'`
    confirm "Installing ${topic_name} (y/N)"
    [ $? -eq 1 ] && continue;

    # Handle pre-up hooks
    [ -e ${topic}/pre-up ] && ${topic}/pre-up

    # Make symlinks
    for filename in ${topic}/*.symlink; do
        mklink "$filename"
    done

    # Handle post-up hooks
    [ -e ${topic}/post-up ] && ${topic}/post-up
done

