./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source ~/.bashrc
CARPETA_RTA=~/RTA_Examen_20260623
REPO_EXAMEN=~/UTN-FRA_SO_Examenes
mkdir -p $CARPETA_RTA
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git 2>/dev/null
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source ~/.bashrc
source ~/.bashrc && history -a
lsbk
lsblk
sudo pvcreate -f /dev/sdc /dev/sdd
sudo vgcreate vg_datos /dev/sdc
sudo vgcreate vg_temp /dev/sdd
sudo lvcreate -L 1500M -n lv_workareas vg_datos
sudo lvcreate -l +100%FREE -n lv_docker vg_datos
sudo lvcreate -L 512M -n lv_swap vg_temp
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo mkdir -p /var/lib/docker/
sudo mkdir -p /work/
sudo sed -i '/vg_datos\|vg_temp/d' /etc/fstab
echo "/dev/mapper/vg_datos-lv_docker /var/lib/docker/ ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/mapper/vg_datos-lv_workareas /work/ ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/mapper/vg_temp-lv_swap swap swap defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
sudo swapon -a
sudo systemctl restart docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl enable --now docker
sudo usermod -a -G docker vagrant
sudo mount -a
sudo systemctl restart docker
sudo systemctl status docker
CARPETA_RTA=~/RTA_Examen_20260623
REPO_EXAMEN=~/UTN-FRA_SO_Examenes
cat << 'EOF' > $CARPETA_RTA/MirandaAltaUser-Groups.sh


APELLIDO="Miranda"
cat << 'EOF' > $CARPETA_RTA/${Miranda}AltaUser-Groups.sh
touch ~/RTA_Examen_20260623/MirandaAltaUser-Groups.sh
touch ~/RTA_Examen_20260623/Punto_B.sh
cat << 'CERRAR_SCRIPT' > ~/RTA_Examen_20260623/MirandaAltaUser-Groups.sh
cat << 'CERRAR_LANZADOR' > ~/RTA_Examen_20260623/Punto_B.sh
~/RTA_Examen_20260623/MirandaAltaUser-Groups.sh $1 $2
CERRAR_LANZADOR

chmod +x ~/RTA_Examen_20260623/MirandaAltaUser-Groups.sh
chmod +x ~/RTA_Examen_20260623/Punto_B.sh
~/RTA_Examen_20260623/Punto_B.sh ~/UTN-FRA_SO_Examenes/202406/Lista_Usuarios.txt vagrant
CARPETA_RTA=~/RTA_Examen_20260623
mkdir -p $CARPETA_RTA/docker_parcial
cd $CARPETA_RTA/docker_parcial
cat << 'CERRAR_HTML' > index.html
<h1>Parcial de Arquitectura y Sistemas Operativos - UTN FRA</h1>
<p><b>Alumno:</b> Miranda</p>
<p><b>División:</b> 2do TP 2026</p>
CERRAR_HTML

cat << 'CERRAR_DOCKER' > Dockerfile
FROM httpd:latest
COPY index.html /usr/local/apache2/htdocs/
CERRAR_DOCKER

cat << 'CERRAR_SCRIPT_C' > $CARPETA_RTA/Punto_C.sh
cd ~/RTA_Examen_20260623/docker_parcial
docker build -t web-miranda .
docker run -d -p 8080:80 --name contenedor_web web-miranda
CERRAR_SCRIPT_Cc
CERRAR_SClPT_C
CERRAR_SCRIPT_C

chmod +x $CARPETA_RTA/Punto_C.sh
$CARPETA_RTA/Punto_C.sh
mkdir -p ~/RTA_Examen_20260623/docker_parcial
cd ~/RTA_Examen_20260623/docker_parcial
cat << 'FIN_HTML' > index.html
<h1>Parcial de Arquitectura y Sistemas Operativos - UTN FRA</h1>
<p><b>Alumno:</b> Miranda</p>
<p><b>Division:</b> 2do TP 2026</p>
FIN_HTML

cat << 'FIN_DOCKER' > Dockerfile
FROM httpd:latest
COPY index.html /usr/local/apache2/htdocs/
FIN_DOCKER

cat << 'FIN_SCRIPT' > ~/RTA_Examen_20260623/Punto_C.sh
cd ~/RTA_Examen_20260623/docker_parcial
docker build -t web-miranda .
docker run -d -p 8080:80 --name contenedor_web web-miranda
FIN_SCRIPT

chmod +x ~/RTA_Examen_20260623/Punto_C.sh
~/RTA_Examen_20260623/Punto_C.sh
mkdir -p ~/RTA_Examen_20260623/docker_parcial && cd ~/RTA_Examen_20260623/docker_parcial
echo "<h1>Parcial de Arquitectura y Sistemas Operativos - UTN FRA</h1><p><b>Alumno:</b> Miranda</p><p><b>Division:</b> 2do TP 2026</p>" > index.html
echo -e "FROM httpd:latest\nCOPY index.html /usr/local/apache2/htdocs/" > Dockerfile
chmod +x ~/RTA_Examen_20260623/Punto_C.sh
~/RTA_Examen_20260623/Punto_C.sh
echo -e '#!/bin/bash\ncd ~/RTA_Examen_20260623/docker_parcial\nsudo docker build -t web-miranda .\nsudo docker run -d -p 8080:80 --name contenedor_web web-miranda' > ~/RTA_Examen_20260623/Punto_C.sh && chmod +x ~/RTA_Examen_20260623/Punto_C.sh && ~/RTA_Examen_20260623/Punto_C.sh
cd ~/UTN-FRA_SO_Examenes/202406/ansible
cat << 'CERRAR_ANSIBLE' > roles/2do_parcial/tasks/main.yml
rm -f ~/RTA_Examen_20260623/Punto_C.sh
cat << 'FIN_C' > ~/RTA_Examen_20260623/Punto_C.sh
cd ~/RTA_Examen_20260623/docker_parcial
sudo docker build -t web-miranda .
sudo docker run -d -p 8080:80 --name contenedor_web web-miranda
FIN_C

chmod +x ~/RTA_Examen_20260623/Punto_C.sh
~/RTA_Examen_20260623/Punto_C.sh
cat << 'CERRAR_ANSIBLE' > roles/2do_parcial/tasks/main.yml
- name: Crear directorios del parcial
  file:
    path: "{{ item }}"
    state: directory
    mode: '0755'
  with_items:
    - /tmp/2do_parcial/alumno
    - /tmp/2do_parcial/equipo
- name: Generar datos_alumno.txt desde template
  template:
    src: datos_alumno.j2
    dest: /tmp/2do_parcial/alumno/datos_alumno.txt
- name: Generar datos_equipo.txt desde template
  template:
    src: datos_equipo.j2
    dest: /tmp/2do_parcial/equipo/datos_equipo.txt
- name: Configurar sudoers para 2PSupervisores
  copy:
    content: "%2PSupervisores ALL=(ALL) NOPASSWD: ALL"
    dest: /etc/sudoers.d/2psupervisores
    validate: /usr/sbin/visudo -cf %s
CERRAR_ANSIBLE

echo -e "Nombre: Miranda Apellido: Miranda\nDivision: 2do TP 2026" > roles/2do_parcial/templates/datos_alumno.j2
mkdir -p roles/2do_parcial/templates
echo -e "Nombre: Miranda Apellido: Miranda\nDivision: 2do TP 2026" > roles/2do_parcial/templates/datos_alumno.j2
echo -e "IP: {{ ansible_default_ipv4.address }}\nDistribucion: {{ ansible_distribution }}\nCantidad de Cores: {{ ansible_processor_vcpus }}" > roles/2do_parcial/templates/datos_equipo.j2
echo -e '#!/bin/bash\ncd ~/UTN-FRA_SO_Examenes/202406/ansible\nansible-playbook -i hosts playbook.yml' > ~/RTA_Examen_20260623/Punto_D.sh
chmod +x ~/RTA_Examen_20260623/Punto_D.sh
~/RTA_Examen_20260623/Punto_D.sh
echo -e '#!/bin/bash\ncd ~/UTN-FRA_SO_Examenes/202406/ansible\nansible-playbook -i hosts playbook.yml' > ~/RTA_Examen_20260623/Punto_D.sh
chmod +x ~/RTA_Examen_20260623/Punto_D.sh
~/RTA_Examen_20260623/Punto_D.sh
sudo apt update && sudo apt install -y ansible
cat << 'FIN_PUNTO_D' > ~/RTA_Examen_20260623/Punto_D.sh
cd ~/UTN-FRA_SO_Examenes/202406/ansible
ansible-playbook -i hosts playbook.yml
FIN_PUNTO_D

chmod +x ~/RTA_Examen_20260623/Punto_D.sh
~/RTA_Examen_20260623/Punto_D.sh
cat << 'FIN_PUNTO_D' > ~/RTA_Examen_20260623/Punto_D.sh
cd ~/UTN-FRA_SO_Examenes/202406/ansible
ansible-playbook -i "localhost," -c local playbook.yml
FIN_PUNTO_D

sudo ~/RTA_Examen_20260623/Punto_D.sh
cat << 'FIN_PUNTO_D' > /home/vagrant/RTA_Examen_20260623/Punto_D.sh
cd /home/vagrant/UTN-FRA_SO_Examenes/202406/ansible
ansible-playbook -i "localhost," -c local playbook.yml
FIN_PUNTO_D

cd /home/vagrant/UTNFRA_SO_2do_TP_Miranda
cd /home/vagrant/UTN-FRA_SO_Examenes
history -a
