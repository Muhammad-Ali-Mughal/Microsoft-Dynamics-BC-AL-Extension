page 50100 "Cronus Course List Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CRONUS Course";
    CardPageId = "Cronus Course Card Page";

    layout
    {
        area(Content)
        {
            repeater(Hello)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
            part(List_page_factbox; "Cronus Course CardPart")
            {
                Caption = 'List Page Fact Box';
                ApplicationArea = All;
            }
        }
    }
}