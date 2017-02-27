#!/bin/bash
cd ~
mkdir test 
ls -al > test/list
mkdir test/links
ln test/list test/links/list_link 
rm test/list
cat test/links/list_link
ln test/links/list_link list1
find /etc -type f -name "*.conf" > list_conf
find /etc -type d -name "*.d" > list_d
cp list_conf list_conf_d && cat list_d >> list_conf_d
ln -s list_conf_d list_conf_d_link
ln list1 test/links/links_list_1
#less list_conf_d_link
mkdir test/.sub
cp list_conf_d test/.sub
cp -b list_conf_d test/.sub
mv test/.sub/list_conf_d test/.sub/list_etc
rm list_conf_d
cat list_conf_d_link
cal 2000 > test/calendar.txt
sed '3,10!d' test/calendar.txt
ls test/
ls test/links/list_link -l
man man > man.txt 
mkdir -p splitted_man && split --bytes=1K man.txt splitted_man/ #not prohibitted to put them to another dir!
mkdir -p man.dir
mv splitted_man/* man.dir
cat man.dir/* > man.dir/man.txt
find man.dir ! -name "man.txt" -type f -exec rm -r {} +
cmp --silent man.txt man.dir/man.txt && echo "OK"
echo "one" > newman && cat man.txt >> newman && echo "two" >> newman && mv newman man.txt
diff man.txt man.dir/man.txt > man.dir/man_patch
patch -R man.dir/man.txt < man.dir/man_patch
cmp --silent man.txt man.dir/man.txt && echo "OK"
read -n 1 -p "Press any key to continue" mainmenuinput
rm -r test
rm -r man.dir
rm -r splitted_man
rm man.txt
rm list_d
rm list_conf
rm list_conf_d_link
rm list1