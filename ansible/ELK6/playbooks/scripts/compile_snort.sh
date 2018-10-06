#!/bin/sh
( cd $HOME && wget https://snort.org/downloads/snort/snort-${snort_version}.tar.gz && tar zxvpf snort-${snort_version}.tar.gz && (cd snort-${snort_version} && ./configure --enable-sourcefire && make && make install) && rm -r snort-${snort_version} snort-${snort_version}.tar.gz )
