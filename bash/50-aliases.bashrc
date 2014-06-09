#!/bin/bash

# ================================
# General aliases
# ================================
alias ll="ls -al"
alias grep='grep --colour=auto'


# ================================
# Aliases specific to GitHub repositories and associated tests
# ================================
alias repos="cd $REPOS"
alias examples="cd $REPOS/sonar-examples"
alias java-projects="cd $TESTS/Java/projects"
alias fake-project="cd $TESTS/Java/projects/fake-project-for-tests"

# ================================
# Aliases to our test VMs
# ================================
alias dory-vm="cd $VMS_REPO/instances/dorydb-latest"
alias nemo-vm="cd $VMS_REPO/instances/nemodb-latest"
alias mysql-vm="cd $VMS_REPO/instances/mysql-5.7"
alias pg-vm="cd $VMS_REPO/instances/postgresql-9.2"
alias oracle-vm="cd $VMS_REPO/instances/oracle-11g"
alias mssql-vm="cd $VMS_REPO/instances/mssql2008"
alias ie9-vm="cd $VMS_REPO/instances/ie9-win7"
alias ie10-vm="cd $VMS_REPO/instances/ie10-win7"
alias ie11-vm="cd $VMS_REPO/instances/ie11-win7"
