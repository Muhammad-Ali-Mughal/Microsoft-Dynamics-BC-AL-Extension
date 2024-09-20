tableextension 50101 "Purchase Inv Line Extension" extends "Purch. Inv. Line"
{
    fields
    {
        field(200; Dispute; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Dispute Lines" where
                            (
                                "Reference Document No." = field("Document No."),
                                "Reference Document Line" = field("Line No.")
                            ));
        }
        field(201; "Dispute No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dispute Lines"."Dispute No." where
                            (
                                "Reference Document No." = field("Document No."),
                                "Reference Document Line" = field("Line No.")
                            ));
        }
        field(203; "Dispute Line No."; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dispute Lines"."Dispute Line No." where
                            (
                                "Reference Document No." = field("Document No."),
                                "Reference Document Line" = field("Line No.")
                            ));
        }
    }

    keys { }

    fieldgroups { }

    var
}