cd /home/radamuz/repos/general/my-helm-charts

cd releases
helm package ../filestash
cd ..

helm repo index .

git add .

git commit -m "Update"