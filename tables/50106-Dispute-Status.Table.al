table 50106 "Dispute Status"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Provenance Disputed"; Enum "Provenance Disputed")
        {
            DataClassification = CustomerContent;
        }
        field(20; "Dispute Status Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(30; "Description Status Dispute"; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Dispute Status Code")
        {
            Clustered = true;
        }
    }
}