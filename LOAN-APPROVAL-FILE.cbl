       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOAN-APPROVAL-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT LOAN-APPROVAL-FILE ASSIGN TO 'LOAN_APPROVAL.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  LOAN-APPROVAL-FILE.
       01  LOAN-APPROVAL-REC.
           05  LOAN-ID            PIC 9(5).
           05  CUSTOMER-ID        PIC 9(5).
           05  APPROVAL-DATE      PIC 9(8).
           05  APPROVED-LOAN-AMOUNT PIC 9(7)V99.
           05  TERMS              PIC A(50).

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  LOAN-ID                PIC 9(5).
       01  CUSTOMER-ID            PIC 9(5).
       01  APPROVAL-DATE          PIC 9(8).
       01  APPROVED-LOAN-AMOUNT   PIC 9(7)V99.
       01  TERMS                  PIC A(50).

       PROCEDURE DIVISION.

       OPEN INPUT LOAN-APPROVAL-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file LOAN-APPROVAL-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Loan ID: '
       ACCEPT LOAN-ID
       DISPLAY 'Enter Customer ID: '
       ACCEPT CUSTOMER-ID
       DISPLAY 'Enter Approval Date (YYYYMMDD): '
       ACCEPT APPROVAL-DATE
       DISPLAY 'Enter Approved Loan Amount: '
       ACCEPT APPROVED-LOAN-AMOUNT
       DISPLAY 'Enter Loan Terms: '
       ACCEPT TERMS

       WRITE LOAN-APPROVAL-REC

       CLOSE LOAN-APPROVAL-FILE
       DISPLAY 'Loan Approval Record Added Successfully.'
       STOP RUN.

