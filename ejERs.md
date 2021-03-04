#	Ejercicios Expresiones Regulares

##	1.	Expresión regular que utilizarías para encontrar las líneas que empezasen por una letra mayúscula, contuviesen cualquier otro caracter que no fuese numérico al menos una vez y que terminasen con cualquier caracter que no fuese '^':
>	grep -E '^[[:upper:]][[:alpha:]]{1,}' file.txt\
>	cat file.txt | grep -E '^[[:upper]]' | grep -E '[[::alpha:]]{1,}'