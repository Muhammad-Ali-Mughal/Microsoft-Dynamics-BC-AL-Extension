table 50100 "CRONUS Course"
{
    Caption = 'Course';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(10; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            // TableRelation = Customer;
            // trigger OnValidate()
            // var
            //     customer: Record Customer;
            // begin
            //     if customer.get(Rec."Customer No.") then begin
            //         Rec.Name := customer.Name;
            //         Rec."Name 2" := customer."Name 2";
            //         Rec.Address := customer.Address;
            //         Rec.Email := customer."E-Mail";
            //         Rec."Post Code" := customer."Post Code";
            //     end;
            // end;

        }
        field(20; Name; Text[30])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(30; Address; Text[50])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }
        field(40; Email; Text[50])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        field(50; "Post Code"; Code[50])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;
        }
        field(60; Country; Text[50])
        {
            Caption = 'Country';
            DataClassification = CustomerContent;
        }
        field(70; State; Text[50])
        {
            Caption = 'State';
            DataClassification = CustomerContent;
        }
        field(80; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            DataClassification = CustomerContent;
        }
        field(90; "Shipment Method Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }
        field(100; "Payment Method Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Payment Method";
        }
        field(110; CheckDisputes; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // field(70; Type; Option)
        // {
        //     Caption = 'Type';
        //     DataClassification = CustomerContent;
        //     OptionMembers = "Instructor Led; e-Learning; Remote Training";
        //     OptionCaption = 'Instructor Led, e-Learning, Remote Training';
        // }
        // field(50; Duration; Decimal)
        // {
        //     Caption = 'Duration';
        //     DataClassification = CustomerContent;
        // }
        // field(60; Active; Boolean)
        // {
        //     Caption = 'Active';
        //     DataClassification = CustomerContent;
        // }
        // field(70; Difficulty; Integer)
        // {
        //     Caption = 'Difficulty';
        //     DataClassification = CustomerContent;
        // }
        // field(80; "Passign Rate"; Integer)
        // {
        //     Caption = 'Passing Rate';
        //     DataClassification = CustomerContent;
        // }
        // field(90; "Instructor Code"; Code[20])
        // {
        //     Caption = 'Instructor Code';
        //     DataClassification = CustomerContent;
        //     TableRelation = "Resource" where(Type = const(Person));
        // }

    }

    keys
    {
        key("PK"; Code, Name)
        {
            Clustered = true;
        }
    }

}