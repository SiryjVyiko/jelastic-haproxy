#!/bin/bash

function _setPassword() {
  sed -i 's/stats auth/stats auth 'J_OPENSHIFT_APP_ADM_USER':'J_OPENSHIFT_APP_ADM_PASSWORD' /g' ;
}