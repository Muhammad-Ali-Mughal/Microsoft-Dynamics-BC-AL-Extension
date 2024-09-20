tableextension 50100 "Purchase Line Table Extension" extends "Purchase Line"
{
    fields
    {
        field(200; Dispute; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Dispute Lines" WHERE
                            (
                                "Reference Document No." = FIELD("Document No."),
                                "Reference Document Line" = FIELD("Line No.")
                            ));

        }

        field(201; "Dispute No."; Code[20])
        {
            FieldClass = FlowField;
            TableRelation = "Dispute Header";
            CalcFormula = lookup("Dispute Lines"."Dispute No." where
                            (
                                "Reference Document No." = FIELD("Document No."),
                                "Reference Document Line" = FIELD("Line No.")
                            ));
        }
        field(202; "Dispute Line No."; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dispute Lines"."Dispute Line No." where
                            (
                                "Reference Document No." = field("Document No."),
                                "Reference Document Line" = field("Line No.")
                            ));
        }
    }

    // purchase invoice sub

    keys { }

    fieldgroups { }

    var
}