a=$(vmstat -s | awk  ' $0 ~ /total memory/ {total=$1 } $0 ~/free memory/ {free=$1} $0 ~/buffer memory/ {buffer=$1} $0 ~/cache/ {cache=$1} END{print (total-free-buffer-cache)/total*100}')
echo ${a%.*}
echo "Present cache and swap memory is  $a"
if [ ${a%.*} -ge 15 ];then
echo "clearing cache"
echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'
else
echo "No Need to clear cache right now"
fi
