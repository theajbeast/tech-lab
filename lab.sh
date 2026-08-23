#!/bin/bash

show_menu() {    
    echo "================================"
    echo "        AJ BEAST TECH LAB"
    echo "================================"
    echo
    echo "1. System Health Check"
    echo "2. System Information"
    echo "3. Help"
    echo "4. Exit"
    echo
} 

show_help() {
    echo
    echo "AJ Beast Tech Lab Help"
    echo "1. System Health Check - Checks system health."
    echo "2. System Information - Displays system information."
    echo "3. Help - Displays this help menu."
    echo "4. Exit - Exits the lab."
    echo
}

run_tool() {
    case $choice in
        1)
            ./health_check.sh
            ;;

        2)
            ./system_info.sh
            ;;

        3)  show_help
            ;;
 
        4)  echo "Exiting AJ Beast Tech Lab..."
            exit 0
            ;;

        *)  
            echo "Invalid option. Please select 1, 2, 3, or 4."
            ;;
     esac
}
     
while true
do
    clear

    show_menu

    read -p "Select an option: " choice

    run_tool

    if [ "$choice" != "4" ]; then
         echo
         read -p "Press Enter to return to the menu..."
     fi

     clear
done
