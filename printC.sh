# Constants
export GREEN='\033[0;32m'
export BLUE='\033[0;94m'
export CYAN='\033[0;36m'
export NC='\033[0m'

function printC {
    local STR=$1
    local COLOR=$2
    echo -ne $COLOR$STR$NC 
}
