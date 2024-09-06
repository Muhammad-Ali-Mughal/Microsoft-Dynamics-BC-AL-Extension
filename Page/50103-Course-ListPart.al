page 50103 "Cronus Course ListPart"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "MyTable";
    layout
    {
        area(Content)
        {
            repeater(ListPart)
            {
                field("Doc No."; Rec."Doc No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CalcLineAmount();
                    end;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CalcLineAmount();
                    end;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                }
                field(Dispute; Rec.Dispute)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    procedure CalcLineAmount(): Integer
    var
        total: Integer;
    begin
        Rec."Line Amount" := Rec.Quantity * Rec."Unit Price";
    end;
}