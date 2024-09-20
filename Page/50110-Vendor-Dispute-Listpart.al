page 50110 "Vendor Dispute Listpart"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Dispute Lines";

    layout
    {
        area(Content)
        {
            repeater("Vendor Dispute Lines")
            {
                field("Provenance Disputed"; Rec."Provenance Disputed") { ApplicationArea = All; }
                field("Dispute No."; Rec."Dispute No.") { ApplicationArea = All; }
                field("Document Type"; Rec."Document Type") { ApplicationArea = All; }
                field("Item No"; Rec."Item No") { ApplicationArea = All; }
                field("Line Description"; Rec."Line Description") { ApplicationArea = All; }
                field("Base Unit of Measure"; Rec."Base Unit of Measure") { ApplicationArea = All; }
                field("Basic Quantity"; Rec."Basic Quantity") { ApplicationArea = All; }
                field("Unit of Measure"; Rec."Unit of Measure") { ApplicationArea = All; }
                field("Quantity Per Unit of Measure"; Rec."Quantity Per Unit of Measure") { ApplicationArea = All; }
                field("Unit Price"; Rec."Unit Price") { ApplicationArea = All; }
                field("Modified UserId"; Rec."Modified UserId") { ApplicationArea = All; }
                field("DateTime Moified"; Rec."DateTime Moified") { ApplicationArea = All; }
                field("Dispute Reason"; Rec."Dispute Reason")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        "Dispute Reason": Record "Dispute Reason";
                    begin
                        "Dispute Reason".Get(Rec."Dispute Reason");
                        Rec."Dispute Type" := "Dispute Reason"."Dispute Type";
                        Rec."Dispute Description" := "Dispute Reason"."Dispute Description";
                        Rec."Document to be Created" := "Dispute Reason"."Document to be Generated";
                        Rec."Returned Order Reason" := "Dispute Reason"."Return Reason";
                        Rec."Returned Order Location" := "Dispute Reason"."Return Location Code";
                    end;
                }
                field("Dispute Type"; Rec."Dispute Type") { ApplicationArea = All; }
                field("Dispute Item No."; Rec."Dispute Item No.") { ApplicationArea = All; }
                field("Dispute Measure Unit"; Rec."Dispute Measure Unit") { ApplicationArea = All; }
                field("Dispute Quantity"; Rec."Dispute Quantity") { ApplicationArea = All; }
                field("Dispute Unit Price"; Rec."Dispute Unit Price") { ApplicationArea = All; }
                field("Dispute Amount"; Rec."Dispute Amount") { ApplicationArea = All; }
                field("Dispute Location"; Rec."Dispute Location") { ApplicationArea = All; }
                field("Dispute Return Quantity"; Rec."Dispute Return Quantity") { ApplicationArea = All; }
                field("Dispute Description"; Rec."Dispute Description") { ApplicationArea = All; }
                field("Document to be Created"; Rec."Document to be Created") { ApplicationArea = All; }
                field("Line Type"; Rec."Line Type") { ApplicationArea = All; }
                field("Returned Order Reason"; Rec."Returned Order Reason") { ApplicationArea = All; }
                field("Reason for Credit Note"; Rec."Reason for Credit Note") { ApplicationArea = All; }
                field("Returned Order Location"; Rec."Returned Order Location") { ApplicationArea = All; }
            }
        }
    }
}