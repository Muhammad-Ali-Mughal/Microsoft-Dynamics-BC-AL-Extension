page 50108 "Vendor Dispute Lits"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Dispute Header";
    CardPageId = "Vendor Dispute";

    layout
    {
        area(Content)
        {
            repeater("Vendor Dispute")
            {
                field("Dispute No."; Rec."Dispute No.") { ApplicationArea = All; }
                field("Dispute Status"; Rec."Dispute Status") { ApplicationArea = All; }
                field("Vendor No"; Rec."Vendor No") { ApplicationArea = All; }
                field("Country Code"; Rec."Country Code") { ApplicationArea = All; }
                field("Created Date"; Rec."Created Date") { ApplicationArea = All; }
                field("Created By"; Rec."Created By") { ApplicationArea = All; }
                field("Document Type"; Rec."Document Type") { ApplicationArea = All; }
                field("Reference Document No"; Rec."Reference Document No") { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
            }
        }
    }
}