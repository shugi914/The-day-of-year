#!/bin/bash



leap_year(){
    if [[ $1 -lt 1582 ]]; then
    echo "Not within the Gregorian calendar period"
    elif [ $(($1 % 4)) -ne 0 ]; then
    echo "Common year"
    elif [ $(($1 % 100)) -ne 0 ]; then
    echo "Leap year"
    elif [ $(($1 % 400)) -ne 0 ]; then
    echo "Common year"
    else
    echo "Leap year"
    fi
}

month_day(){  
    case $1 in
        1|3|5|7|8|10|12)
            echo 31 ;;
        4|6|9|11)
            echo 30 ;;
        2)
           if [[ $( leap_year $2) = "Leap year" ]]; then
           echo 29
           else
           echo 28 
           fi
           ;;
        *)
            echo "Invalid month" ;;
    esac
}

day_of_year(){ 
    if [[ $1 -le $(month_day $2 $3) ]]; then 
        days=0
        for (( i=1; i<$2; i++ )); do
            days=$days+$(month_day $i)
            
        done
        days=$days+$1
        echo $days | bc
    else
        echo "no such day in this month"
    fi 
}

#  leap_year $1
#  month_day $2 $1
# day_of_year $3 $2 $1


