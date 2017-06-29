#!/bin/bash
#Written By: Richard L. Jackson
#Date Written: So 28 Sep 2014 04∶12∶46 CEST
#This is a layout of the step-by-step update
#
#SHOULD DISPLAY THE FOLLOWING
#bash: warning: x: ignoring function definition attempt
#bash: error importing function definition for `x'
#bash test

#Download source code and patches
wget http://ftp.gnu.org/gnu/bash/bash-4.3.tar.gz
wget http://ftp.gnu.org/gnu/bash/bash-4.3-patches/bash43-001
wget http://ftp.gnu.org/gnu/bash/bash-4.3-patches/bash43-002
wget http://ftp.gnu.org/gnu/bash/bash-4.3-patches/bash43-003
wget http://ftp.gnu.org/gnu/bash/bash-4.3-patches/bash43-024
wget http://ftp.gnu.org/gnu/bash/bash-4.3-patches/bash43-025
wget http://ftp.gnu.org/gnu/bash/bash-4.3-patches/bash43-026

#UNzip tape archive
tar -xvzf bash-4.3.tar.gz
cp bash43-* bash-4.3/
cd bash-4.3
#Execute the patches
patch -p0 -i bash43-001
patch -p0 -i bash43-002
patch -p0 -i bash43-003
patch -p0 -i bash43-024
patch -p0 -i bash43-024
patch -p0 -i bash43-025
patch -p0 -i bash43-026

#Run config script and make commands
./configure
make
make install

#Rename legacy files and change permissions
cp /bin/bash /bin/bash.old 
chmod -x /bin/bash.old
cp /usr/bin/bashbug /usr/bin/bashbug.old 
chmod -x /usr/bin/bashbug.old

#Replace legacy program with new. 
cp -f bash /bin/ 
cp bashbug /usr/bin/ 
cp bashversion /bin/


bashversion

#Final Check 
env x='() { :;}; echo System Exploited!' bash -c "echo Completed, Test..."
