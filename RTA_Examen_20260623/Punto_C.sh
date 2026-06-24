cd ~/RTA_Examen_20260623/docker_parcial
sudo docker build -t web-miranda .
sudo docker run -d -p 8080:80 --name contenedor_web web-miranda
