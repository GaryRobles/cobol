      *     $ SET SOURCEFORMAT"FREE"
      * IDENTIFICATION DIVISION.- Información del programa
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  SeqReadCiudadesBolivia.
       AUTHOR.  Gary Robles.

       INSTALLATION ./home/garyrobles/cobolexamples/.
       DATE-WRITTEN 04/06/2019.
       DATE-COMPILED 04/06/2019.
       REMARKS Un ejemplo que muestra cómo leer un archivo
            secuencialmente.

      * ENVIRONMENT DIVISION.- Consta de la información del entorno
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      * la ruta debes modificarla por la tuya /home/gary/
       SELECT ArchivoCiudades ASSIGN TO "/home/gary/CIUDADESBOLIVIA.DAT"
         ORGANIZATION IS LINE SEQUENTIAL.

      * DATA DIVISION.- Consta de las descripciones de los datos
       DATA DIVISION.
       FILE SECTION.
       FD ArchivoCiudades.
       01 DetallesCiudad.
          02  CodigoINE       PIC X(17).
          02  NombreCiudad            PIC X(23).
          02  NroHabitantesCenso       PIC 9(7).
          02  Departamento      PIC X(10).

      * PROCEDURE DIVISION.- Consta de todo el algoritmo del programa
       PROCEDURE DIVISION.
       Begin.
            OPEN INPUT ArchivoCiudades
            READ ArchivoCiudades
                AT END MOVE HIGH-VALUES TO DetallesCiudad
            END-READ
            PERFORM UNTIL DetallesCiudad = HIGH-VALUES
               DISPLAY CodigoINE SPACE NombreCiudad SPACE Departamento
               READ ArchivoCiudades
                  AT END MOVE HIGH-VALUES TO DetallesCiudad
               END-READ
            END-PERFORM
       CLOSE ArchivoCiudades




       STOP RUN.
