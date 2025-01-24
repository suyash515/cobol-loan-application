       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUSTOMER-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUSTOMER-FILE ASSIGN TO 'CUSTOMER.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  CUSTOMER-FILE.
       01  CUSTOMER-REC.
           05  CUSTOMER-ID        PIC 9(5).
           05  CUSTOMER-NAME      PIC A(30).
           05  ADDRESS             PIC A(50).
           05  PHONE               PIC 9(15).
           05  LOAN-AMOUNT         PIC 9(7)V99.
           05  LOAN-BALANCE        PIC 9(7)V99.

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  CUSTOMER-ID            PIC 9(5).
       01  CUSTOMER-NAME          PIC A(30).
       01  ADDRESS                 PIC A(50).
       01  PHONE                   PIC 9(15).
       01  LOAN-AMOUNT             PIC 9(7)V99.
       01  LOAN-BALANCE            PIC 9(7)V99.
       01  END-OF-FILE            PIC X VALUE 'N'.

       PROCEDURE DIVISION.

       OPEN INPUT CUSTOMER-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file CUSTOMER-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Customer ID: '
       ACCEPT CUSTOMER-ID
       DISPLAY 'Enter Customer Name: '
       ACCEPT CUSTOMER-NAME
       DISPLAY 'Enter Address: '
       ACCEPT ADDRESS
       DISPLAY 'Enter Phone: '
       ACCEPT PHONE
       DISPLAY 'Enter Loan Amount: '
       ACCEPT LOAN-AMOUNT
       DISPLAY 'Enter Loan Balance: '
       ACCEPT LOAN-BALANCE

       WRITE CUSTOMER-REC

       CLOSE CUSTOMER-FILE
       DISPLAY 'Customer Record Added Successfully.'
       STOP RUN.

