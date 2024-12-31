#!/bin/bash
# Remotify - Upload SSH Files and Template Files

# Print Error, Delete File & Exit Process
# ======================================================
function process_failed() {
    exit 1
}
function process_success() {
    exit 0
}
# ======================================================


# SSH Files Code
# ======================================================
function ssh_files() {

    rm -rf /home/admin/ssh-files
    mkdir -p /home/admin/ssh-files

    cd /home/admin/ssh-files

    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/add_matamo.sh -O add_matamo.sh;
    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/clone_domain.sh -O clone_domain.sh;
    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/clone_noip.sh -O clone_noip.sh;
    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/clone_template.sh -O clone_template.sh;
}
# ======================================================


# Template Files Code
# ======================================================
function template_files() {

    rm -rf /home/admin/templates
    mkdir -p /home/admin/templates

    cd /home/admin/templates

    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/noip-client.zip -O noip-client.zip;
    unzip noip-client.zip
    rm -f noip-client.zip

    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/news-magazine-design-1.zip -O news-magazine-design-1.zip;
    unzip news-magazine-design-1.zip
    rm -f news-magazine-design-1.zip

    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/news-magazine-design-2.zip -O news-magazine-design-2.zip;
    unzip news-magazine-design-2.zip
    rm -f news-magazine-design-2.zip

    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/news-magazine-design-3.zip -O news-magazine-design-3.zip;
    unzip news-magazine-design-3.zip
    rm -f news-magazine-design-3.zip

    wget https://github.com/admin17714/admin17714/raw/refs/heads/main/news-magazine-design-4.zip -O news-magazine-design-4.zip;
    unzip news-magazine-design-4.zip
    rm -f news-magazine-design-4.zip
}
# ======================================================


# Execute Main Code & Delete File
# ======================================================
ssh_files
template_files
process_success
# ======================================================