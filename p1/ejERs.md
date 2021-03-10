#	Ejercicios Expresiones Regulares

##	1.	Expresión regular que utilizarías para encontrar las líneas que empezasen por una letra mayúscula, contuviesen cualquier otro caracter que no fuese numérico al menos una vez y que terminasen con cualquier caracter que no fuese '^':

Podemos separar el problema en tres condiciones:
1.	Que empiece por mayúscula:	
>	grep -E "^([[:upper:]])" file.txt
2.	Que contenga un caracter != digit en el medio
>	grep -E "[[:alnum:]]*([^[:digit:]]){1,}([[:alnum:]])*" file.txt
3.	Que acabe con un signo != a '^'
>	grep -E "[^\^]$" file.txt

**grep -E "^([[:upper:]])[[:alnum:]]*([^[:digit:]]){1,}([[:alnum:]])*[^\^]$" file**

##	2.	Expresión regular que utilizarías para encontrar las líneas que acabasen con dos números:
>	grep -E "^([^[:digit:]]*[[:digit:]]{2})$" file

##	3.	Expresión regular que utilizarías para encontrar las líneas que, al menos, aparece 3 veces una 'a' seguida de cualquier vocal que no sea 'a' (por comodidad en minúsculas):
>	grep -E "([^a]*[a][eiou]){3,}([[:alnum:]])*$" file

¿\????¿?¿?¿?¿?¿\
>	grep -E "^([^a]*[a][eiou]){3,}([[:alnum:]])*$" file

##	4.	Expresión regular que utilizarías para encontrar las líneas en las que aparece, como mucho, una 'a' 3 veces:
>	grep -E "^([^a]*[a]){0,3}([^a])*$" file

##	5.	Expresión regular que utilizarías para encontrar las líneas que no puedan aparecer los signos '¡' '¿' al principio de la línea, ni tampoco '!' '?' al final. En el resto de la línea pueden aparecer, pero siempre cerrándose mutuamente y hasta un máximo de 3 veces. Por ejemplo, no valdría: "Hola, ¡cómo estás? Yo bien.". Tampoco se pueden anidar.

En este apartado tenemos diversas condiciones, vamos a afrontarlas una a una:
1.	No pueden abrir ni '¡' ni '¿'
>	grep -E "^([^¡¿])" file
2.	No pueden cerrar ni '!' ni '?'
>	grep -E "([^\!\?])$" file
3.	Tienen que abrirse y cerrarse como máximo 3 veces, ni tampoco anidarse.
>	grep -E "([^\!\?])*(([¡][^¡¿\?]*[\!]([^\!\?])*)|([¿][^¡¿\?]*[\?]([^\!\?])*)){0,3}([^\!¿\?¡])*" file
>>	3.1.	La primera parte es porque no puede cerrarse ningún signo, solo pueden abrirse.\
>>	3.2.	La segunda parte es un gran OR, en la que se vigile que no se aniden los signos, que continuen caracteres distintos a cierres de signos y que solo se usen un máx de 3 signos.\
>>	3.3.	La parte final nos dice que una vez finalizado este agrupamiento, no podemos tener más signos, sean abiertos o cerrados, ya que rebasarían el máximo o no podrían quedar sueltos porque sí.

**grep -E "^([^¡¿])([^\!\?])*(([¡][^¡¿\?]*[\!]([^\!\?])*)|([¿][^¡¿\?]*[\?]([^\!\?])*)){0,3}([^\!¿\?¡])*([^\!\?])$" file**