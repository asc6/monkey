How to set up the Monkey Island server:

---------------- On Windows ----------------:
0. Exclude the folder you are planning to install the Monkey in from your AV software, as it might block or delete files from the installation.
1. Create folder "bin" under monkey_island
2. Place portable version of Python 2.7
	2.1. Download and install from: https://www.python.org/download/releases/2.7/
	2.2. Install the required python libraries using "python -m pip install -r monkey_island\requirements.txt"
	2.3. Copy contents from installation path (Usually C:\Python27) to monkey_island\bin\Python27
	2.4. Copy Python27.dll from System32 folder (Usually C:\Windows\System32 or C:\Python27) to monkey_island\bin\Python27
	2.5. (Optional) You may uninstall Python27 if you like.
3. Setup mongodb (Use one of the following two options):
    3.1 Place portable version of mongodb
	   3.1.1 Download from: https://downloads.mongodb.org/win32/mongodb-win32-x86_64-2008plus-ssl-latest.zip
 	   3.2.1 Extract contents from bin folder to monkey_island\bin\mongodb.
	   3.3.1 Create monkey_island\db folder.
	
	OR

    3.1 If you have an instance of mongodb running on a different host, set the MONKEY_MONGO_URL environment variable:

        example for mongodb running on host with IP address 192.168.10.10:

        set MONKEY_MONGO_URL="mongodb://192.168.10.10:27107/monkeyisland"

4. Place portable version of OpenSSL
	4.1. Download from: https://indy.fulgan.com/SSL/Archive/openssl-1.0.2l-i386-win32.zip
	4.2. Extract content from bin folder to monkey_island\bin\openssl
5. Download and install Microsoft Visual C++ redistributable for Visual Studio 2017
	5.1. Download and install from: https://go.microsoft.com/fwlink/?LinkId=746572
6. Generate SSL Certificate
	6.1. run create_certificate.bat when your current working directory is monkey_island
7. Create the monkey_island\cc\binaries folder and put Infection Monkey binaries inside
	monkey-linux-64 - monkey binary for linux 64bit
	monkey-linux-32 - monkey binary for linux 32bit
	monkey-windows-32.exe - monkey binary for windows 32bit
	monkey-windows-64.exe - monkey binary for windows 64bit
8. Install npm
	8.1. Download and install from: https://www.npmjs.com/get-npm
9. Build Monkey Island frontend
	9.1. cd to 'monkey_island\cc\ui'
	9.2. run 'npm update'
	9.3. run 'npm run dist'

How to run:
1. When your current working directory is monkey_island, run monkey_island\windows\run_server.bat

---------------- On Debian/Ubuntu Linux ----------------:
1. Create the following directories:
    sudo mkdir /var/monkey_island
    sudo chmod 777 /var/monkey_island
    mkdir -p /var/monkey_island/bin/mongodb
    mkdir -p /var/monkey_island/db
    mkdir -p /var/monkey_island/cc/binaries

2. Install the packages from monkey_island/requirements.txt:
	sudo python -m pip install -r /var/monkey_island/requirements.txt
	If pip is not installed, install the python-pip package. Make sure the server is running Python 2.7 and not Python 3+.
	
3. put monkey binaries in /var/monkey_island/cc/binaries
    monkey-linux-64 - monkey binary for linux 64bit
	monkey-linux-32 - monkey binary for linux 32bit
	monkey-windows-32.exe - monkey binary for windows 32bit
	monkey-windows-64.exe - monkey binary for windows 64bi

4. Setup MongoDB (Use one of the two following options):

        4.1 Download MongoDB and extract it to /var/monkey_island/bin/mongodb
                for debian64 - https://downloads.mongodb.org/linux/mongodb-linux-x86_64-debian81-latest.tgz
                for ubuntu64 16.10 - https://downloads.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1604-latest.tgz
                find more at - https://www.mongodb.org/downloads#production
                untar.gz with: tar -zxvf filename.tar.gz -C /var/monkey_island/bin/mongodb
                (make sure the content of the mongo folder is in this directory, meaning this path exists:
                        /var/monkey_island/bin/mongodb/bin)
        
        OR

        4.1 If you have an instance of mongodb running on a different host, set the MONKEY_MONGO_URL environment variable:

            example for mongodb running on host with IP address 192.168.10.10:

                set MONKEY_MONGO_URL="mongodb://192.168.10.10:27107/monkeyisland"


5. install OpenSSL
    sudo apt-get install openssl

6. Generate SSL Certificate, Run create_certificate.sh (located under /linux)

7. Copy monkey island server to /var/monkey_island:
    cp -r [monkey_island_source]/cc /var/monkey_island/

8. Install npm
	8.1. Download and install from: https://www.npmjs.com/get-npm
	
9. Build Monkey Island frontend
	9.1. cd to 'monkey_island/cc/ui'
	9.2. run 'npm update'
	9.3. run 'npm run dist'
	
How to run:
1. run run.sh (located under /linux)


---------------- On RHEL/Cent ----------------:
1. Install Packages
    1.1 Install EPEL
    1.2 Install dependencies
     sudo yum groupinstall "Development Tools"
     sudo yum install python-devel python-pip wget git openssl
    
2. Clone or download repository to your system
   2.1 git clone https://github.com/guardicore/monkey.git
   2.2 Copy or symlink the files from the repo to your install folder
       sudo cp ~/monkey/monkey/ /var/monkey/ -r
OR     sudo ln -s ~/monkey/monkey/ /var/monkey
   2.3 sudo chmod 777 /var/monkey/ -R

3. Create the following directory:
    mkdir -p /var/monkey/monkey_island/bin/mongodb
    mkdir -p /var/monkey/monkey_island/db

4. Install the packages from monkey_island/requirements.txt:
    sudo python -m pip install -r /var/monkey/monkey_island/requirements.txt
	Make sure the server is running Python 2.7 and not Python 3+.
	
5. put monkey binaries in /var/monkey/monkey_island/cc/binaries
    monkey-linux-64 - monkey binary for linux 64bit
	monkey-linux-32 - monkey binary for linux 32bit
	monkey-windows-32.exe - monkey binary for windows 32bit
	monkey-windows-64.exe - monkey binary for windows 64bi

6. Setup MongoDB (Use one of the two following options):

        6.1 Download MongoDB and extract it to /var/monkey_island/bin/mongodb
                for cent/rhel 64 - https://downloads.mongodb.org/linux/mongodb-linux-x86_64-rhel70-latest.tgz
               
                find more at - https://www.mongodb.org/downloads#production
                untar.gz with: tar -zxvf mongodb*.tgz -C /var/monkey/monkey_island/bin/mongodb --strip-components=1
                (make sure the content of the mongo folder is in this directory, meaning this path exists:
                        /var/monkey/monkey_island/bin/mongodb/bin)
        
        OR

        6.1 If you have an instance of mongodb running on a different host, set the MONKEY_MONGO_URL environment variable:

            example for mongodb running on host with IP address 192.168.10.10:

                set MONKEY_MONGO_URL="mongodb://192.168.10.10:27107/monkeyisland"


7. Generate SSL Certificate
    /var/monkey/monkey_island/linux/create_certificate.sh

8. Install npm
	8.1. Download and install from: https://www.npmjs.com/get-npm
	
9. Build Monkey Island frontend
	9.1. cd to '/var/monkey/monkey_island/cc/ui'
	9.2. run 'npm update'
	9.3. run 'npm run dist'
	
10. Add firewall rules
   10.1 sudo firewall-cmd --zone=public --add-port=5000/tcp --permanent
   10.2 sudo firewall-cmd --reload

How to run:
/var/monkey/monkey_island/linux/run.sh

How to Install as a Daemon:
    sudo cp /var/monkey/monkey_island/linux/rhel/systemd/*.service /lib/systemd/system/

Enable boot start with the following commands
    sudo systemctl daemon-reload
    sudo systemctl enable monkey-mongo.service
    sudo systemctl enable monkey-island.service 