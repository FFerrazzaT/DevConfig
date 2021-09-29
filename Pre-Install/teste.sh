#!/bin/bash

_model4(){
   
   setterm -cursor off 
   trap ctrl_c SIGINT SIGTERM
   
   i=1
   sp="/-\|"
   _start=1
   _end=100


   spin(){ printf " [ \b${sp:i++%${#sp}:1}]";}
  
	function ProgressBar {

		let _progress=(${1}*100/${2}*100)/100
		let _done=(${_progress}*4)/10
		let _left=40-$_done
		_fill=$(printf "%${_done}s")
		_empty=$(printf "%${_left}s")
		printf "\rProgress : [${_fill// /.}${_empty// /-}] ${_progress}%%"
	}

	
	for number in $(seq ${_start} ${_end})
	do
	     printf " [ \b${sp:i++%${#sp}:1}]"
		sleep 0.1
		ProgressBar ${number} ${_end} spin
	done 
   
   printf "\r"
}


case $1 in
	1)   _model4 ;;
	*) echo 'opção inválida' ;;
esac


