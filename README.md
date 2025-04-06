# SSL Certificate Expiration Checker 🔒⏳

This is a simple Bash script to check the expiration date of an SSL certificate for a given website. 🖥️🌐

## Features 🚀

- Connects to a website using `openssl` 🛠️
- Retrieves the SSL certificate information 📜
- Checks the expiration date of the certificate 📅
- Displays whether the certificate is expired or still valid ✔️❌

## Usage 💻

To use the script, simply provide the website domain as an argument:

```bash
./check_ssl_expiration.sh example.com
If the certificate is expired, the script will notify you with the expiration date. Otherwise, it will show the valid expiration date. 🌟

Requirements 📦
openssl command-line tool (typically pre-installed on most Linux systems)

Bash shell (Linux/macOS)

Example Output 📊
The expiration date of the SSL certificate for the website example.com is Dec 31 23:59:59 2025 GMT.

The expiration date of the SSL certificate for the website example.com is Dec 31 23:59:59 2025 GMT.
License 📄
This project is licensed under the MIT License - see the LICENSE file for details.

Author ✍️
Konstantinos Kotsaras

