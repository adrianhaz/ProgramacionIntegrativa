## 'find'
Lista de forma recursiva y exhaustiva los ficheros y directorios de la ruta actual. Dispone des muchas opciones y tests.


##	Opciones:

### **-name** e **-iname**
>	Filtra por nombre de fichero/directorio. iname ignora mayúsculas.

###	**-mtime** *n*
>	Para filtrar por fecha de modificación (n \* 24horas).

###	**-empty**
>	Lista ficheros vacíos.

###	**-not**
>	Invertir *matching.*

###	**-exec** *command*
>	Ejecuta *command* sobre los ficheros/directorios listados.

###	**-user**, **-uid**, **-group**, etc.
>	Filtrado por usuario, id del user, grupo...

##	Ejemplos:
-	Mostrar **ficheros** en el directorio actual que solo hayan sido modificados hace 3 días:

>	**$ find . -type f -mtime 3**

-	Mostrar **ficheros** vacíos en este directorio.

>	**$ find . -type f -empty**

-	Mostrar **ficheros** del **root** en este dir. que terminen en *.bak* y eliminarlos usando *-exec*

>	**$ find . -type f -user root -iname "\*.bak" -exec rm '{}' \;**\
>	Para pasarle la salida del 'find' como parámetro a 'rm' tenemos que poner '{}'. Además, el comando que se ejecuta en *-exec* termina en ';', por lo que hay que escaparlo con '\'.\
>	Equivale a: \
>	**$ find . -type f -user root -iname "\*.bak" -delete**

## ¿Diferencia entre los siguientes tres comandos?

1.	$ find . -type f -user root -iname "\*.bak" -exec grep \*.bak '{}' \; -print
2.	$ find . -type f -user root -iname "\*.bak" | xargs grep \*.bak
3.	$ find . -type f -user root -iname "\*.bak" | grep \*.bak

El 1 y el 2 hacen 'grep' sobre los ficheros filtrados, mientras que el 3 sobre la lista de ficheros