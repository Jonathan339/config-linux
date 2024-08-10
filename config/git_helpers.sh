# git_helpers.sh

# Función para cambiar o crear una rama con colores y estilos
git_switch() {
  local branch_name=$1

  # Colores
  RED="\033[31m"
  GREEN="\033[32m"
  YELLOW="\033[33m"
  RESET="\033[0m"
  BOLD="\033[1m"

  # Verificar si el nombre de la rama ha sido proporcionado
  if [ -z "$branch_name" ]; then
    echo -e "${RED}${BOLD}Por favor, proporciona el nombre de la rama.${RESET}"
    return 1
  fi

  # Verificar si la rama ya existe
  if git rev-parse --verify $branch_name >/dev/null 2>&1; then
    echo -e "${YELLOW}${BOLD}La rama '${branch_name}' ya existe. Cambiando a ella...${RESET}"
    git switch $branch_name
  else
    echo -e "${GREEN}${BOLD}La rama '${branch_name}' no existe. Creando y cambiando a ella...${RESET}"
    git switch -c $branch_name
  fi
}
