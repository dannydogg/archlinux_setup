#!/bin/bash

# README
# Make executable with 'chmod +x arch_linux_install_whiptail.sh'

#sleep 1
# arch_linux_install_whiptail.sh
echo "DEBUG - arch_linux_install_whiptail.sh"
#sleep 1
# Current shell
echo "DEBUG - Current shell = $SHELL"

# INTRODUCTION

## The purpose of this script is to make the installation of Arch Linux easy
echo "DEBUG - The purpose of this script is to make the installation of Arch Linux easy"
#sleep 1

# PREPARATIONS

## Activation of bash globstar for recursive wildcard features
shopt -s globstar

## Definition of LC_ALL
LC_ALL=C
echo "DEBUG - LC_ALL = $LC_ALL"

## Definition of variables
echo "DEBUG - Definition of variables"
#sleep 1

### Whiptail basis title
whiptail_title="Arch Linux Install"
echo "DEBUG - whiptail_title = $whiptail_title"
#sleep 1

### Whiptail hight
whiptail_hight=18
echo "DEBUG - whiptail_hight = $whiptail_hight"
#sleep 1

### Whiptail width
whiptail_width=78
echo "DEBUG - whiptail_width = $whiptail_width"
#sleep 1

### Array of procedures satisfaction
#array_procedures_satisfaction=
#echo "DEBUG - array_procedures_satisfaction = $array_procedures_satisfaction"

### Array of keyboard layouts
array_kbd_layouts=($(ls /usr/share/kbd/keymaps/**/*.map.gz | awk -F/ '{print $NF}'))
echo "DEBUG - array_kbd_layouts[@] = ${array_kbd_layouts[@]}"
#sleep 1

### Count of keyboard layouts
count_kbd_layouts=$(ls /usr/share/kbd/keymaps/**/*.map.gz | awk 'END {print NR}')
echo "DEBUG - count_kbd_layouts = $count_kbd_layouts"
#sleep 1

### Array of human readable keyboard layouts
for ((i_loop=0; i_loop<count_kbd_layouts; i_loop++)); do
	array_hr_kbd_layouts[i_loop]=$(echo ${array_kbd_layouts[i_loop]} | awk '{ gsub(".map.gz", "", $0); print $0}')
done
echo "DEBUG - array_hr_kbd_layouts = ${array_hr_kbd_layouts[@]}"

### Array of locales
#TBD

### test #sleep
#sleep 3

# START OF WHIPTAIL

### Welcome Screen
whiptail --title "$whiptail_title" --yesno "Welcome!" 8 78 --yes-button Continue --no-button Cancel
#sleep 1

### Set keyboard layout
kbd_layout=$(whiptail --title "$whiptail_title - Set keyboard layout" --radiolist "Set your keyboard layout." $(( $whiptail_hight * 2 )) $whiptail_width $whiptail_hight $( for((i_loop=0; i_loop<count_kbd_layouts; i_loop++)); do echo "${array_kbd_layouts[i_loop]} ${array_hr_kbd_layouts[i_loop]} off"; done ))

echo DEBUG - Keyboard layout = $kbd_layout
loadkeys $kbd_layout

echo Test
