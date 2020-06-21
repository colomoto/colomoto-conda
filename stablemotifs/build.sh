mkdir -p "${PREFIX}/opt"
cp -r "${SRC_DIR}/dist" "${PREFIX}/opt/StableMotifs"
mkdir -p "${PREFIX}/bin"
cp "${RECIPE_DIR}/StableMotifs" "${PREFIX}/bin/"
