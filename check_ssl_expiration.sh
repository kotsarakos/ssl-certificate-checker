#!/bin/bash
# Check if the website name was provided as an argument
if [ $# -eq 0 ]; then
  echo "Please provide the website as an argument."
  exit 1
fi

# Assign the value of the first command-line argument to the variable webSite.
webSite=$1

# Use openssl s_client to connect to the website and obtain the SSL certificate information.
# The output is then processed to extract the expiration date of the SSL certificate.
# -servername specifies the server name
# -connect specifies the host and port to connect to
# 2>/dev/null redirects error messages to /dev/null, suppressing them from the output
ssl_certificate_info=$(echo | openssl s_client -servername "$webSite" -connect "$webSite":443 2>/dev/null)

# "|" pipe the output from "$ssl_certificate_info"
# Use openssl x509 to extract the expiration date from the certificate information
# -noout omits the normal certificate output
# -enddate prints the expiration date of the certification
# cut is used to extract the date value after the '=' sign
# -f 2 is used in order to select the second field, that is after '='
expiration_date=$(echo "$ssl_certificate_info" | openssl x509 -noout -enddate | cut -d= -f 2)

# Use the 'date -d' option to convert the expiration date to a timestamp
# Use the '%s' to convert it into seconds
expirationConvertToTimestamp=$(date -d "$expiration_date" +%s)

# Use the 'date' command with the format '+%s' to obtain the current timestamp
currentConvertToTimestamp=$(date +%s)

# We check if the current date is greater or equal to the expiration date
# If it is true (SSL certificate is expired), we print a message
# If it is not true (SSL certificate is valid), we print a message
if [ $currentConvertToTimestamp -ge $expirationConvertToTimestamp ]; then
  echo "The SSL certificate for the website $webSite has expired on $expiration_date."
else
  echo "The expiration date of the SSL certificate for the website $webSite is $expiration_date."
fi
