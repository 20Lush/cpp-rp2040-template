
SCRIPT_DIR="$PWD"
BUILD_DIR="${SCRIPT_DIR}/../build"

BINARY="default_name"
BINARY_DIR="${BUILD_DIR}/executable"

# Handle command line arguments
while getopts 'd:b:' opt; do
    case "$opt" in
        d)
            BINARY_DIR="$OPTARG"
            ;;
        b)
            BINARY="$OPTARG"
            ;;
        :)
            echo -e "Option flag required when passing in an argument. Stop."
            exit 1
            ;;
    esac
done

UF2_BIN_DIR="${BINARY_DIR}/${BINARY}.uf2"
picotool load ${UF2_BIN_DIR} -f