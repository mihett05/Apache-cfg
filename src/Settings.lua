print("---çSetting configuration of Apache---")
print("---Version 0.5---")
print("çName of index file(With extension, index.php, news.php...)")
index = io.read()
print("êExtension of file in project (ÅWithout dot php, html, phtml, xhtml...)")
ext = io.read()
print("êAllow CGI scripts [Y/Nç]?")
cgi = io.read()
print("èShow content of folder, if wihtout index file†[Y/N]?")
indexes = io.read()
print("êAllow run SSI scripts [Y/N]?")
ssi = io.read()
------------------------------------
if cgi == "Y" then 
	cgi = "+ExecCGI"
elseif cgi == "Nç" then
	cgi = "-ExecCGI"
else
end
-----------------------------------
if indexes == "Y" then 
	indexes = "+Indexes"
elseif indexes == "çN" then
	indexes = "-Indexes"
else
end
------------------------------------
if ssi == "Y" then 
	ssi = "+Includes"
elseif ssi == "çN" then
	ssi = "-Includes"
else
end
--------------------------------------
file=io.open(".htaccess",'w')
	file:write("RewriteEngine on\n")
	file:write("RewriteCond %{REQUEST_FILENAME} !-d\n")
	file:write("RewriteCond %{REQUEST_FILENAME}\\."..ext.." -f\n")
	file:write("RewriteRule ^(.*)$ $1."..ext.."\n\n")
	file:write("DirectoryIndex "..index.."\n\n")
	file:write("Options All "..cgi.." "..indexes.." "..ssi.."\n")
	file:close()
	print("Apache server successfully configured!")
	io.read()