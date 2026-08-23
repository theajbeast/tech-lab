#!/bin/bash

while true
do

    echo "================================"
    echo "        AJ BEAST TECH LAB"
    echo "================================"
    echo
    echo "1. System Health Check"
    echo "2. System Information"
    echo "3. Help"
    echo "4. Exit"
    echo

    read -p "Select an option: " choice

    case $choice in 
        1)
            ./health_check.sh
            ;;
        
        2)
            ./system_info.sh
            ;;

        3) 
            echo
            echo "AJ Beast Tech Lab"
            echo "Available tools:"
            echo "  1. System Health Check"
            echo "  2. System Information"
            echo "  3. Help"
            echo "  4. Exit"
            ;;
    
        4) 
            echo "Exiting AJ Beast Tech Lab..."
            exit 0
            ;;
    
        *)
            echo "Invalid option. Please select 1, 2, 3 or, 4."
            ;;
     esac

     if [ "$choice" != "4" ]; then
         echo
         read -p "Press Enter to return to the menu..."
     fi

     clear
done
