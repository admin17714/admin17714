#!/bin/bash
# Remotify - Clone Template

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
templateName=$2

[ -z "$1" ] && process_failed
[ -z "$2" ] && process_failed
# ======================================================


# Main Process Code
# ======================================================
function process_do() {

    # Empty public_html Directory
	rm -rf /home/admin/web/$toDomain/public_html/*		                                    &> /dev/null || process_failed
	
    # Clone Template Folder
	cp -rf /home/admin/templates/$templateName/* /home/admin/web/$toDomain/public_html		&> /dev/null || process_failed
}
# ======================================================


# Execute Main Code & Delete File
# ======================================================
process_do
process_success
# ======================================================