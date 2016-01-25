#!/bin/bash

source /etc/jelastic/environment

function _setPassword() {
  sed -i '/stats auth/d' /opt/repo/versions/$Version/conf/haproxy.conf;
  sed -i '/stats auth/d' /opt/repo/versions/$Version/haproxy.conf.default;
  sed -i "/stats enable/a stats auth ${J_OPENSHIFT_APP_ADM_USER}:${J_OPENSHIFT_APP_ADM_PASSWORD}" /opt/repo/versions/$Version/conf/haproxy.conf;
  sed -i "/stats enable/a stats auth ${J_OPENSHIFT_APP_ADM_USER}:${J_OPENSHIFT_APP_ADM_PASSWORD}" /opt/repo/versions/$Version/haproxy.conf.default;
  su - jelastic -c "${CARTRIDGE_HOME}/versions/$Version/bin/haproxy -D -f ${CARTRIDGE_HOME}/versions/$Version/conf/haproxy.conf -p ${CARTRIDGE_HOME}/run/haproxy.pid -sf $(cat ${CARTRIDGE_HOME}/run/haproxy.pid)";
  return $?;
}
