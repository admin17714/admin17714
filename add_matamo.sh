#!/bin/bash
# Remotify - Add Matamo Analytics Code to index.html or index.php

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
domainName=$1
matamoDomain=$2
siteId=$3

[ -z "$1" ] && process_failed
[ -z "$2" ] && process_failed
[ -z "$3" ] && process_failed
# ======================================================


# Prepare Matamo Code
matamoCode="<!-- Matomo -->
<script type=\"text/javascript\">
  var _paq = window._paq = window._paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u=\"//$matamoDomain/\";
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', $siteId]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Matomo Code -->"



# Add Code to File
# ======================================================
function addCode_toFile() {
    
    fileName=$1

    # Replace any old Code from File
    # sed -i '/START_PATTERN/,/END_PATTERN/d' your_file.txt
    sed -i '/<!-- Matomo -->/,/<!-- End Matomo Code -->/d' $fileName

    # Add new code in File
    sed -i '/<head>/r'<(echo "$matamoCode") $fileName
}
# ======================================================



# Main Process Code
# ======================================================
function process_do() {

    # Check for index.htm
    fileName="/home/mrtxx/web/$domainName/public_html/index.htm"
    if [ -e $fileName ]; then
        addCode_toFile $fileName
    fi

    # Check for index.html
    fileName="/home/mrtxx/web/$domainName/public_html/index.html"
    if [ -e $fileName ]; then
        addCode_toFile $fileName
    fi

    # Check for index.php
    fileName="/home/mrtxx/web/$domainName/public_html/index.php"
    if [ -e $fileName ]; then
        addCode_toFile $fileName
    fi
}
# ======================================================


# Execute Main Code & Delete File
# ======================================================
process_do
process_success
# ======================================================