#!/bin/bash

# Скрипт создает новый репозиторий, добавляет все файлы в директории скрипта
# И форспушит новый репозиторий по старому адресу

set -e

GREEN="\e[1;32m"
RESET="\e[0m\n"

printf "${GREEN}Go to $(pwd)${RESET}"
cd "$(dirname "${BASH_SOURCE[0]}")"

REPO_URL=$(git remote get-url origin)
printf "${GREEN}Repository URL: ${REPO_URL}${RESET}"

printf "${GREEN}Remove .git...${RESET}"
rm -rf .git/

printf "${GREEN}Git init...${RESET}"
git init

printf "${GREEN}Add all files in new repo${RESET}"
git add .

printf "${GREEN}Commit all files${RESET}"
git commit -m "autocommit"

printf "${GREEN}Set remote...${RESET}"
git remote add origin ${REPO_URL}

git push --force --set-upstream origin main
printf "${GREEN}+++++ Success! +++++${RESET}"
