page 50191 "Record Del. Table Rel. Error"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Records Del. Table Rel. Error";
    AccessByPermission = page "Record Del. Table Rel. Error" = x;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Table ID"; "Table ID")
                {
                    ApplicationArea = All;
                }
                field("Field No."; "Field No.")
                {
                    ApplicationArea = All;
                }
                field("Field Name"; "Field Name")
                {
                    ApplicationArea = All;
                }
                field(Error; Error)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}