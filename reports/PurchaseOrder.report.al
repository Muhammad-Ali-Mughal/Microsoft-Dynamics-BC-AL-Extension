report 50102 "Purchase Order Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    RDLCLayout = './layouts/Purchase Order Report.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            // PrintOnlyIfDetail = true;

            DataItemTableView = sorting("No.", "Document Type");
            column(CompanyName; companyInfo.Name) { }
            column(CompanyAddress; companyInfo.Address) { }
            column(CompanyAddress2; companyInfo."Address 2") { }
            column(CompanyCountry; companyInfo."Country/Region Code") { }
            column(CompanyPicture; companyInfo.Picture) { }

            column(PONumber; "No.") { }
            column(POVendor; "Buy-from Vendor Name") { }
            column(POContact; "Pay-to Contact") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Pay_to_County; "Pay-to County") { }
            column(Pay_to_Post_Code; "Pay-to Post Code") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Post_Code; "Ship-to Post Code") { }
            column(Promised_Receipt_Date; "Promised Receipt Date") { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.") { }
            column(Vendor_Order_No_; "Vendor Order No.") { }
            column(PaymentDescription; PaymentDescription) { }
            column(ShipmentDescription; ShipmentDescription) { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(No_; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Volume; "Unit of measure") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Amount_Including_VAT; "Amount Including VAT") { }
                column(Line_Discount_Amount; "Line Discount Amount") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Tax; ("Amount Including VAT" - "VAT Base Amount")) { }

            }
            trigger OnAfterGetRecord()
            var
                PaymentMethod: Record "Payment Terms";
                ShipmentMethod: Record "Shipment Method";
                ReportCheck: Report Check;
            begin
                PaymentMethod.SetRange(Code, "Purchase Header"."Payment Terms Code");
                if PaymentMethod.FindSet() then begin
                    PaymentDescription := PaymentMethod.Description;
                end;

                ShipmentMethod.SetRange(Code, "Purchase Header"."Shipment Method Code");
                if ShipmentMethod.FindSet() then begin
                    ShipmentDescription := ShipmentMethod.Description;
                end;

            end;


        }
    }

    requestpage
    {
        SourceTable = "Purchase Header";
        layout
        {
            area(Content)
            {
                group(PurchaseOrderRequestPage)
                {
                    Caption = 'Filter Purchase Order: ';
                    field("Document Type"; Rec."Document Type")
                    {
                        ApplicationArea = All;

                    }
                    field("No."; Rec."No.")
                    {
                        ApplicationArea = All;

                    }
                    field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                    {
                        ApplicationArea = All;
                        TableRelation = "Purchase Header";
                    }
                }
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
        companyInfo.Get();
        companyInfo.CalcFields(Picture);
    end;

    var
        companyInfo: Record "Company Information";
        PaymentDescription: Text[100];
        ShipmentDescription: Text[100];
}