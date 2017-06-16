docker-java7
============

Base CentOS 7 with IBM JDK 7 and Maven 3.5.0.

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
    java version "1.7.0"
    Java(TM) SE Runtime Environment (build pxa6470_27sr4fp5-20170421_02(SR4 FP5))
    IBM J9 VM (build 2.7, JRE 1.7.0 Linux amd64-64 Compressed References 20170406_343211 (JIT enabled, AOT enabled)
    J9VM - R27_Java727_SR4_20170406_2107_B343211
    JIT  - tr.r13.java_20170406_343211
    GC   - R27_Java727_SR4_20170406_2107_B343211_CMPRSS
    J9CL - 20170406_343211)
    JCL - 20170420_01 based on Oracle jdk7u141-b11


