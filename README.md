# Catboy's APiI  
⚡ Lightweight WebAPI runs on a Raspberry Pi, provides commonly used functions.

## Screenshot
<p align="center">
  <img src="https://raw.githubusercontent.com/Catboy96/APiI/master/capture.png" alt="Catboy's APiI Screenshot">
  <br />
</p>

## SUPER CAT LIGHT!
**No dependencies, no prerequisites.** Only bash scripts for dynamic content. This means:  
* **No Python, PHP, JS required. No more NPM or PIP, yay!!** 
* Super light, ultra-low performance cost.
* All you need is install a web server. **lighttpd** recommended.

## Install
* Install a web server like **lighttpd** and enable bash for CGI:  
```
sudo apt install lighttpd -y  
vi /etc/lighttpd/lighttpd.conf
```
Add `cgi.assign = ( ".sh" => "/bin/bash" )` at the end of the file, add `"mod_cgi",` to both `server.modules = (` and `server.modules += (`.
* Clone the project to web root directory.  
```
cd /var/www/html
sudo git clone https://github.com/Catboy96/APiI
```
* Some features with ⚡ sign require adding user "www-data" to sudoers file with no-password enabled.  
This can be done by `sudo vi /etc/sudoers.d/010_www-nopasswd`, add this line, and save the file:  
```
www-data ALL=(ALL) NOPASSWD: ALL
```

