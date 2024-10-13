#!/bin/bash

# Определение цветов
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

ENDCOLOR='\033[0m'


#Start generator

swift_version=""
author_name=""
date_value=""

resource_code=', resources: [.process("Resources")]'

echo -e "${On_Green}WELCOME TO MOPSSORATOR${ENDCOLOR}\n"

echo -e "${BCyan}\nВведите имя модуля:${ENDCOLOR}"
read module_name

clear
echo -e "${BRed}\nВыберите swift-tools-version:${ENDCOLOR}"
echo -e "${Yellow}1 - 5.8${ENDCOLOR}"
echo -e "${Yellow}2 - 5.9${ENDCOLOR}"
read swift_ver_choose

clear
echo -e "${BPurple}\nАссеты нужны?${ENDCOLOR}"
echo -e "${Yellow}1 - Да${ENDCOLOR}"
echo -e "${Yellow}2 - Нет${ENDCOLOR}"
read assets_need

clear
echo -e "${BBlue}\nВведите имя экрана (без использования Scene, View) ${ENDCOLOR}"
read first_scene

case $assets_need in
1)
echo
;;

2)
echo
;;
esac

case $swift_ver_choose in 
1)
swift_version="5.8"
;;

2)
swift_version="5.9"
;;
esac

clear
echo -e "${BYellow}\nВведите ФИО на латицине${ENDCOLOR}"
read author_name

date_value=$(date +"%d.%m.%Y")

#### Процесс переименования и перемещения ###

# Создаем папку для модуля
mkdir $module_name
cp -a template-module/. $module_name/

# Переименовываем папки
mv $module_name/Sources/folder-name $module_name/Sources/$module_name
mv $module_name/Sources/$module_name/Screens/template-scene $module_name/Sources/$module_name/Screens/$first_scene

# Переименовываем файлы
mv $module_name/Sources/$module_name/template-coordinator.swift $module_name/Sources/$module_name/${module_name}Coordinator.swift 
mv $module_name/Sources/$module_name/Screens/$first_scene/Views/template-view.swift $module_name/Sources/$module_name/Screens/$first_scene/Views/${first_scene}Scene.swift
mv $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/template-viewModel.swift $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/${first_scene}ViewModel.swift
mv $module_name/Sources/$module_name/Data/Network/API/template-api.swift $module_name/Sources/$module_name/Data/Network/API/${module_name}API.swift

# Переименовываем текст в файлах
eval "sed 's/MODULE_NAME/${module_name}/g' $module_name/Package.swift > $module_name/temp_Package.swift && mv $module_name/temp_Package.swift $module_name/Package.swift"
eval "sed 's/SWIFT_VERSION/${swift_version}/g' $module_name/Package.swift > $module_name/temp_Package.swift && mv $module_name/temp_Package.swift $module_name/Package.swift"

eval "sed 's/AUTHOR-NAME/${author_name}/g' $module_name/Sources/$module_name/${module_name}Coordinator.swift > $module_name/Sources/$module_name/temp_Coordinator.swift && mv $module_name/Sources/$module_name/temp_Coordinator.swift $module_name/Sources/$module_name/${module_name}Coordinator.swift"
eval "sed 's/TEMPLATE-COORDINATOR/${module_name}Coordinator/g' $module_name/Sources/$module_name/${module_name}Coordinator.swift > $module_name/Sources/$module_name/temp_Coordinator.swift && mv $module_name/Sources/$module_name/temp_Coordinator.swift $module_name/Sources/$module_name/${module_name}Coordinator.swift"
eval "sed 's/DATE/${date_value}/g' $module_name/Sources/$module_name/${module_name}Coordinator.swift > $module_name/Sources/$module_name/temp_Coordinator.swift && mv $module_name/Sources/$module_name/temp_Coordinator.swift $module_name/Sources/$module_name/${module_name}Coordinator.swift"
eval "sed 's/{SCREEN-NAME}/${first_scene}/g' $module_name/Sources/$module_name/${module_name}Coordinator.swift > $module_name/Sources/$module_name/temp_Coordinator.swift && mv $module_name/Sources/$module_name/temp_Coordinator.swift $module_name/Sources/$module_name/${module_name}Coordinator.swift"

eval "sed 's/TEMPLATE-API/${module_name}API/g' $module_name/Sources/$module_name/Data/Network/API/${module_name}API.swift > $module_name/Sources/$module_name/Data/Network/API/temp_API.swift && mv $module_name/Sources/$module_name/Data/Network/API/temp_API.swift $module_name/Sources/$module_name/Data/Network/API/${module_name}API.swift"
eval "sed 's/AUTHOR-NAME/${author_name}/g' $module_name/Sources/$module_name/Data/Network/API/${module_name}API.swift > $module_name/Sources/$module_name/Data/Network/API/temp_API.swift && mv $module_name/Sources/$module_name/Data/Network/API/temp_API.swift $module_name/Sources/$module_name/Data/Network/API/${module_name}API.swift"
eval "sed 's/DATE/${date_value}/g' $module_name/Sources/$module_name/Data/Network/API/${module_name}API.swift > $module_name/Sources/$module_name/Data/Network/API/temp_API.swift && mv $module_name/Sources/$module_name/Data/Network/API/temp_API.swift $module_name/Sources/$module_name/Data/Network/API/${module_name}API.swift"

eval "sed 's/AUTHOR-NAME/${author_name}/g' $module_name/Sources/$module_name/Screens/$first_scene/Views/${first_scene}Scene.swift > $module_name/Sources/$module_name/Screens/$first_scene/Views/temp_Scene.swift && mv $module_name/Sources/$module_name/Screens/$first_scene/Views/temp_Scene.swift $module_name/Sources/$module_name/Screens/$first_scene/Views/${first_scene}Scene.swift"
eval "sed 's/DATE/${date_value}/g' $module_name/Sources/$module_name/Screens/$first_scene/Views/${first_scene}Scene.swift > $module_name/Sources/$module_name/Screens/$first_scene/Views/temp_Scene.swift && mv $module_name/Sources/$module_name/Screens/$first_scene/Views/temp_Scene.swift $module_name/Sources/$module_name/Screens/$first_scene/Views/${first_scene}Scene.swift"
eval "sed 's/{SCREEN-NAME}/${first_scene}/g' $module_name/Sources/$module_name/Screens/$first_scene/Views/${first_scene}Scene.swift > $module_name/Sources/$module_name/Screens/$first_scene/Views/temp_Scene.swift && mv $module_name/Sources/$module_name/Screens/$first_scene/Views/temp_Scene.swift $module_name/Sources/$module_name/Screens/$first_scene/Views/${first_scene}Scene.swift"

eval "sed 's/AUTHOR-NAME/${author_name}/g' $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/${first_scene}ViewModel.swift > $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/temp_ViewModel.swift && mv $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/temp_ViewModel.swift $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/${first_scene}ViewModel.swift"
eval "sed 's/DATE/${date_value}/g' $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/${first_scene}ViewModel.swift > $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/temp_ViewModel.swift && mv $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/temp_ViewModel.swift $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/${first_scene}ViewModel.swift"
eval "sed 's/{SCREEN-NAME}/${first_scene}/g' $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/${first_scene}ViewModel.swift > $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/temp_ViewModel.swift && mv $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/temp_ViewModel.swift $module_name/Sources/$module_name/Screens/$first_scene/ViewModel/${first_scene}ViewModel.swift"


# Переносим Ассеты, если нужны
if [ $assets_need -eq 1 ]; then
    cp -a template-assets/. $module_name/Sources/$module_name
    sed "s/INCLUDE_RESOURCE/${resource_code}/g" "$module_name/Package.swift" > "$module_name/temp_Package.swift" && mv "$module_name/temp_Package.swift" "$module_name/Package.swift"
else
    sed "s/INCLUDE_RESOURCE//g" "$module_name/Package.swift" > "$module_name/temp_Package.swift" && mv "$module_name/temp_Package.swift" "$module_name/Package.swift"
fi


# Перемещаем на рабочий стол
mv $module_name ~/Desktop/

clear
echo -e "${BGreen}Woof-woof! ${ENDCOLOR}"
echo -e "${BGreen}\nМодуль $module_name создан. Переместите его из рабочего стола в Ваш проект :) ${ENDCOLOR}"
exit 0

# GRAND ROADMAP
# Change Package.swift
# Change Coordinator.swift
# Change ViewModel.swift
# Change View.swift
# Change API.swift
# Optional include design and network layer from git or ...
# Optional create first usecase
# Optional include feature flags
# Hamster kombat is a scam!