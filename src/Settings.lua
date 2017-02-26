print("---Setting configuration of Apache---")
print("---Version 0.5---")
print("Name of index file (With extension, index.php, news.php...)")
index = io.read()
print("Extension of file in project (ЃWithout dot php, html, phtml, xhtml...)")
ext = io.read()
print("Allow CGI scripts [Y/N]?")
cgi = io.read()
print("ЏShow content of folder, if wihtout index file [Y/N]?")
indexes = io.read()
print("ђAllow run SSI scripts [Y/N]?")
ssi = io.read()
------------------------------------
if cgi == "Y" then 
	cgi = "+ExecCGI"
elseif cgi == "N" then
	cgi = "-ExecCGI"
else
end
-----------------------------------
if indexes == "Y" then 
	indexes = "+Indexes"
elseif indexes == "N" then
	indexes = "-Indexes"
else
end
------------------------------------
if ssi == "Y" then 
	ssi = "+Includes"
elseif ssi == "N" then
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
