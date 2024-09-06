report 50103 "Sale Invoice Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './layouts/Sale Invoice Report.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(companyName; Company.Name) { }
            column(companyAddress; Company.Address) { }
            column(companyAddress2; Company."Address 2") { }
            column(companyCity; Company.City) { }
            column(companyState; Company.County) { }
            column(companyCountry; Company."Country/Region Code") { }
            column(companyPostCode; Company."Post Code") { }
            column(companyPhone; Company."Phone No.") { }
            column(companyEMail; Company."E-Mail") { }
            column(companyPicture; Company.Picture) { }

            column(No_; "No.") { }
            column(Document_Date; "Document Date") { }
            column(Payment_Terms_Code; PaymentTermsCodeDes) { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_County; "Bill-to County") { }
            column(Bill_to_Post_Code; "Bill-to Post Code") { }
            column(TotalAmount; TotalAmountText) { }
            //column(Sales_Amount_Including_VAT; Rec."Amount Including VAT") { }
            //column(Work_Description; Rec."Work Description") { }

            dataitem(Sales_Invoice_Line; "Sales Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Description; "Description 2") { }
                column(Amount_Including_VAT; "Amount Including VAT") { }
            }
            trigger OnAfterGetRecord()
            var
                PaymentTerms: Record "Payment Terms";
                SalesLines: Record "Sales Line";
            begin
                PaymentTerms.SetRange(Code, "Sales Header"."Payment Terms Code");
                if PaymentTerms.FindSet() then begin
                    PaymentTermsCodeDes := PaymentTerms.Description;
                end;

                SalesLines.SetRange("Document No.", "Sales Header"."No.");
                if SalesLines.FindSet() then begin
                    TotalAmount += SalesLines."Amount Including VAT";
                    TotalAmountText := NumberToWords(Round(TotalAmount, 1, '='));
                end;
            end;
        }
    }

    requestpage
    {
        SourceTable = "Sales Header";
        layout
        {
            area(Content)
            {
                // group(Filters)
                // {
                //     field("No."; Rec."No.")
                //     {
                //         ApplicationArea = All;

                //     }
                //     field("Document Type"; Rec."Document Type")
                //     {
                //         ApplicationArea = All;

                //     }
                //     field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                //     {
                //         ApplicationArea = All;

                //     }
                // }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }

    trigger OnInitReport()
    var
    begin
        Company.Get();
        Company.CalcFields(Picture);
    end;

    procedure NumberToWords(Number: Decimal): Text
    var
        Units: array[20] of Text[15];
        Tens: array[10] of Text[15];
    begin
        Units[1] := 'One';
        Units[2] := 'Two';
        Units[3] := 'Three';
        Units[4] := 'Four';
        Units[5] := 'Five';
        Units[6] := 'Six';
        Units[7] := 'Seven';
        Units[8] := 'Eight';
        Units[9] := 'Nine';
        Units[10] := 'Ten';
        Units[11] := 'Eleven';
        Units[12] := 'Twelve';
        Units[13] := 'Thirteen';
        Units[14] := 'Fourteen';
        Units[15] := 'Fifteen';
        Units[16] := 'Sixteen';
        Units[17] := 'Seventeen';
        Units[18] := 'Eighteen';
        Units[19] := 'Nineteen';

        Tens[2] := 'Twenty';
        Tens[3] := 'Thirty';
        Tens[4] := 'Forty';
        Tens[5] := 'Fifty';
        Tens[6] := 'Sixty';
        Tens[7] := 'Seventy';
        Tens[8] := 'Eighty';
        Tens[9] := 'Ninety';

        if Number = 0 then
            exit('');

        if Number < 20 then
            exit(Units[Number])
        else
            if Number < 100 then
                exit(Tens[Number div 10] + ' ' + NumberToWords(Number mod 10))
            else
                if Number < 1000 then
                    exit(NumberToWords(Number div 100) + ' Hundred ' + NumberToWords(Number mod 100))
                else
                    if Number < 1000000 then
                        exit(NumberToWords(Number div 1000) + ' Thousand ' + NumberToWords(Number mod 1000))
                    else
                        if Number < 1000000000 then
                            exit(NumberToWords(Number div 1000000) + ' Million ' + NumberToWords(Number mod 1000000))
                        else
                            exit(NumberToWords(Number div 1000000000) + ' Billion ' + NumberToWords(Number mod 1000000000));
    end;

    var
        Company: Record "Company Information";
        PaymentTermsCodeDes: Text[20];
        TotalAmount: Decimal;
        TotalAmountText: Text[100];
}