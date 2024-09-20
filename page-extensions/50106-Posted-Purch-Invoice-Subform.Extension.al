pageextension 50106 "Posted Purch Inv Subform Ext" extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(Dispute; Rec.Dispute)
            {
                ApplicationArea = All;
                Enabled = false;

            }
            field("Dispute No."; Rec."Dispute No.")
            {
                ApplicationArea = All;
                Enabled = true;
            }
            field("Dispute Line No."; Rec."Dispute Line No.")
            {
                ApplicationArea = All;
                Enabled = false;
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    var
    begin
        CheckVisibility();
    end;

    local procedure CheckVisibility()
    var
    begin
        "Setup Dispute".Get();
        // if "Setup Dispute".FindSet() then
        Visibility := "Setup Dispute"."Enable Vendor Disputes";
    end;

    var
        "Setup Dispute": Record "Setup Dispute";
        Visibility: Boolean;
}