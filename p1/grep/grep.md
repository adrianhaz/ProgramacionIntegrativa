##	Sintaxis básica para grep:
>	grep "string" file1 file2 ... =>	busca en diferentes ficheros\
>	grep "string" file*			  =>	busca en ficheros que empiecen por 'file'\
>	grep "string" -r '.'		  =>	busca de forma recursiva.

*grep* no solo busca en ficheros regulares, si no que también detecta apariciones en ficheros binarios. 

##	Operacíones básicas grep:

###	**-c** 
>	Cuenta nº líneas aparece el patrón.

###	**-o**
>	Muestra parte de la línea aparece patrón.

###	**-l**
>	Muestra ficheros aparece el patrón.

###	**-n**
>	Muestra nº de línea.

###	**-w**
>	Busca solo palabras completas coinciden con patrón.

###	**-i**
>	*case insensitive**

###	**-v**
>	Invierte sentido *matching.*

## ¿Cómo sacarías las líneas completas y sus números de línea de aquellas que no contienen la palabra 'foo' en el archivo ejsPrueba/foo.txt?
>	grep -nwve "foo" ejsPrueba/foo.txt