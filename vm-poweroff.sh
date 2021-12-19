#!/usr/local/bin/bash

#========================================================================
#    Copyright (C) 2021 Sébastien BLANCHET
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as published
#    by the Free Software Foundation, either version 3 of the License, or any
#    later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#==========================================================================

# poweroff (without waiting for guest OS) a virtual machine by name
# running on TrueNAS Core

PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin

if [ $# -eq 0 ] ; then
    echo "Syntax: `basename $0` vmname"
    exit 0
fi

# get VM name
VMNAME=$1

# get VM ID
ID=`midclt call vm.query |
     jq --raw-output '[.[] | { (.name): .id } ]' |
     grep "\"$VMNAME"\" |
     sed 's/.*\: \(.*\)/\1/'`

echo "Poweroff '$VMNAME': id=$ID"
midclt call vm.poweroff $ID
