#!/bin/bash
# Remotify - Clone NOIP Setup

# Print Error, Delete File & Exit Process
# ======================================================
function process_failed() {
    exit 1
}
function process_success() {
    exit 0
}
# ======================================================


# Collect & Validate Parameters
# ======================================================
toDomain=$1

[ -z "$1" ] && process_failed
# ======================================================


# Main Process Code
# ======================================================
function process_do() {

    # Empty noip client Directory
	rm -rf /home/admin/web/$toDomain/public_html/client		                        &> /dev/null || process_failed
	
    # Clone NOIP Folder
	cp -rf /home/admin/templates/client /home/admin/web/$toDomain/public_html		&> /dev/null || process_failed
}
# ======================================================


# Execute Main Code & Delete File
# ======================================================
process_do
process_success
# ======================================================