page 50106 "Dispute Status"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Dispute Status";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Provenance Disputed"; Rec."Provenance Disputed") { ApplicationArea = All; }
                field("Dispute Status Code"; Rec."Dispute Status Code") { ApplicationArea = All; }
                field("Description Status Dispute"; Rec."Description Status Dispute") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print/Send")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}