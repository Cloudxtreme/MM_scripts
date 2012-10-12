# find most recent profile
profile=$(find ./current/ -name *#* | sort -n | tail -1)

# Get HostPackage xml block
sed -n '/<\?xml/,/\/HostPackage>/p' $profile > holder

# Add HostPackage xml block to MM xml and update most recent
sed -n '/<TriggerPackage>/,/MudletPackage>/p' ./current/MM.xml >> holder

# add in autoconnect pass
pass=$(awk 'NR==2' password)
sed -i "s/4\.5,\[\[send(\&quot;\&quot/4\.5,\[\[send(\&quot;$pass\&quot/" holder

# replace current profile
mv holder $profile

# make usable copy of profile
cp $profile ./current/copy
