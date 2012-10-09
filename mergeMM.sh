# find most recent profile
profile=$(find ./current/ -name *#* | sort -n | tail -1)

# Get HostPackage xml block
sed -n '/<\?xml/,/\/HostPackage>/p' $profile > holder

# Add HostPackage xml block to MM xml and update most recent
sed -n '/<TriggerPackage>/,/MudletPackage>/p' ./current/MM.xml >> holder

# replace current profile
mv holder $profile

# find most recent map
#profile=$(find ./map/ -name *dat | sort -n | tail -1)

#cp ./map/mm $profile
