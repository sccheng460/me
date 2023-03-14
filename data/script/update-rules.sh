#!/bin/sh
LC_ALL='C'

rm *.txt

wait
echo '创建临时文件夹'
mkdir -p ./tmp/

#添加补充规则
cp ./data/rules/adblock.txt ./tmp/rules01.txt
cp ./data/rules/whitelist.txt ./tmp/allow01.txt

cd tmp
#下载yhosts规则
wget -O rules001.txt https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts
sed -i '/^$/d' rules001.txt
sed -i '/^#/'d rules001.txt
sed -i 's/0.0.0.0 /||/g' rules001.txt
sed -i 's/$/&^/g' rules001.txt

#下载大圣净化规则
wget -O rules002.txt https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
sed -i '/^$/d' rules002.txt
sed -i '/^#/'d rules002.txt
sed -i '/127.0.0.1 livew.l.qq.com #-> 腾讯视频/d' rules002.txt
sed -i '/127.0.0.1 t7z.cupid.iqiyi.com #-> 爱奇艺/d' rules002.txt
sed -i '/127.0.0.1 wxsnsdy.wxs.qq.com #-> 微信/d' rules002.txt
sed -i '/127.0.0.1 localhost/d' rules002.txt
sed -i '/::1 localhost/d' rules002.txt
sed -i 's/127.0.0.1 /||/g' rules002.txt
sed -i 's/$/&^/g' rules002.txt

#下载乘风视频过滤规则
wget -O rules003.txt https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt
sed -i '/^$/d' rules003.txt
sed -i 's/atm.youku.com/||atm.youku.com^/g' rules003.txt
sed -i 's/cad.youku.com/||cad.youku.com^/g' rules003.txt
sed -i 's/apisgame.iqiyi.com/||apisgame.iqiyi.com^/g' rules003.txt
sed -i 's/static.g.iqiyi.com/||static.g.iqiyi.com^/g' rules003.txt
sed -i 's/show.ssports.com/||show.ssports.com^/g' rules003.txt
sed -i 's/cm.l.qq.com/||cm.l.qq.com^/g' rules003.txt
sed -i 's/miaozhen.com/||miaozhen.com^/g' rules003.txt
sed -i 's/reachmax.cn/||reachmax.cn^/g' rules003.txt
sed -i 's/scorecardresearch.com/||scorecardresearch.com^/g' rules003.txt
sed -i 's/tencentmind.com/||tencentmind.com^/g' rules003.txt
sed -i 's/xtgreat.com/||xtgreat.com^/g' rules003.txt
sed -i 's/cm.bilibili.com/||cm.bilibili.com^/g' rules003.txt
sed -i 's/bjcathay.com/||bjcathay.com^/g' rules003.txt
sed -i 's/synacast.com/||synacast.com^/g' rules003.txt
sed -i 's/de.as.pptv.com/||de.as.pptv.com^/g' rules003.txt
sed -i 's/pub.funshion.com/||pub.funshion.com^/g' rules003.txt
sed -i 's/ad-survey.com/||ad-survey.com^/g' rules003.txt
sed -i 's/adpushup.com/||adpushup.com^/g' rules003.txt
sed -i 's/adxvip.com/||adxvip.com^/g' rules003.txt
sed -i 's/behe.com/||behe.com^/g' rules003.txt
sed -i 's/biddingx.com/||biddingx.com^/g' rules003.txt
sed -i 's/cr-nielsen.com/||cr-nielsen.com^/g' rules003.txt
sed -i 's/fancyapi.com/||fancyapi.com^/g' rules003.txt
sed -i 's/ipinyou.com/||ipinyou.com^/g' rules003.txt
sed -i 's/kejet.net/||kejet.net^/g' rules003.txt
sed -i 's/ulmdb.cn/||ulmdb.cn^/g' rules003.txt
sed -i 's/xelements.cn/||xelements.cn^/g' rules003.txt
sed -i 's/yoyi.com.cn/||yoyi.com.cn^/g' rules003.txt
sed -i 's/zhiziyun.com/||zhiziyun.com^/g' rules003.txt
sed -i 's/wan.douyu.com/||wan.douyu.com^/g' rules003.txt
sed -i 's/g.huya.com/||g.huya.com^/g' rules003.txt
sed -i 's/litix.io/||litix.io^/g' rules003.txt
sed -i 's/91p20.space/||91p20.space^/g' rules003.txt
sed -i 's/waust.at/||waust.at^/g' rules003.txt
sed -i 's/jads.co/||jads.co^/g' rules003.txt
sed -i 's/statsy.net/||statsy.net^/g' rules003.txt
sed -i 's/cdn.sosrom.cn/||cdn.sosrom.cn^/g' rules003.txt
sed -i 's/d58zz.com/||d58zz.com^/g' rules003.txt
sed -i 's/aqours.today/||aqours.today^/g' rules003.txt
sed -i 's/mediaadjustment.com/||mediaadjustment.com^/g' rules003.txt
sed -i 's/stgowan.com/||stgowan.com^/g' rules003.txt
sed -i 's/trustedgatetocontent.com/||trustedgatetocontent.com^/g' rules003.txt
sed -i 's/ch-hr12333.com/||ch-hr12333.com^/g' rules003.txt
sed -i 's/cppoc.com/||cppoc.com^/g' rules003.txt
sed -i 's/g1c5.com/||g1c5.com^/g' rules003.txt
sed -i 's/geoparker.net/||geoparker.net^/g' rules003.txt
sed -i 's/jinrongwang.net/||jinrongwang.net^/g' rules003.txt
sed -i 's/onenews.vip/||onenews.vip^/g' rules003.txt
sed -i 's/quickapp.cn/||quickapp.cn^/g' rules003.txt
sed -i 's/v4dwkcv.com/||v4dwkcv.com^/g' rules003.txt
sed -i 's/weizhenwx.com/||weizhenwx.com^/g' rules003.txt
sed -i 's/youle55.com/||youle55.com^/g' rules003.txt
sed -i 's/bixinlive.com/||bixinlive.com^/g' rules003.txt
sed -i 's/quandangdang.net/||quandangdang.net^/g' rules003.txt

echo '下载规则'
rules=(
  "https://filters.adtidy.org/android/filters/2_optimized.txt" #adg基础过滤器
  "https://filters.adtidy.org/android/filters/11_optimized.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/android/filters/17_optimized.txt"  #adgURL过滤器
  "https://filters.adtidy.org/android/filters/3_optimized.txt" #adg防跟踪
  "https://filters.adtidy.org/android/filters/224_optimized.txt" #adg中文过滤器
  "https://perflyst.github.io/PiHoleBlocklist/SmartTV-AGH.txt" #Tv规则
  "https://easylist-downloads.adblockplus.org/easyprivacy.txt" #EasyPrivacy隐私保护规则
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt" #去APP下载提示规则
  "https://raw.githubusercontent.com/d3ward/toolz/master/src/d3host.adblock" #d3ward规则
 )

allow=(
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/ChineseFilter/sections/allowlist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/GermanFilter/sections/allowlist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/TurkishFilter/sections/allowlist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/allowlist.txt"
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
