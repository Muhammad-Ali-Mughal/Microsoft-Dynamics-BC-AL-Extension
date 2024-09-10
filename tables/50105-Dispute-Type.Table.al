table 50105 "Dispute Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Provenance Disputed"; Enum "Provenance Disputed")
        {
            DataClassification = CustomerContent;

        }
        field(20; "Dispute Type Code"; Code[20])
        {
            DataClassification = CustomerContent;

        }
        field(30; "Discription Type Dispute"; Text[100])
        {
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(PK; "Dispute Type Code")
        {
            Clustered = true;
        }
    }
}