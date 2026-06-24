if [ $# -ne 2 ]; then
    echo "Error: Se requieren 2 parametros. Uso: $0 <Archivo_Lista> <Usuario_Origen_Clave>"
    exit 1
fi
ARCH_LISTA=$1
USER_CLAVE=$2
PASSWORD_HASH=$(sudo grep "^${USER_CLAVE}:" /etc/shadow | cut -d: -f2)
while IFS="," read -r USUARIO GRUPO HOME_DIR || [ -n "$USUARIO" ]; do
    [[ -z "$USUARIO" || "$USUARIO" =~ ^# ]] && continue
    USUARIO=$(echo "$USUARIO" | xargs)
    GRUPO=$(echo "$GRUPO" | xargs)
    HOME_DIR=$(echo "$HOME_DIR" | xargs)
    if ! grep -q "^${GRUPO}:" /etc/group; then
        sudo groupadd "$GRUPO"
    fi
    if ! id "$USUARIO" &>/dev/null; then
        sudo useradd -m -g "$GRUPO" -d "$HOME_DIR" -s /bin/bash -p "$PASSWORD_HASH" "$USUARIO"
        echo "Usuario $USUARIO creado con exito."
    else
        echo "El usuario $USUARIO ya existe."
    fi
done < "$ARCH_LISTA"
