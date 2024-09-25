cd /home/radamuz/repos/general/my-helm-charts/filestash


# Define el archivo y la línea a buscar
archivo="Chart.yaml"
linea_a_buscar="version:"

# Busca la línea que contiene "version:"
version_line=$(grep "$linea_a_buscar" "$archivo")

# Extrae la versión usando cut para tomar la segunda parte (después de "version:")
version=$(echo "$version_line" | cut -d ' ' -f 2)

# Separa la versión en tres partes usando IFS (Internal Field Separator)
IFS='.' read -r major minor patch <<< "$version"

antigua_version="$major.$minor.$patch"

# Incrementa el tercer valor (patch)
patch=$((patch + 1))

# Construye la nueva versión
nueva_version="$major.$minor.$patch"

# Muestra la nueva versión
echo "La nueva versión es: $nueva_version"

sed -i "s/$antigua_version/$nueva_version/" "$archivo"

# Define el archivo y la línea a buscar
archivo="README.md"
linea_a_buscar="\-\-version"

# Busca la línea que contiene "--version"
version_line=$(grep "$linea_a_buscar" "$archivo")

# Extrae la versión usando cut para tomar la segunda parte (después de "version:")
version=$(echo "$version_line" | cut -d '"' -f 2 )

# Separa la versión en tres partes usando IFS (Internal Field Separator)
IFS='.' read -r major minor patch <<< "$version"

antigua_version="$major.$minor.$patch"

# Incrementa el tercer valor (patch)
patch=$((patch + 1))

# Construye la nueva versión
nueva_version="$major.$minor.$patch"

# Muestra la nueva versión
echo "La nueva versión es: $nueva_version"

sed -i "s/$antigua_version/$nueva_version/" "$archivo"



cd /home/radamuz/repos/general/my-helm-charts

cd releases
helm package ../filestash
cd ..

helm repo index .

git add .

git commit -m "Update"

git push --all