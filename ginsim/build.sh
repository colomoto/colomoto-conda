
# put GINsim jar in conda's opt folder and the launcher in bin
mkdir -p "$PREFIX/opt"
cp "${SRC_DIR}/GINsim-${PKG_VERSION}-SNAPSHOT-jar-with-dependencies.jar" "$PREFIX/opt/GINsim.jar"

mkdir -p "$PREFIX/bin"
cp "${RECIPE_DIR}/GINsim" "${RECIPE_DIR}/bioLQM" "$PREFIX/bin/"

