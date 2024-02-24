# Constants
# Colors https://en.wikipedia.org/wiki/ANSI_escape_code
export GREEN='\033[0;92m'
export BLUE='\033[0;94m'
export CYAN='\033[0;96m'
export RED='\033[0;91m'
export NC='\033[0m'

function printC {
    local STR=$1
    local COLOR=$2
    echo -ne $COLOR$STR$NC 
}
