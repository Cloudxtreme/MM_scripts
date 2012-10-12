# find most recent profile
profile=$(find ./current/ -name *#* | sort -n | tail -1)

# copy to master file
cp $profile ./current/MM.xml

# remove HostPackage information
sed -i '/<Host/,/<\/HostPackage>/d' ./current/MM.xml

# remove password from auto connect
sed -i 's/4\.5,\[\[send(\&quot;.*\&quot/4\.5,\[\[send(\&quot;\&quot/' ./current/MM.xml

# find most recent map
profile=$(find ./map/ -name *dat | sort -n | tail -1)

# backup map
cp $profile ./map/mm

# remove old map files
cd map
rm `ls -t | awk 'NR>6'`
cd ..

# remove old config files
cd current
rm `ls -t | awk 'NR>11'`
cd ..

#update git
git add map

# make usable copy of profile
cp $profile ./current/copy
