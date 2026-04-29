#!/bin/bash

echo "🚀 AUTO SETUP INICIANDO..."

# 1. Instalar git
if ! command -v git &> /dev/null
then
    echo "📦 Instalando git..."
    sudo dnf install git -y
fi

# 2. Configurar usuario
read -p "👤 Nombre: " nombre
read -p "📧 Email: " email

git config --global user.name "$nombre"
git config --global user.email "$email"

# 3. Generar SSH
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "🔐 Generando clave SSH..."
    ssh-keygen -t ed25519 -C "$email" -N "" -f ~/.ssh/id_ed25519
fi

# 4. Mostrar clave
echo ""
echo "📋 COPIA ESTA CLAVE EN GITHUB:"
echo "--------------------------------"
cat ~/.ssh/id_ed25519.pub
echo "--------------------------------"

echo "👉 Ve a GitHub → Settings → SSH Keys"
read -p "Presiona ENTER cuando termines..."

# 5. Test conexión
ssh -T git@github.com

# 6. Clonar repo
REPO="git@github.com:santiagobtos/mi-proyecto.git"

if [ ! -d "mi-proyecto" ]; then
    git clone $REPO
fi

cd mi-proyecto

# 7. Mostrar ayuda
echo ""
echo "📚 COMANDOS CLAVE:"
echo "--------------------------------"
echo "cd ..              → subir carpeta"
echo "ls                 → listar"
echo "touch archivo      → crear archivo"
echo "rm archivo         → borrar"
echo "chmod +x archivo   → ejecutable"
echo "./archivo          → ejecutar"
echo "git pull           → actualizar"
echo "git push           → subir"
echo "--------------------------------"

echo "✅ SETUP COMPLETO"
echo ""
echo "📚 COMANDOS BÁSICOS DE LINUX"
echo "----------------------------------"

echo "📁 Navegación:"
echo "pwd                → mostrar ruta actual"
echo "ls                 → listar archivos"
echo "cd carpeta         → entrar a carpeta"
echo "cd ..              → subir un nivel"

echo ""
echo "📄 Archivos:"
echo "touch archivo.txt  → crear archivo"
echo "nano archivo       → editar archivo"
echo "vim archivo        → editar con vim"
echo "cat archivo        → ver contenido"

echo ""
echo "🗑️ Borrar:"
echo "rm archivo         → borrar archivo"
echo "rm -r carpeta      → borrar carpeta"

echo ""
echo "📦 Copiar y mover:"
echo "cp a.txt b.txt     → copiar archivo"
echo "cp -r dir1 dir2    → copiar carpeta"
echo "mv a.txt carpeta/  → mover archivo"

echo ""
echo "⚙️ Permisos:"
echo "chmod +x archivo   → hacer ejecutable"
echo "./archivo          → ejecutar archivo"

echo ""
echo "🌐 Git:"
echo "git clone URL      → clonar repo"
echo "git pull           → actualizar"
echo "git add .          → preparar cambios"
echo "git commit -m ''   → guardar cambios"
echo "git push           → subir cambios"

echo "----------------------------------"
