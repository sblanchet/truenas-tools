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

# Print disk temperature on TrueNAS

PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin

echo "HDD temp :"
for i in $(sysctl -n kern.disks) ; do
        DevTemp=`smartctl -a /dev/$i | awk '/Temperature_Celsius/{print
$0}' | awk '{print $10 "C"}'`
        DevSerNum=`smartctl -a /dev/$i | awk '/Serial Number:/{print
$0}' | awk '{print $3}'`
        DevName=`smartctl -a /dev/$i | awk '/Device Model:/{print $0}' |
awk '{print $3}'`
        echo $i $DevTemp $DevSerNum $DevName
done
