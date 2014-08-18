Documentation for setting up R and LAMP stack in Amazon Linux

# Check if LAMP stack is running / installed 
	service httpd status
	ps aux | grep hhtp 
	ps aux | grep apache

# Create a swap space 
	cat /etc/fstab 
	df -h 
	vim /etc/fstab 

#installing Rstudio 

	wget http://download2.rstudio.org/rstudio-server-0.98.994-x86_64.rpm
	sudo yum install --nogpgcheck rstudio-server-0.98.994-x86_64.rpm
	rstudio-server status 

#Installing LAMP
	groups 
	visudo
	sudo su 
	sudo chown -R root:www /var/www
	sudo chmod 0775 /var/www
	find /var/www -type d -exec sudo chmod 0775 {} +
	find /var/www -type f -exec sudo chmod 0664 {} +
	echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
	#try if php is correctly installed, navigate to http://ip/phpinfo.php
	rm /var/www/html/phpinfo.php 
	#MySQL
	sudo service mysqld start
	sudo mysql_secure_installation
	sudo service mysqld stop
#Installing R 
# R installation in AWS is bit tricky since Amazon Linux repo only contains R 3.0.0 and 
# we require a R version > 3.1.0

# For older R ( 3.0.0) installation just do, this works perfectly but not what we need
sudo yum install R

# FAILED ATTEMPT
 
#, tried to install R (3.1.1) using EPEL repo 
	#enable EPEL repo by changing enabled=0 to enabled=1 
	sudo vim /etc/yum.repos.d/epel.repo

	#Notice that even after enabling EPEL repo R version is 3.0.0
	sudo yum install R
	#Reason being yum is still considering Amazon Linux repo due to preference 

	# Try updating yum 
	sudo yum update

	#list repos and double check if epel is enabled 
	yum repolist
	yum repolist  enabled

	#try installing R without Amazon repo 
	sudo yum --disablerepo="am*" install R
	# Error: Package: R-core-devel-3.1.0-5.el6.x86_64 (epel)
    # Requires: libicu-devel


# Now Compile R from source
	#get the latest R version 
	wget http://cran.rstudio.com/src/base/R-3/R-3.1.0.tar.gz
	#unzip and cd into folder 
	tar -xf R-*tar.gz
	cd R-3.1.0

	./configure
	configure: error: --with-readline=yes (default) and headers/libs are not available
	#Configure failed since Amazon linux dont have readlines library nor X11 

	sudo ./configure --with-x=no
	#Again configure failed due to absence of readlines 

	
	# Now only way to solve this is to get have a Centos 6 and Centos 7 repo configured 
	# So get those repos and copy them to location /etc/yum.repos.d/

	# Enable base and extra repos, and change the base and extra repo name of Centos 6 to 
	# base6 and extras6 to avoid same name conflict 

	sudo cp CentOS-Base.repo /etc/yum.repos.d/
	vim /etc/yum.repos.d/centos.repo
	#some signatures to make the centos repos work 
	cd /etc/pki/rpm-gpg/
	wget http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7
	wget http://mirror.centos.org/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6

	# Some of these didnt work for me but still you may try installing them 
	sudo yum clean all 
	sudo yum update -y 
	sudo yum groupinstall "X Software Development"
	sudo yum install libX11-devel
	sudo yum install gcc
	sudo yum install xorg-x11-devel

	sudo yum groupinstall "Development Tools"

	# a Very useful log to keep track thing you installed 
	sudo cat /var/log/yum.log
	sudo cat /var/log/yum.log | grep R

	#lets start again 
	sudo yum remove R-*
	sudo yum remove R 

	#tried to solve some dependencies using skip broken tag
	sudo yum --disablerepo="am*" install R --skip-broken
	sudo yum install xorg-x11-xauth.x86_64 xorg-x11-server-utils.x86_64
	cd ~/R-3.1.0

	#More dependencies, yea readline installed properly 
	sudo yum install readline-devel 

	# Now try configure without X11
	sudo ./configure  --with-x=no

	#make a system wide installation 
	make install  
	make check 

	#check the installed version 
	which R
	R

# More packages to make R rum properly 
	
	#Curl and XML 
	sudo yum install libcurl-devel 
	sudo yum install libxml2-devel

	#PNG  png.h
	sudo yum install libpng-devel
	sudo yum install zlib-devel bzip2-devel openssl-devel \ 
	ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel


# R Studio Installation 
## R Studio Installation works really well with R (3.0.0) default version but 
## if you try to install it after compiling 3.1.1 its bit hard 
	cd
	wget https://github.com/rstudio/rstudio/tarball/v0.98.507
	ls
	tar -xvf v0.98.507 
	ls
	cd rstudio-rstudio-ee098fe/
	# Read the installation procedure well 
	cat INSTALL 

	# Make a build directory 
	mkdir build
	cd build/
	
	cmake .. -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release
	# Boo cmake is also not installed 
	sudo yum install cmake 



	sudo yum install --nogpgcheck rstudio-server-0.98.994-x86_64.rpm
	sudo yum install --disablerepo="am*" --nogpgcheck rstudio-server-0.98.994-x86_64.rpm
	sudo yum install  libicu
	cd /etc/yum.repos.d/
	sudo yum remove libicu
	sudo yum install cmake 
	cd rstudio-rstudio-ee098fe/
	cmake .. -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release

	#Solve dependencies 
	sudo yum install openssl
	sudo yum -y install openssl-devel
	sudo yum install boost boost-devel boost-doc
	sudo yum install pam-devel

# Installing python 

	# Python version is 2.6.9 in Amazon Linux 
	# follow the following at your own risk 
	# sudo yum  install python -- wont work 
	sudo yum install make automake gcc gcc-c++ kernel-devel git-core -y 
	sudo yum install python27-devel -y 
	sudo rm /usr/bin/python
	sudo ln -s /usr/bin/python2.7 /usr/bin/python 

	# Just make sure that yum will use the older version of yum 
	sudo cp /usr/bin/yum /usr/bin/_yum_before_27 
	sudo sed -i s/python/python2.6/g /usr/bin/yum 
	sudo sed -i s/python2.6/python2.6/g /usr/bin/yum 
	python -V 


#Installing pipy 
	wget https://bootstrap.pypa.io/get-pip.py
	sudo python get-pip.py
	pip install -U setuptools
	sudo pip install virtualenv
	pip -V && virtualenv --version
	sudo pip install feedparser klout 
	sudo pip install tldextract	


#Put stanford NER in right place 
	wget http://nlp.stanford.edu/software/stanford-ner-2014-06-16.zip
	unzip stanford-ner-2014-06-16.zip 
	cat world_cities.csv 



