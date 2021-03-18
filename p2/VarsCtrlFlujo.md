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

