#!/bin/sh
LC_ALL='C'

rm *.txt

wait
echo '创建临时文件夹'
mkdir -p ./tmp/

#添加补充规则
#cp ./data/rules/adblock.txt ./tmp/rules01.txt
#cp ./data/rules/whitelist.txt ./tmp/allow01.txt
cd tmp
echo '下载规则'
rules=(
   "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt"   #ADGK
"https://raw.githubusercontent.com/lingeringsound/adblock/master/adblock_lite"   #混合规则(精简版)
"https://ghproxy.net/https://raw.githubusercontent.com/afwfv/DD-AD/main/rule/dns.txt"    #dd带佬dns
"https://ghproxy.net/https://raw.githubusercontent.com/xndeye/adblock_list/main/rule/dns.txt"  #adblock
"https://ghproxy.net/https://raw.githubusercontent.com/afwfv/DD-AD/main/rule/DD-AD.txt"    #dd带佬adgh
"https://raw.gitmirror.com/Cats-Team/dns-filter/main/abp.txt"
"https://ghproxy.net/https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt"   #大萌主
"https://raw.githubusercontent.com/Cats-Team/AdRules/main/adblock_lite.txt"
  "https://ghproxy.com/https://raw.githubusercontent.com/lingeringsound/adblock/master/adblock"
"https://raw.github.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"   #NoCoin Filter List
"https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt"
"https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/adservers-and-trackers.txt"
"https://filters.adtidy.org/extension/ublock/filters/104_optimized.txt"
"https://jihulab.com/qq5460168/5460/-/raw/master/black.txt"  #小靓仔
"https://raw.hellogithub.com/hosts"  #github加速
"https://jsd.onmicrosoft.cn/gh/TG-Twilight/AWAvenue-Adblock-Rule@main/AWAvenue-Adblock-Rule.txt"   #秋风
"https://badmojr.github.io/1Hosts/Lite/hosts.txt"
"https://raw.githubusercontent.com/sccheng460/AdGuard-Rules/main/sccad.txt"
"https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad.txt"  #Halflife
"https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt"  #乘风过滤
"https://anti-ad.net/easylist.txt"  #adni
"https://easylist-downloads.adblockplus.org/fanboy-annoyance.txt"  #Fanboy’s Annoyances List
"https://cdn.jsdelivr.net/gh/5-whys/adh-rules@release/output_full.txt"  #火柴
"https://raw.githubusercontent.com/BlueSkyXN/AdGuardHomeRules/master/all-lite.txt"  #国内集合
)
 
allow=(
  "https://raw.githubusercontent.com/sccheng460/adg/main/whitelist.txt"
)

for i in "${!rules[@]}" "${!allow[@]}"
do
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "rules${i}.txt" --connect-timeout 60 -s "${rules[$i]}" |iconv -t utf-8 &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "allow${i}.txt" --connect-timeout 60 -s "${allow[$i]}" |iconv -t utf-8 &
done
wait
echo '规则下载完成'

# 添加空格
file="$(ls|sort -u)"
for i in $file; do
  echo -e '\n' >> $i &
done
wait

echo '处理规则中'

cat | sort -n| grep -v -E "^((#.*)|(\s*))$" \
 | grep -v -E "^[0-9f\.:]+\s+(ip6\-)|(localhost|local|loopback)$" \
 | grep -Ev "local.*\.local.*$" \
 | sed s/127.0.0.1/0.0.0.0/g | sed s/::/0.0.0.0/g |grep '0.0.0.0' |grep -Ev '.0.0.0.0 ' | sort \
 |uniq >base-src-hosts.txt &
wait
cat base-src-hosts.txt | grep -Ev '#|\$|@|!|/|\\|\*'\
 | grep -v -E "^((#.*)|(\s*))$" \
 | grep -v -E "^[0-9f\.:]+\s+(ip6\-)|(localhost|loopback)$" \
 | sed 's/127.0.0.1 //' | sed 's/0.0.0.0 //' \
 | sed "s/^/||&/g" |sed "s/$/&^/g"| sed '/^$/d' \
 | grep -v '^#' \
 | sort -n | uniq | awk '!a[$0]++' \
 | grep -E "^((\|\|)\S+\^)" & #Hosts规则转ABP规则

cat | sed '/^$/d' | grep -v '#' \
 | sed "s/^/@@||&/g" | sed "s/$/&^/g"  \
 | sort -n | uniq | awk '!a[$0]++' & #将允许域名转换为ABP规则

cat | sed '/^$/d' | grep -v "#" \
 |sed "s/^/@@||&/g" | sed "s/$/&^/g" | sort -n \
 | uniq | awk '!a[$0]++' & #将允许域名转换为ABP规则

cat | sed '/^$/d' | grep -v "#" \
 |sed "s/^/0.0.0.0 &/g" | sort -n \
 | uniq | awk '!a[$0]++' & #将允许域名转换为ABP规则

cat *.txt | sed '/^$/d' \
 |grep -E "^\/[a-z]([a-z]|\.)*\.$" \
 |sort -u > l.txt &

cat \
 | sed "s/^/||&/g" | sed "s/$/&^/g" &

cat \
 | sed "s/^/0.0.0.0 &/g" &


echo 开始合并

cat rules*.txt \
 |grep -Ev "^((\!)|(\[)).*" \
 | sort -n | uniq | awk '!a[$0]++' > tmp-rules.txt & #处理AdGuard的规则

cat \
 | grep -E "^[(\@\@)|(\|\|)][^\/\^]+\^$" \
 | grep -Ev "([0-9]{1,3}.){3}[0-9]{1,3}" \
 | sort | uniq > ll.txt &
wait

cat l*.txt \
 |grep -v '^!' | grep -E -v "^[\.||]+[com]+[\^]$" \
 |grep -Ev "^\^" \
 |sort -n |uniq >> tmp1-dns1.txt & #处理DNS规则
wait
cat tmp1-dns1.txt \
 | sort -n |uniq -u #去重过期域名
wait

cat *.txt | grep '^@' \
 | sort -n | uniq > tmp-allow.txt & #允许清单处理
wait

echo 规则合并完成

#移动规则到Pre目录
cd ../
mkdir -p ./pre/
cp ./tmp/tmp-*.txt ./pre
cd ./pre

# Python 处理重复规则
python .././data/python/rule.py

# Start Add title and date
diffFile="$(ls|sort -u)"
for i in $diffFile; do
 n=`cat $i | wc -l` 
 echo "! Version: $(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')（北京时间） " >> tpdate.txt 
 new=$(echo "$i" |sed 's/tmp-//g') 
 echo "! Total count: $n" > $i-tpdate.txt 
 cat ./tpdate.txt ./$i-tpdate.txt ./$i > ./$new 
 rm $i *tpdate.txt 
done

echo '更新统计数据'

cd ../

diffFile="$(ls pre |sort -u)"
for i in $diffFile; do
 titleName=$(echo "$i" |sed 's#.txt#-title.txt#') 
 cat ./data/title/$titleName ./pre/$i | awk '!a[$0]++'> ./$i 
 sed -i '/^$/d' $i 

done
wait
echo '更新成功'
rm -rf pre

exit
