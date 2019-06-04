      ******************************************************************
      * Author: Gary Marcelo Robles
      * Date: 27/05/2019
      * Purpose: Practicar sobre operaciones, bucles y condiciones
      * Tectonics: cobc
      ******************************************************************
      * IDENTIFICATION DIVISION.- Información del programa
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIBONACCI.
       AUTHOR. garymarcelorobles@gmail.com
       INSTALLATION ./home/garyrobles/cobolexamples/.
       DATE-WRITTEN 29/05/2019.
       DATE-COMPILED 29/05/2019.
       REMARKS Un ejemplo usando bucles.

      * ENVIRONMENT DIVISION.- Consta de la información del entorno
       ENVIRONMENT DIVISION.

      * DATA DIVISION.- Consta de las descripciones de los datos
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 AUX.
            02 X1              PIC         9(6).
            02 X1MASK          PIC         ZZZZZ9.
            02 X2              PIC         9(6).
            02 X3              PIC         9(6).
            02 I               PIC         9(6).
            02 IMASK           PIC         ZZZZZ9.
            02 MAX             PIC         9(6).


      * PROCEDURE DIVISION.- Consta de todo el algoritmo del programa
       PROCEDURE DIVISION.
       MOD1-INICIALIZACION.
            DISPLAY "Generando sucesión Fibonacci".
            MOVE 0 TO X1.
            MOVE 1 TO X2.
            MOVE 1 TO I.
            DISPLAY "Ingrese la cantidad de nros Fibonacci a mostrar:".
            ACCEPT MAX.
            IF MAX> 30 THEN
               DISPLAY 'El nro maximo de nros Fibonacci a mostrar es de'
               ' 30, lo siento :)'
               STOP RUN.
            IF MAX <= 0 THEN
               DISPLAY 'Por favor, Introduce un número válido '
               'mayor a cero :)'
               STOP RUN.

       MOD2-TRATAMIENTO.
            PERFORM MOD3-RUTINA THRU FIN-MD3 UNTIL I>MAX
            DISPLAY 'Sucesión Fibonacci finalizada.'
            STOP RUN.

       MOD3-RUTINA.
            MOVE I TO IMASK.
            MOVE X1 TO X1MASK.
            DISPLAY IMASK ': ' X1MASK ''.
            COMPUTE X3 = X1 + X2.
            MOVE X2 TO X1.
            MOVE X3 TO X2.

            ADD 1 TO I.
       FIN-MD3.
            EXIT.
       END PROGRAM FIBONACCI.
