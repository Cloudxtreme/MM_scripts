# find most recent profile
profile=$(find ./current/ -name *#* | sort -n | tail -1)

# copy to master file
cp $profile ./current/MM.xml

# remove HostPackage information
sed -i '/<Host/,/<\/HostPackage>/d' ./current/MM.xml

# find most recent map
profile=$(find ./map/ -name *dat | sort -n | tail -1)

cp $profile ./map/mm
