page 50107 "Dispute Reason"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Dispute Reason";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Provenance Disputed"; Rec."Provenance Disputed") { ApplicationArea = All; }
                field("Casual Complaint"; Rec."Casual Complaint") { ApplicationArea = All; }
                field("Item Charge"; Rec."Item Charge") { ApplicationArea = All; }
                field("Returned Order Reason"; Rec."Returned Order Reason") { ApplicationArea = All; }
                field("Reason for Purchase Order"; Rec."Reason for Purchase Order") { ApplicationArea = All; }
                field("Casual Generic Dispute"; Rec."Casual Generic Dispute") { ApplicationArea = All; }
                field("Return Reason"; Rec."Return Reason") { ApplicationArea = All; }
                field("Return Location Code"; Rec."Return Location Code") { ApplicationArea = All; }
                field("Note for Location Code"; Rec."Note for Location Code") { ApplicationArea = All; }
                field("Dispute Description"; Rec."Dispute Description") { ApplicationArea = All; }
                field("Document to be Generated"; Rec."Document to be Generated") { ApplicationArea = All; }
                field("Return Required"; Rec."Return Required") { ApplicationArea = All; }
                field("Dispute Type"; Rec."Dispute Type") { ApplicationArea = All; }
                field("Line Type"; Rec."Line Type") { ApplicationArea = All; }
                field("Decimal Threshold"; Rec."Decimal Threshold") { ApplicationArea = All; }
                field(Visible; Rec.Visible) { ApplicationArea = All; }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}