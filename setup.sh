#!/bin/bash

echo "📦 Clonando repositorio..."

REPO="git@github.com:santiagobtos/mi-proyecto.git"

if [ ! -d "mi-proyecto" ]; then
    git clone $REPO
else
    echo "El repositorio ya existe, actualizando..."
    cd mi-proyecto && git pull && cd ..
fi

echo ""
echo "✅ Listo"
echo ""
echo "📚 Comandos disponibles:"
echo "----------------------------------"
echo "1. cd mi-proyecto     → entrar al proyecto"
echo "2. git pull           → actualizar cambios"
echo "3. git add .          → agregar cambios"
echo "4. git commit -m ''   → guardar cambios"
echo "5. git push           → subir cambios"
echo "----------------------------------"

