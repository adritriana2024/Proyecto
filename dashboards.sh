#!/bin/bash

mkdir -p dashboards_grafana
cd dashboards_grafana || exit

# Función para descargar y verificar
descargar_dashboard() {
  local url=$1
  local nombre=$2

  echo "Descargando $nombre..."
  wget -q "$url" -O "$nombre"

  if [[ -s "$nombre" ]]; then
    echo "$nombre descargado correctamente ✅"
  else
    echo "❌ ERROR: $nombre está vacío o no se pudo descargar"
    rm -f "$nombre"
  fi
}

# Node Exporter
descargar_dashboard "https://grafana.com/api/dashboards/1860/revisions/30/download" "node_exporter.json"

# Apache Exporter
descargar_dashboard "https://grafana.com/api/dashboards/3894/revisions/1/download" "apache_exporter.json"

# LDAP Exporter
descargar_dashboard "https://grafana.com/api/dashboards/15021/revisions/1/download" "ldap_exporter.json"

echo "Proceso completado. Archivos descargados en: $(pwd)"
