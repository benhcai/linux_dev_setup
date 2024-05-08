# Constants
# Colors https://en.wikipedia.org/wiki/ANSI_escape_code
export RED='\033[0;91m'
export GREEN='\033[0;92m'
export ORANGE='\033[0;93m'
export BLUE='\033[0;94m'
export PURPLE='\033[0;95m'
export CYAN='\033[0;96m'
export BROWN='\033[0;33m'
export TEAL='\033[0;36m'
export NC='\033[0m'

function printC {
    local COLOR=$1
    local STR=$2
    echo -ne $COLOR$STR$NC 
}

for i in {0..200}
do
    C="\033[0;${i}m"
    STR="$i hello all \n"
    echo -ne $C$STR$NC 
done