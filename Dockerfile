ARG BASE_TAG=7
FROM centos:${BASE_TAG}

RUN yum -y update \
    && yum -y groupinstall 'Development Tools' \
    && yum -y install \
        cmake \
        git \
    && yum clean all && rm -rf /var/cache/yum \
    && echo $'#!/bin/bash\n\
set -e\n\
exec "$@"\n\
' >/usr/bin/entrypoint.sh \
    && chmod u+x /usr/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
