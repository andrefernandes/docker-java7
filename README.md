docker-java7
============

Base CentOS 7 with Oracle JDK 7 and Maven 3.2.3.

This is just a plain JDK 7 image that can be used for Java
development. Works well for Java + Maven shops
and as a base for Java-based images.

### Useful scripts

* **build.sh** : builds the image locally (docker build)
* **runbash.sh** : convenient way to run commands on a new
container (fast-food, auto-destroy) or even to just
open a bash shell to play.

#### Some nice tests:

Open bash:

    ./runbash.sh
    bash-4.2# echo Wheeee

Show Java version:

    ./runbash.sh java -version
    java version "1.7.0_67"
    Java(TM) SE Runtime Environment (build 1.7.0_67-b01)
    Java HotSpot(TM) 64-Bit Server VM (build 24.65-b04, mixed mode)
    


