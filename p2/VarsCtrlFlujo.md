#	Programación Integrativa - Variables y control de flujo.
POSIX especifica que el shell deberá evaluar aritméticamente los contenidos de expresiones con la sintaxis **$(( ...))**

##	**Asignación de variables y gestión del entorno.**

-	**readonly =>** marca las variables que se le pasen de solo lectura => *no es posible cambiar el valor de la variable ni elminarla, más que finalizando la sesión del shell en ejecución.*
-	**unset =>** elimina una variable ya definida.
-	**export =>** introduce variables en el entorno del shell.
-	**env =>** lleva a cabo el borrado de las variables del entorno del shell. También puede usarse para alterar el entorno de una invocación particular:
>	**$ env -i VAR1=val1 VAR2=val2 ... <comando><arg1><arg2> ...**
>
Es posible modificar el entorno de un programa a lanzar sin afectar permanentemente el entorno del shell, prefijando el comando a ejecutar con los nombres y valores de las variables a introducir:
>	**$ VAR1=val1 VAR2=val2 ... <comando><arg1><arg2> ...**

##	**Expansión paramétrica.**
>	Proceso por el que el shell proporciona el valor de una variable para su uso en el programa.\
>	**Los ':' de las siguientes expresiones son opcionales. Si se eliminan, la condición de 'existe y es no nula' pasa a ser solo 'existe'**

### **${variable:-texto}**
>	Si 'variable' = definida **&** !=NULL ? $variable : 'texto'

###	**${variable:=texto}**
>	Si 'variable' = definida & != NULL ? $variable : variable='texto' + $variable

###	**${variable:?texto}**
>	Si 'variable' = definida & != NULL ? $variable : error{print("texto")}

###	**${variable:?}**
>	Si 'variable' = definida & != NULL ? $variable : error{print(Estándard)}

###	**${variable:+texto}**
>	Si 'variable' = definida & != NULL ? 'texto' : $null

###	**${#variable}**
>	return Número de caracteres de $variable

### **${variable#patrón}**
>	Si patrón = principio $variable => **elimina parte más pequeña match**

### **${variable##patrón}**
>	Si patrón = principio $variable => **elimina parte más grande match**

### **${variable%patrón}**
>	Si patrón = final $variable => **elimina parte más pequeña match**

###	**${variable%%patrón}**
>	Si patrón = final $variable => **elimina parte más grande match**

###	**$#**
>	Número total de parámetros pasados al script/función

### **$\*, $@**
>	Concatenación ordenada de todos los parámetros posicionales.

###	**"$\*"**
>	Concatenación ordenada de todos los parámetros posicionales como string único. Se usa el 1er caracter de *$IFS* como separador de los != valores al crear el string.

###	**"$@"**
>	Todos los parámetros posicionales como strings separados.

##	**Expansión aritmética**
>	Los operadores aritméticos del shell son similares a los existentes en C.\
*A pesar de que algunos contienen caracteres especiales, no hay que escaparlos, ya que* **deben usarse dentro de un entorno delimitado por:**
>	**$(( ... ))**\
>	La aritmética de POSIX => variables enteras de tipo **long**

### **VARIABLES**

>###	**#**
>>	Núm. de argumentos proporcionados al proceso actual.

>###	**@**
>>	Argumentos de línea de comandos proporcionados al proceso actual.

>###	**"@"**
>>	Se expande el anterior en los argumentos individuales.

>###	**\***
>>	Idem. '@'

>###	**"\*"**
>>	Idem. "@"	

>###	**-**
>>	Opciones pasadas al shell en la invocación.

>###	**?**
>>	Estatus de salida del comando previo.

>###	**$**
>>	PID del proceso del shell.

>###	**0**
>>	Nombre del programa invocado al lanzar el proceso.

>###	**!**
>>	PID del último comando ejecutado en background por el shell.

>###	**HOME**
>>	Ruta dir. HOME user

>###	**IFS**
>>	Internal Field Separator => lista de caracteres que actúan como separadores de palabra. [value] = espacio, tabulador y salto de línea.

>###	**LANG**
>>	Nombre por defecto locale actual. Menor precedencia que otras variables LC_\*.

>###	**LC_ALL**
>>	Nombre locale actual. Precedencia sobre LANG y otras variables LC_\*.

>###	**LC_COLLATE**
>>	Nombre del locale usado para ordenación (*collation*) de caracteres.

>###	**LC_CTYPE**
>>	Nombre del locale usado para determinar las clases de caracteres a usar durante búsquedas de patrones.

>###	**LC_MESSAGES**
>>	Nombre del locale usado para emitir mensajes de salida.

>###	**LINENO**
>>	Número de línea del script/función ejecutándose.

>###	**PATH**
>>	Rutas para buscar comandos a ejecutar que no contengán ningún caracter '/'

>###	**PPID**
>>	Parent PID.

>###	**PS1**
>>	String de petición de comando del prompt ['$']

>###	**PS2**
>>	String de petición de continuación de línea ['>']

>###	**PS4**
>>	String de traza de ejecución con **set -x** ['+']

>###	**PWD**
>>	Directorio actual.

###	**OPERADORES**

>###	**++ --**
>>	Post-incremento / post-decremento

>###	**+ - ! ~**
>>	Suma y resta unitarios, negación lógia y 'bit a bit'

>###	**\* / %**
>>	Multiplicación, división y resto (módulo).

>###	**+ -**
>>	Suma y resta.

>###	**<< >>**
>>	Bit-shift hacia izquierda y derecha

>###	**< <= > >=**
>>	Comparaciones.

>###	**== !=**
>>	Igualdad y desigualdad.

>###	**&**
>>	AND 'bit a bit'

>###	**^**
>>	XOR 'bit a bit'

>###	**|**
>>	OR 'bit a bit'

>###	**&&**
>>	AND lógico (cortocircuito).

>###	**||**
>>	OR lógico (cortocircuito).

>###	**?:**
>>	Expresión condicional.

>###	**= += \*= /= %= &= ^= <<= >>= |=**
>>	Operadores de asignación.

##	**Estatus de salida.**
Se accede mediante **$?** Solo se devuelven al proceso padre los 8 bits menos significativos del estatus de salida => **$? > 255 ? return ($? mod 256) : $?**\
Se puede especificar con **exit**

**VALORES:**

###	**0** 		=> ejecución exitosa.
###	**>0** 		=> fallo durante redirección | expansión aritmética.
###	**1-125**	=> fallo durante ejecución.
###	**126**		=> comando existe, pero no es ejecutable.
###	**127**		=> comando no encontrado.
###	**>128**	=> ejecución falló por la recepción de una señal.

##	**Bucles**
###	**if -- elif -- else -- fi**
if pipeline\
	[ pipeline ... ]\
then\
	statements-if-true-1\
[ elif pipeline\
	[ pipeline ... ]\
	statements-if-true-2\
...]\
[ else\
	statements-if-all-false ]\
fi

Los *pipelines* se evalúan con: **NOT, AND, OR** ; *AND y OR en cortocircuito*

###	**test**
Se usa para comprobar condiciones.\
if test "$str1" = "$str2"\
then\
statements-if-true\
fi

Lo anterior es **equivalente a:**\
if [ "$str1" = "$str2" ]\
then\
statements-if-true\
fi

-	0 argumentos => return false (1)
-	1 argumento =>	
	*	si $1 != NULL => true (0)
	*	si $1 == NULL => false (1)
-	2 argumentos =>
	*	si $1 == '!' => negar resultado 'test $2'
	*	si $1 == op.unario => resultado de la comprobación
	*	- => no especificado
-	3 argumentos =>
	*	si $1 == '!' => negar resultado 'test $2 $3'
	*	si $2 == op.binario => resultado de la comprobación
	*	-	=> no especificado
-	4 argumentos =>
	*	si $1 == '!' => negar resultado 'test $2 $3 $4'
	*	-	=> no especificado
-	> 4 argumentos => no especificado

**Al usar el comando 'test' debemos de tener en cuenta:**
-	Usar **siempre los argumentos en comillas**
-	En **comparaciones entre strings** poner **una 'x' delante** del string ("$answer" = "yes" -> "x$answer" = "xyes")
-	Para **test numéricos usar enteros**

### **case**
case $var in\
val1)\
statements-if-val1\
;;\
val2)|val3)\
statements-if-val2-or-val3\
;;\
·\
·\
\*)\
statements-if-no-match\
esac

##	**Lazos**
###	**for**
for i in <\list>\
do\
	loop-body\
done

-	Si "in <\list>" se omite, iterará sobre los parámetros posicioneales.

###	**while**
while condition\
do\
loop-body\
done

### **until**
until coniditon\
do\
loop-body\
done

###	**break y continue**
Pueden estar acompañados de un entero para indicar cuántos lazos anidados deben saltarse.

###	**shift**
Procesa los parámetros posicionales de un script. Cada vez que se ejecuta, el parámetro $1 se descarta. El $2 -> $1, el $3 -> $2 ...\
Alternativa: **getopts**

##	**Funciones del shell**
function_name() {\
function-code\
}
-	Tienen que definirse antes de ser usadas.
-	Pueden estar guardadas en otro file, siendo llamadas con el comando '**.**'
-	Los argumentos especiales del shell que hacen referencia a los parámetros posicionales => parámetros pasados a la función.
