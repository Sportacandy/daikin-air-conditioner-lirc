#!/bin/bash

cat << EOF
begin remote

  name  aircon
  flags RAW_CODES
  eps            30
  aeps          100

  gap         34899 

    begin raw_codes

EOF

for i in aircon-*.txt; do echo "      name `echo $i | cut -d- -f2-5 | sed -e s/.txt//`"; cat $i; echo ''; echo ''; done

cat << EOF
    end raw_codes

end remote
EOF
