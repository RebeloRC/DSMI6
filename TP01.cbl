       IDENTIFICATION DIVISION.
           PROGRAM-ID. CALCULADORA-IRRF.
           AUTHOR. RODRIGO REBELO DA COSTA.
           INSTALLATION. HOME.
           DATE-WRITTEN. 23/08/2023.
           DATE-COMPILED. 23/08/2023.
           SECURITY. CALCULANDO IRRF.

      *--------------------------------------------------------------*

       ENVIRONMENT DIVISION.
           CONFIGURATION SECTION.
           SOURCE-COMPUTER. NOTE.
           OBJECT-COMPUTER. NOTE.
           SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.

      *--------------------------------------------------------------*

       DATA DIVISION.
           WORKING-STORAGE SECTION.
       01 WS-EMPLOYEE.
           05 WS-EMPLOYEE-NAME          PIC X(20)     VALUE SPACES.
           05 WS-EMPLOYEE-LAST-NAME     PIC X(20)     VALUE SPACES.
           05 WS-EMPLOYEE-ID            PIC 9(5)      VALUE ZEROS.
           05 WS-HOUR-VALUE            PIC 9(5)V9(2)  VALUE ZEROS.
           05 WS-SALARY.
               10 WS-SALARY-GROSS       PIC 9(5)V9(2)  VALUE ZEROS.
               10 WS-SALARY-NET         PIC 9(5)V9(2)  VALUE ZEROS.
               10 WS-REFERENCE-SALARY   PIC 9(5)V9(2)  VALUE ZEROS.
               10 WS-INSS-DEDUCTION     PIC 9(5)V9(2)  VALUE ZEROS.
               10 WS-IRRF-DEDUCTION     PIC 9(5)V9(2)  VALUE ZEROS.

       77 WS-WORKED-HOURS             PIC 9(3)V9(2)  VALUE ZEROS.
       77 WS-HOURS-QUANTITY           PIC 9(3)       VALUE ZEROS.
       77 WS-DEPENDENTS-QUANTITY      PIC 9(2)       VALUE ZEROS.
       77 WS-DEPENDENT-DEDUCTION      PIC 9(5)V9(2)  VALUE ZEROS.

       77 WS-CONST-INSS-RATE          PIC 9V9(3)     VALUE 0,14.
       77 WS-CONST-IRRF-RATE          PIC 9V9(3)     VALUE 0,275.
       77 WS-CONST-IRRF-DEDUCTION     PIC 9(3)V9(2)  VALUE 869,36.
       77 WS-CONST-DEPENDENT-RATE PIC 9(3)V9(2)  VALUE 189,59.

       PROCEDURE DIVISION.
           INPUT-DATA.

           DISPLAY "Digite as seguintes informacoes do funcionario:"
           DISPLAY "Nome: "
           ACCEPT WS-EMPLOYEE-NAME.

           DISPLAY "Sobrenome: "
           ACCEPT WS-EMPLOYEE-LAST-NAME.

           DISPLAY "Prontuário: "
           ACCEPT WS-EMPLOYEE-ID.

           DISPLAY "Valor hora trabalhada: "
           ACCEPT WS-HOUR-VALUE.

           DISPLAY "Quantidade de horas trabalhadas: "
           ACCEPT WS-WORKED-HOURS.

           DISPLAY "Quantidade de dependentes: "
           ACCEPT WS-DEPENDENTS-QUANTITY.

      *--------------------------------------------------------------*
           CALCULATE-SALARY.

      *    SALARIO BRUTO
           MULTIPLY WS-HOUR-VALUE BY WS-WORKED-HOURS
           GIVING WS-SALARY-GROSS.

      *    CALCULATE INSS
           MULTIPLY WS-SALARY-GROSS BY WS-CONST-INSS-RATE
           GIVING WS-INSS-DEDUCTION.

      *    CALCULATE REFERENCE SALARY
           SUBTRACT WS-INSS-DEDUCTION FROM WS-SALARY-GROSS
           GIVING WS-REFERENCE-SALARY.

      *    CALCULATE IRRF
           MULTIPLY WS-SALARY-GROSS BY WS-CONST-IRRF-RATE
           GIVING WS-IRRF-DEDUCTION

           MULTIPLY WS-DEPENDENTS-QUANTITY BY WS-CONST-DEPENDENT-RATE
           GIVING WS-DEPENDENT-DEDUCTION.

           SUBTRACT WS-CONST-IRRF-RATE WS-CONST-DEPENDENT-RATE
           FROM WS-IRRF-DEDUCTION.

      *    CALCULATE NET SALARY
           SUBTRACT WS-IRRF-DEDUCTION FROM WS-REFERENCE-SALARY
           GIVING WS-SALARY-NET

      *--------------------------------------------------------------*

           DISPLAY "".
           DISPLAY "CALCULADORA IRRF".
           DISPLAY "".
           DISPLAY "Nome:       " WS-EMPLOYEE-NAME.
           DISPLAY "Sobrenome:  " WS-EMPLOYEE-LAST-NAME.
           DISPLAY "Prontuario: " WS-EMPLOYEE-ID.
           DISPLAY "Valor/hora: " WS-HOUR-VALUE.
           DISPLAY "Horas trabalhadas: " WS-WORKED-HOURS.
           DISPLAY "Numero de dependentes: " WS-DEPENDENTS-QUANTITY.
           DISPLAY "Salario bruto: " WS-SALARY-GROSS.
           DISPLAY "INSS: " WS-INSS-DEDUCTION.
           DISPLAY "IRRF: " WS-IRRF-DEDUCTION.
           DISPLAY "Salario liquido: " WS-SALARY-NET.
           DISPLAY "".

           STOP RUN.
