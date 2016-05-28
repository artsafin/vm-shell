#!/bin/bash

PROVISION_DIR=/provision
HOME_MNT_POINT=/mnt/smb
VM_USER=artsafin
SMB_RESOURCE=//192.168.56.1/home
SMB_CREDFILE=/vagrant/cifs_creds

if ! grep ${VM_USER} /etc/passwd; then
    useradd --groups root --shell /usr/bin/zsh -M ${VM_USER}
    echo "${VM_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${VM_USER}
    echo "${VM_USER}:vagrant" | chpasswd

    mkdir ${PROVISION_DIR}

    # if [ ! -f $PROVISION_DIR/mounted ]; then
    #     umount /mnt/nfs
    #     AUID=`id -u $VM_USER`
    #     mount -t vboxsf -o uid=$AUID,gid=$AUID,umask=0077,rw mounted-home /mnt/nfs
    #     ln -s /mnt/nfs /home/$VM_USER
    #     touch $PROVISION_DIR/mounted
    # fi

    if [ ! -f ${PROVISION_DIR}/mounted-smb ]; then
        mkdir ${HOME_MNT_POINT}
        mount -v -t cifs -o file_mode=0600,dir_mode=0700,uid=${VM_USER},credentials=${SMB_CREDFILE},sec=ntlm ${SMB_RESOURCE} ${HOME_MNT_POINT}
        ln -s ${HOME_MNT_POINT} /home/${VM_USER}
        touch ${PROVISION_DIR}/mounted-smb
    fi
fi
