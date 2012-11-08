# find most recent profile
profile=$(find ./current/ -name *#* -printf '%T@ %p\n' | sort -k 1nr | sed 's/^[^ ]* //' | head -n 1)

# Get HostPackage xml block
sed -n '/<\?xml/,/\/HostPackage>/p' $profile > holder

# Add HostPackage xml block to MM xml and update most recent
sed -n '/<TriggerPackage>/,/MudletPackage>/p' ./current/MM.xml >> holder

# add in autoconnect pass
pass=$(awk 'NR==2' password)
sed -i "s/7\.5,\[\[send(\&quot;\&quot/7\.5,\[\[send(\&quot;$pass\&quot/" holder

# replace current profile
mv holder $profile

# find most recent map
profile=$(find ./map/ -name *dat -printf '%T@ %p\n' | sort -k 1nr | sed 's/^[^ ]* //' | head -n 1)
touch $profile

# make usable copy of profile
./copyProfiles.sh
