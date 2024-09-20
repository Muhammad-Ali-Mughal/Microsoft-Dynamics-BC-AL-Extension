report 50104 "Posted Purchase Invoice Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './layouts/Posted Purchase Invoice Report.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            column(Vendor_Invoice_No_; "Vendor Invoice No.") { }
            column(Posting_Date; "Posting Date") { }

            // Pay-to
            column(Pay_to_Name; "Pay-to Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_Post_Code; "Pay-to Post Code") { }
            column(Pay_to_City; "Pay-to City") { }
            column(Pay_to_Country_Region; "Pay-to Country/Region") { }

            // Ship-to
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Post_Code; "Ship-to Post Code") { }
            column(Ship_to_Country_Region; "Ship-to Country/Region") { }

            // Other details
            column(Ship_Via; "Shipment Method") { }
            column(Expected_Receipt_Date; "Expected Receipt Date") { }
            column(Payment_Terms; "Payment Terms") { }
            column(Buyer; Buyer) { }
            column(Tax_ident_type; Tax_ident_type) { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Order_No_; "Order No.") { }
            column(Order_Date; "Order Date") { }

            // Table
            column(Currency_Code; "Currency Code") { }

            // Discount
            column(Invoice_Discount_Amount; "Invoice Discount Amount") { }

            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(No_; "No.") { }
                column(Description; Description) { }
                column(Line_Discount__; "Line Discount %") { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Quantity; Quantity) { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Tax_Group_Code; "Tax Group Code") { }
                column(Amount_Including_VAT; "Amount Including VAT") { }

                // Tax
                column(Total_Tax; ("Amount Including VAT" - "VAT Base Amount")) { }
            }

            trigger OnAfterGetRecord()
            var
                country_region: Record "Country/Region";
                Shipment_Method: Record "Shipment Method";
                Payment_Terms: Record "Payment Terms";
                Purchaser: Record "Salesperson/Purchaser";
                Vendor: Record Vendor;
            begin
                // Pay-to Country/Region
                country_region.SetRange(Code, "Purch. Inv. Header"."Pay-to Country/Region Code");
                if country_region.FindSet() then "Pay-to Country/Region" := country_region.Name;

                // Ship-to Country/Region
                country_region.SetRange(Code, "Purch. Inv. Header"."Ship-to Country/Region Code");
                if country_region.FindSet() then "Ship-to Country/Region" := country_region.Name;

                // Shipment Method
                Shipment_Method.SetRange(Code, "Purch. Inv. Header"."Shipment Method Code");
                if Shipment_Method.FindSet() then "Shipment Method" := Shipment_Method.Description;

                // Payment Terms
                Payment_Terms.SetRange(Code, "Purch. Inv. Header"."Payment Terms Code");
                if Payment_Terms.FindSet() then "Payment Terms" := Payment_Terms.Description;

                // Buyer
                Purchaser.SetRange(Code, "Purch. Inv. Header"."Purchaser Code");
                if Purchaser.FindSet() then Buyer := Purchaser.Name;

                // Tax Ident. Type
                Vendor.SetRange("Purchaser Code", "Purch. Inv. Header"."Purchaser Code");
                if Vendor.Findset() then Tax_ident_type := Vendor."Tax Identification Type";
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                // group(GroupName)
                // {
                //     field(Name; SourceExpression)
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

    var
        "Pay-to Country/Region": Text;
        "Ship-to Country/Region": Text;
        "Shipment Method": Text;
        "Payment Terms": Text;
        Buyer: Text;
        Tax_ident_type: Option;
}