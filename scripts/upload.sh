
SCRIPT_DIR="$PWD"
BUILD_DIR="${SCRIPT_DIR}/../build"
ELF2UF_BIN_DIR="${BUILD_DIR}/elf2uf2/elf2uf2"

BINARY="default_name"
BINARY_DIR="${BUILD_DIR}/install/bin/"

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

${ELF2UF_BIN_DIR} "${BINARY_DIR}${BINARY}.elf" "${BINARY_DIR}${BINARY}.uf2"

UF2_BIN_DIR="${BINARY_DIR}${BINARY}.uf2"

picotool load ${UF2_BIN_DIR}