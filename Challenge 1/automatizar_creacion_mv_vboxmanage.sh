#!/bin/bash

# Verificar que se recibieron los argumentos necesarios
if [ "$#" -ne 8 ]; then # -ne -> not equal (numerically)
    # $0 -> nombre del archivo .sh (primer argumento recibido)
    echo "Uso: $0 <nombre_vm> <tipo_so> <num_cpus> <memoria_ram_gb> <vram_mb> <tamaño_disco_gb> <nombre_sata> <nombre_ide>"
    echo "Faltan argumentos"
    exit 1
fi

# Asignar argumentos a variables
NOMBRE_VM=$1
TIPO_SO=$2
NUM_CPUS=$3
MEMORIA_RAM=$(( $4 * 1024 )) # Convertir GB a MB
VRAM=$5
TAMANO_DISCO=$(( $6 * 1024 )) # Convertir GB a MB
NOMBRE_SATA=$7
NOMBRE_IDE=$8

# Crear la máquina virtual
VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_SO" --register || echo "Error al crear la mv"

# Configurar la máquina virtual
# modifywv: enables you to change the properties of a registered VM that is not running
VBoxManage modifyvm "$NOMBRE_VM" --cpus "$NUM_CPUS" --memory "$MEMORIA_RAM" --vram "$VRAM" || echo "Error en modifywv"

# Crear el disco duro virtual
VBoxManage createhd --filename "$NOMBRE_VM.vdi" --size "$TAMANO_DISCO" || echo "Error al crear el disco duro virtual"

# Crear un controlador SATA y asociarlo al disco duro
VBoxManage storagectl "$NOMBRE_VM" --name "$NOMBRE_SATA" --add sata --controller IntelAhci || echo "Error al crear el controlador SATA"
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$NOMBRE_SATA" --port 0 --device 0 --type hdd --medium "$NOMBRE_VM.vdi" || echo "Error al asociar el controlador SATA al disco duro"

# Crear un controlador IDE para el CD/DVD
VBoxManage storagectl "$NOMBRE_VM" --name "$NOMBRE_IDE" --add ide || echo "Error al crear el controlador IDE"
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$NOMBRE_IDE" --port 0 --device 0 --type dvddrive --medium emptydrive || echo "Error al asociar el controlador IDE"

# Imprimir la configuración de la máquina virtual
VBoxManage showvminfo "$NOMBRE_VM"

echo "Máquina virtual '$NOMBRE_VM' creada y configurada con éxito."
