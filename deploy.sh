echo -e "\e[32mSaving current theme..."
cd ./themes/toxic 
git add . && git commit -m "save" && git push origin HEAD:dev

echo -e "\e[32mSaving current blog..."
cd ../..
git add . && git commit -m "save" && git push
