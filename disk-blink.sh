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

# Blink disk in enclosure. Require a SAS3008 HBA and compatible enclosure

PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin

if [ $# -eq 0 ]; then
	echo "blink disk in enclosure"
	echo "$0 serial"

fi

PATTERN=$1
DISKLIST=`dirname $0`/disklist.pl

LOCATION=`${DISKLIST} -all | grep SAS3008 | grep -i $PATTERN | sed -e 's/.*SAS3008(\(.*\)):\(.*\)#\(.*\).*/\1@\2:\3/' `

echo "LOCATION=$LOCATION"

# convert to array
arrIN=(${LOCATION//@/ })
CTRL=${arrIN[0]}
SLOT=${arrIN[1]}
#echo "CTRL=$CTRL"
#echo "SLOT=$SLOT"

sas3ircu $CTRL LOCATE $SLOT ON | grep SAS3IRCU
