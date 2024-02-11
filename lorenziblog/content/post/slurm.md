---
title: "A clean installation of SLURM scheduler"
date: 2024-02-11T16:12:36+01:00
draft: false
---
## Desired topology and active services
![topology](../../images/slurm/SLURM.jpg)

## SLURM super quick start guide 
The guide is available [here](https://slurm.schedmd.com/quickstart_admin.html).

On Centos8Stream, we first install MUNGE, then install SLURM by the bzip package.
Status of munge can be probed by 
```
munge -n | unmunge
```
Installing the SLURM package is done manually
```
wget https://download.schedmd.com/slurm/slurm-23.11.3.tar.bz2
```
We then unzip, configure, and build SLURM

We then need to create, by the SLURM user "slurm", the directories of 
- [x] log files
- [ ] PID files
- [x] State save 

and make them writable. We take inspiration from an existing ```slurm.conf``` file.
So the directories will be 
| Function          | Directory            |
|-------------------|----------------------|
| PID files         | ---                  |
| SlurmdSpoolDir    | /var/spool/slurmd    |
| StateSaveLocation | /var/spool/slurmctld |


Beware, ```slurm``` is not in the sudoers group (and it must not be!).
If the directories are already there, we must ```chown``` them, and ```chmod``` them to writable by ```slurm```.
This can be done only by a sudoer. 

In order to use the SLURM API, we must link to the libraries
```
ldconfig -n <library-location>
```
in our case ```<library-location>``` is in the downloaded (and built) package.

## A handy alternative: RPM
We can use  ```rpmbuild``` to directly install and configure the directories and link the libraries.
We do it in the ```slurm``` user.

This method show a missing dependency
```
error: Failed build dependencies:
	mariadb-devel >= 5.0.0 is needed by slurm-23.11.3-1.el8.x86_64
```
that we can easily solve by 
```
sudo yum install mariadb-devel  
```

A warning in the ```rpmbuild``` suggest to run ```libtool --finish /lib64/security```. We do it, installing ```libtool``` first
> We still have the problem that the commands are not available.
> The SLURM services are not available.

The RPM files are loacated into 
```
~/rpmbuild/RPMS
```
so we need to run 
```
rpm -i *.rpm
```
inside the rpms folder.

## slurm.conf 
We use the generator tool to make the ```slurm.conf``` file 

We can now enable the daemons
```
systemctl enable slurmctld
systemctl enable slurmdbd
systemctl enable slurmd 
```
and activate them
```
systemctl start slurmctld
systemctl start slurmdbd
systemctl start slurmd 
```
The order is important!
> We have a problem in starting the ```slurmdbd``` service:
> ```Condition: start condition failed at Sun 2024-02-11 17:10:08 CET; 8min ago```
> ```          └─ ConditionPathExists=/etc/slurm/slurmdbd.conf was not met```
This is due to 
> ```slurmdbd: error: s_p_parse_file: unable to read "/etc/slurm/slurmdbd.conf": Permission denied```

Also, we got error
```
Feb 11 17:26:11 slurph.novalocal slurmdbd[7414]: slurmdbd: error: mysql_real_connect failed: 2002 Can't connect to local MySQL server through socket '/var/lib/mys>
```

Seems like we have problems with the installation of MariaDB.
Lets run
```
 sudo dnf install mariadb-server 
```
Finally we are able to start the service 
```
systemctl start mariadb.service
```

## Who is running SLURM?
Running
```
slurmdbd -Dvvv
```
We get errors like 
```
slurmdbd.conf owned by 1000 not SlurmUser(1003)
```

Seems like we have problems in read from ```/var/run/<PID files>```
One can [generate a folder inside ```/var/run``` and chown it](https://serverfault.com/questions/159334/what-permissions-are-needed-to-write-a-pid-file-in-var-run), but since ```/var/run``` is ```tmpfs``` it will go after a system reboot.
The solution seems to be to run a ```mkdir + chown``` script at startup. This is to be implemented.
The script looks like (```/home/centos/startup_pid.sh```)
```
#! /bin/bash
mkdir /var/run/slurm
chown slurm /var/run/slurm

```
Still we have problems in connecting to the database. This is a problem also on the startup of ```slurmd.service```.
Obviously, we lack a [DB configuration](https://wiki.fysik.dtu.dk/Niflheim_system/Slurm_installation/).
## Database configuration
We follow commands from the previous link.

## Unable to determine this slurmd's nodename
This problem is related to the impossibility to detect ```runner01```.
Before running the ```slurmd``` daemon, we need to setup the computing nodes.
Now our ```slurmctld``` and ```slurmdbd``` are running.

## Configuraiton of the computing node(s)
Follow instruction from [youtube](https://www.youtube.com/watch?v=Fm5RIE3NSN8&t=322s&pp=ygULc2x1cm0gbXVuZ2U%3D).

## Useful resources for SLURM management
 - [SLURM cheatsheet](https://www.carc.usc.edu/user-information/user-guides/hpc-basics/slurm-cheatsheet)
 - [SLURM config file generator](https://slurm.schedmd.com/configurator.html)
### Other installation guides 
 - [@DISI_computational_pharmacology](https://wiki.docking.org/index.php/Slurm_Installation_Guide)
 - [@niflheim](https://wiki.fysik.dtu.dk/Niflheim_system/Slurm_installation/)