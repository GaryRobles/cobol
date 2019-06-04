      ******************************************************************
      * Author: Gary Marcelo Robles
      * Date: 27/05/2019
      * Purpose: Practicar sobre operaciones, bucles anidados y
      * condiciones
      ******************************************************************
      * IDENTIFICATION DIVISION.- Información del programa
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIBONACCI.
       AUTHOR. garymarcelorobles@gmail.com
       INSTALLATION ./home/garyrobles/cobolexamples/.
       DATE-WRITTEN 29/05/2019.
       DATE-COMPILED 29/05/2019.
       REMARKS Practicar sobre operaciones, bucles anidados y
            condiciones

      * ENVIRONMENT DIVISION.- Consta de la información del entorno
       ENVIRONMENT DIVISION.

      * DATA DIVISION.- Consta de las descripciones de los datos
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 AUX.
            02 PRIMO                       PIC         9(6).
            02 PRIMOTEMP                   PIC         9(6).
            02 PRIMOMASK                   PIC         ZZZZZ9.
            02 I                           PIC         9(6).
            02 J                           PIC         9(6).
            02 R                           PIC         9(6),999.
            02 C                           PIC         9(6),999.
            02 ZER0                        PIC         9(6),999.
            02 IMASK                       PIC         ZZZZZ9.
            02 MAX                         PIC         9(6).
       01 ESDIVISIBLE                      PIC         X.
            88 NOESDIVISIBLE               VALUE 'Y'.

      * PROCEDURE DIVISION.- Consta de todo el algoritmo del programa
       PROCEDURE DIVISION.
       MOD1-INICIALIZACION.
            DISPLAY "Generando serie primos".
            MOVE 1 TO PRIMO.
            MOVE 1 TO I.
            MOVE 000000.000 TO ZER0.
            DISPLAY 'Ingresa la cantidad de números primos a mostrar'
               ' (los números negativos se transforman en positivo):'.
            ACCEPT MAX.
            IF MAX> 99999 THEN
               DISPLAY 'El nro maximo de nros primos a mostrar es de '
               '99999, lo siento :)'
               STOP RUN.
            IF MAX <= 0 THEN
               DISPLAY 'Por favor, Introduce un número válido '
               'mayor a cero :)'
               STOP RUN.
       MOD2-TRATAMIENTO.
            DISPLAY "Llamando al metodo serie primos".
            PERFORM MOD3-RUTINA THRU FIN-MD3 UNTIL I>MAX
            DISPLAY 'Serie Primos finalizada.'
            STOP RUN.

       MOD3-RUTINA.
            MOVE 'N' TO ESDIVISIBLE.
            MOVE 2 TO J.
            COMPUTE PRIMOTEMP = PRIMO - 1.
            PERFORM MOD3-PRIMO THRU FIN-PRIMO UNTIL J>=PRIMOTEMP
            OR ESDIVISIBLE = 'Y'.
            IF ESDIVISIBLE <> 'Y' THEN
               MOVE I TO IMASK
               MOVE 'N' TO ESDIVISIBLE
               MOVE PRIMO TO PRIMOMASK
               DISPLAY IMASK ': ' PRIMOMASK ''
               ADD 1 TO I.

            ADD 1 TO PRIMO.

       MOD3-PRIMO.
            DIVIDE J INTO PRIMO GIVING C REMAINDER R.
            IF R = ZER0 THEN
                 MOVE 'Y' TO ESDIVISIBLE.
            ADD 1 TO J.
       FIN-MD3.
            EXIT.
       FIN-PRIMO.
            EXIT.
       END PROGRAM FIBONACCI.
