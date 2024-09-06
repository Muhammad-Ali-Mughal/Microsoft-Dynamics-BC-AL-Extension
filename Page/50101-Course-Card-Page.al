page 50101 "Cronus Course Card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CRONUS Course";


    layout
    {
        area(Content)
        {
            group("My Group Name")
            {
                Caption = 'Group';
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    trigger OnLookup(var text: Text): Boolean
                    var
                        Customer: Record Customer;
                    begin
                        if Page.RunModal(Page::"Customer Lookup", "Customer") = Action::LookupOK then begin
                            Rec."Customer No." := Customer.GetCustNo(Customer.Name);
                            Rec.Name := Customer.Name;
                            Rec."Name 2" := Customer."Name 2";
                            Rec.Address := Customer.Address;
                            Rec.Email := Customer."E-Mail";
                            Rec."Post Code" := Customer."Post Code";
                            Rec.Country := Customer.County;
                            Rec.State := Customer."State Inscription";
                            Rec."Shipment Method Code" := Customer."Shipment Method Code";
                            Rec."Payment Method Code" := Customer."Payment Method Code";
                        end;


                    end;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;

                }

                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    Importance = Additional;

                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;
                    Importance = Additional;

                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    Importance = Additional;

                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = All;
                    Importance = Additional;

                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                    Importance = Additional;

                }
                // field(CheckDisputes; Rec.CheckDisputes)
                // {
                //     ApplicationArea = All;
                //     trigger OnValidate()
                //     begin
                //         CheckDisputesFunc();
                //     end;
                // }

            }
            part(Content_Listpart; "Cronus Course ListPart")
            {
                Caption = 'ListPart';
                ApplicationArea = All;
                SubPageLink = "Doc No." = field(Code);
                UpdatePropagation = Both;
                Editable = Rec.Code <> '';
            }


        }
        area(FactBoxes)
        {
            part(Factbox_cardpart; "Cronus Course CardPart")
            {
                Caption = 'Code';
                ApplicationArea = All;
            }
            part(Factbox2_cardpart; "Cronus Course CardPart")
            {
                Caption = 'Fact Box 2';
                ApplicationArea = All;
            }

        }


    }

    actions
    {
        area(Processing)
        {
            action("Dispute Action")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    listTable: Record MyTable;
                begin
                    listTable.SetRange(Dispute, true);
                    if listTable.Dispute then
                        listTable.Delete()
                end;
            }
        }
    }




    trigger OnInsertRecord(Bol: Boolean): Boolean
    var
    begin
        GetNoSeries();
    end;

    procedure GetNoSeries(): Code[20]
    var
        NoSeries: Codeunit "NoSeriesManagement";
    begin
        if rec.Code = '' then
            rec.Code := NoSeries.GetNextNo('TEST', Today, true);
    end;

}

