       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOAN-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT LOAN-FILE ASSIGN TO 'LOAN.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  LOAN-FILE.
       01  LOAN-REC.
           05  LOAN-ID            PIC 9(5).
           05  CUSTOMER-ID        PIC 9(5).
           05  LOAN-AMOUNT         PIC 9(7)V99.
           05  INTEREST-RATE       PIC 9(3)V99.
           05  LOAN-TERM           PIC 9(3).
           05  LOAN-BALANCE        PIC 9(7)V99.
           05  LOAN-STATUS         PIC A(10).

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  LOAN-ID                PIC 9(5).
       01  CUSTOMER-ID            PIC 9(5).
       01  LOAN-AMOUNT            PIC 9(7)V99.
       01  INTEREST-RATE          PIC 9(3)V99.
       01  LOAN-TERM              PIC 9(3).
       01  LOAN-BALANCE           PIC 9(7)V99.
       01  LOAN-STATUS            PIC A(10).

       PROCEDURE DIVISION.

       OPEN INPUT LOAN-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file LOAN-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Loan ID: '
       ACCEPT LOAN-ID
       DISPLAY 'Enter Customer ID: '
       ACCEPT CUSTOMER-ID
       DISPLAY 'Enter Loan Amount: '
       ACCEPT LOAN-AMOUNT
       DISPLAY 'Enter Interest Rate: '
       ACCEPT INTEREST-RATE
       DISPLAY 'Enter Loan Term (in months): '
       ACCEPT LOAN-TERM
       DISPLAY 'Enter Loan Balance: '
       ACCEPT LOAN-BALANCE
       DISPLAY 'Enter Loan Status: '
       ACCEPT LOAN-STATUS

       WRITE LOAN-REC

       CLOSE LOAN-FILE
       DISPLAY 'Loan Record Added Successfully.'
       STOP RUN.

