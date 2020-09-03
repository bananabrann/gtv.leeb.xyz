# NOTE
# I think Webpack might actually be able to do what I'm 
# trying to do here...

echo "Creating files..."
mkdir -p ./dist/img

echo "Copying ./src/index.html into dist/ ..."
cp ./src/index.html dist

echo "Copying images into ./img/ ..."
cp -r ./src/img/ dist/

echo "Done"