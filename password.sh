#!/bin/bash
# Not remember where get this script but works very well
#
genpass() {
# This function generates Strong or Very Strong password.
	local len=${1:-18}
	
	head -n 100 /dev/urandom | strings | \
	sed -n '
		H;
		${
			x;
			s/[^a-z0-9_.#@%-]//ig;			# leave only alphanumerics, _, @, &, *, +, %, =, ~, . and /
			s/\([a-z]\)[a-z]*/\1/ig;		# no sequential letters together
			s/\([0-9]\)[0-9]*/\1/g;			# same for numbers
			p
		}' | cut -c1-$len
}
genpass
