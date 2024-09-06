report 50101 "Customer Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    RDLCLayout = './layouts/Customer Report.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(CustomerTable; Customer)
        {
            column(companyName; companyInfo.Name)
            { }
            column(companyAddress; companyInfo.Address)
            { }
            column(companyAddress2; companyInfo."Address 2")
            { }
            column(companyCity; companyInfo.City)
            { }
            column(companyState; companyInfo."State Inscription")
            { }
            column(companyZip; companyInfo."Post Code")
            { }
            column(companyCountry; companyInfo."Country/Region Code")
            { }
            column(companyPicture; companyInfo.Picture)
            { }
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Address; Address)
            {
                IncludeCaption = true;
            }
            column(CurrencyCode; "Currency Code")
            {
                IncludeCaption = true;
            }
            column(Balance; Balance)
            {
                IncludeCaption = true;
            }
            column(CountryRegionCode; "Country/Region Code")
            {
                IncludeCaption = true;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Customer Report")
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }


    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }


    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        companyInfo.get();
        companyInfo.CalcFields(Picture);
    end;


    var
        companyInfo: Record "Company Information";
}