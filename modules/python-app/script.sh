
sudo docker build -f modules/python-app/Dockerfile -t somename:stable modules/python-app/
sudo docker image tag somename:stable ghcr.io/notlgbt/optimalcitytask:stable 


sudo echo $GITHUB_TOKEN | sudo docker login ghcr.io -u NotLGBT --password-stdin


sudo docker push ghcr.io/notlgbt/optimalcitytask:stable
