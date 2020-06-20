if [ -n "${MACOSX_DEPLOYMENT_TARGET}" ]; then
    src="macOS/cabean"
else
    src="Windows&Linux/cabean"
fi
mkdir -p "${PREFIX}/bin"
cp -v "${SRC_DIR}/${src}" "${PREFIX}/bin/cabean"
