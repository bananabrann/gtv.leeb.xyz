echo "Creating files..."
mkdir -p ./dist/img

echo "Copying ./src/index.html into dist/ ..."
cp ./src/index.html dist

echo "Copying images into ./img/ ..."
cp -r ./src/img/ dist/

echo "Done"