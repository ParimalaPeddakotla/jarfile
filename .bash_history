cd
vi cache.sh
sh cache.sh
vi cache.sh
echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'
sh cache.sh
a=$(vmstat -s | awk  ' $0 ~ /total memory/ {total=$1 } $0 ~/free memory/ {free=$1} $0 ~/buffer memory/ {buffer=$1} $0 ~/cache/ {cache=$1} END{print (total-free-buffer-cache)/total*100}')
echo ${a%.*}
echo "Present cache and swap memory is  $a"
sh cache.sh
a=$(vmstat -s | awk  ' $0 ~ /total memory/ {total=$1 } $0 ~/free memory/ {free=$1} $0 ~/buffer memory/ {buffer=$1} $0 ~/cache/ {cache=$1} END{print (total-free-buffer-cache)/total*100}')
echo ${a%.*}
apt-get update
apt-get install default-jdk
