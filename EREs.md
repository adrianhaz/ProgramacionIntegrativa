#	Programación Integrativa - Expresiones Regulares Extendidas (ERE) y Expr. Regulares Básicas (BRE)

##	\ 
>	Sirve para escapar el significado especial de un caracter.\
>	Válido para ERE y BRE.

##	.
>	Se corresponde con cualquier caracter - NUL\
>	Válido para ERE y BRE.

##	*
>	Se corresponde con cualquier número (incluido ninguno).\
>	Válido para ERE y BRE.
>	-	ERE =>	puede modificar una expresión regular que aparezca previamente.
>	-	BRE	=>	no se considera un metacaracter si aparece al principio de una expresión regular.

##	^
>	Se corresponde con el inicio de una línea o string.\
>	Válido para ERE y BRE.
>	-	BRE	=>	solo es metacaracter al principio de una expresión regular.

##	$	
>	Se corresponde con el final de una línea o string.\
>	Válido para ERE y BRE.
>	-	BRE	=>	solo es metacaracter al final de una expresión regular.

##	[...]
>	*Bracket expression,* se corresponde con cualquiera de los caracteres que contiene. 
>>	-	[.-.]	=>	indica rango, **rangos dependen del locale => NO PORTABLE.**
>>	-	[^..]	=>	cualquier caracter que NO esté en la lista.
>>	-	[..-] 	=>	caracter ordinario
>>	-	[]..]	=>	caracter ordinario
>>
>	Válido para ERE y BRE

##	\( \)
>	Es un espacio especial dedicado. Puede contener hasta 9 subpatrones por cada patrón. El texto emparejado con el subpatrón puede ser reusado más adelante dentro del mismo patrón usando las secuencias de escape \1 ... \9\
>	Válido para BRE

##	\n
>	Sirve para repetir el n-ésimo subpatrón encerrado entre '\( \)'. *n ∈ [1, 9]*, siendo \1 el subpatrón que aparece más a la izquierda dentro del patrón.\
>	Válido para BRE

##	\{n,m\}
>	*Interval expression,* se corresponde con un rango de entre *n* y *m* ocurrencias del caracter precedente.\
>	-	\{n\}	=>	se corresponde con exactamente *n* ocurrencias.
>	-	\{n,\}	=>	se corresponde con *al menos n ocurrencias.*
>	
>	***n, m ∈ [0, RE_DUP_MAX]*** (según POSIX *RE_DUP_MAX ≥ 255*)\
>	Válido para BRE

##	{n,m}
>	Equivalente a '\{n,\m}' pero para ERE.\
>	Válido para ERE

##	+	
>	Se corresponde con ≥1 apariciones de la expresión regular precedente.\
>	Válido para ERE

##	?
>	Se corresponde con 0/1 apariciones de la expresión regular precedente.\
>	Válido para ERE

##	|
>	Se corresponde con la expresión regular especificada antes o después (condicional).\
>	Válido para ERE

##	()
>	Aplica una correspondencia al grupo de expresiones regulares contenido entre paréntesis.\
>	Válido para ERE


## **Clases de caracteres POSIX:**
-	[:alnum:]	=>	caracteres alfanuméricos
-	[:alpha:]	=>	caracteres alfabéticos
-	[:blank:]	=>	espacios y tabuladores
-	[:cntrl:]	=>	caracteres de control
-	[:digit:]	=>	dígitos
-	[:graph:]	=>	caracteres visibles (ni espacios ni control)
-	[:lower:]	=>	caracteres albéticos minúsculos
-	[:print:]	=>	caracteres imprimibles (no control)
-	[:punct:]	=>	signos de puntuación
-	[:space:]	=>	cualquier tipo de espacios, incluyendo saltos de línea
-	[:upper:]	=>	caracteres alfabéticos mayúsculos
-	[:xdigit:]	=>	dígitos hexadecimales
