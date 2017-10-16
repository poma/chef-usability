set ws=wscript.createobject("wscript.shell")
ws.run "C:\Windows\System32\bash.exe -c 'sudo /usr/sbin/sshd -D'",0
' ws.run "C:\Windows\System32\bash.exe -c 'sudo dropbear && sleep infinity'",0