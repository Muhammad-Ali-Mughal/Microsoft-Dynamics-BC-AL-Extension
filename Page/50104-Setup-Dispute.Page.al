page 50104 "Setup Dispute"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Setup Dispute";
    Editable = true;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(All)
            {
                field("Enable Vendor Disputes"; Rec."Enable Vendor Disputes") { ApplicationArea = All; }
                field("Enable Write Cont. Vendors"; Rec."Enable Write Cont. Vendors") { ApplicationArea = All; }
                field("Dispute Series No."; Rec."Dispute Series No.") { ApplicationArea = All; }
                field("Type of Operation Returned Ord"; Rec."Type of Operation Returned Ord") { ApplicationArea = All; }
                field("Type of Operation Credit Notes"; Rec."Type of Operation Credit Notes") { ApplicationArea = All; }
                field("Minimum Amount Threshold"; Rec."Minimum Amount Threshold") { ApplicationArea = All; }
                field("E-Mail Text"; Rec."E-Mail Text") { ApplicationArea = All; }
                field("G/L Account Vendor Disputes"; Rec."G/L Account Vendor Disputes") { ApplicationArea = All; }
                field("Vendor Batch"; Rec."Vendor Batch") { ApplicationArea = All; }
                field("Vendor Template Name"; Rec."Vendor Template Name") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Nav_1)
            {
                Caption = 'Open Dispute Types';
                ApplicationArea = All;
                Image = Navigate;

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Dispute Type");
                end;
            }
            action(Nav_2)
            {
                Caption = 'Open Dispute Status';
                ApplicationArea = All;
                Image = Navigate;

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Dispute Status");
                end;
            }
            action(Nav_3)
            {
                Caption = 'Open Dispute Reason';
                ApplicationArea = All;
                Image = Navigate;
                trigger OnAction()
                begin
                    Page.RunModal(Page::"Dispute Reason");
                end;
            }
        }
    }
    var
}