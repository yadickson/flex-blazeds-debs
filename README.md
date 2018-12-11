# Debian Package for Apache Flex BlazeDS Project

[![TravisCI Status][travis-image]][travis-url]

**Build dependencies**

- debhelper (>= 9)
- cdbs
- default-jdk
- maven-debian-helper (>= 1.5)
- libactivemq-java (>= 5.6.0)
- libapache-pom-java (>= 10)
- libcommons-httpclient-java
- libgeronimo-jms-1.1-spec-java
- libjgroups-java
- libxalan2-java
- libactivemq-protobuf-java
- libosgi-core-java

**wheezy and jessie**
- libservlet2.5-java

**stretch**
- libservlet3.1-java

**Download source code**

- unzip
- wget
- libc-bin
- dos2unix 

```
$ debian/rules get-orig-source
$ debian/rules publish-source
```

**Build project**

```
$ dpkg-buildpackage -rfakeroot -D -us -uc -i -I -sa
```
or
```
$ QUILT_PATCHES=debian/patches quilt push -a
$ fakeroot debian/rules clean binary
```

**Tested**

- Debian wheezy
- Debian jessie
- Debian stretch

**Repositories**

[Debian repository](https://bintray.com/yadickson/debian)

```
$ echo "deb [trusted=true] https://dl.bintray.com/yadickson/debian [distribution] main" | sudo tee -a /etc/apt/sources.list.d/bintray.list
$ sudo apt-get update
$ sudo apt-get upgrade -y
$ sudo apt-get install libflex-java
```

## License

GPL-3.0 © [Yadickson Soto](https://github.com/yadickson)

Apache-2.0 © [Apache Flex BlazeDS](http://flex.apache.org/)

[travis-image]: https://api.travis-ci.org/yadickson/flex-debs.svg?branch=stretch
[travis-url]: https://travis-ci.org/yadickson/flex-debs

