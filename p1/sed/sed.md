##	Sustitución con 'sed'
>	sed -e 's/A/B/' <file> \
>	sed -e 's/foo/FOO/' ejsPrueba/file1.txt => *solo sustituyte la 1ª ocurrencia*\

**Por defecto, 'sed' es** *case sensitive* **por lo que si queremos que actúe:**
-	**De forma global (todas las ocurrencias) => $ sed -e 's/../../g' <file>**
-	**De forma** ***insensitive*** **=> $ sed -e 's/../../i' <file>**

>	sed -e 's/foo/FOO/gi' ejsPrueba/file1.txt => *sustituye todas las ocurrencias aunque estén en mayúsculas/minúsculas/mezclado*

**Se pueden aplicar rangos en 'sed'. Si queremos:**
-	**Que aplique a las líneas [2, 3] 				=> $ sed -e '2,3s/../../[..]' <file>**
-	**Que aplique a todas las líneas menos la 2 y 3 => $ sed -e '2,3!s/../../[..]' <file>** 

### **¿Cómo eliminarías en el fichero 'file1.txt' el segundo 'foo' de la primera línea y ambos 'foo' de la cuarta con solo una expresión?**
>	sed -e '2,3!s/foo/FOO/g' ejsPrueba/file1.txt