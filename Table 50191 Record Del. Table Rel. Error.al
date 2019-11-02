table 50191 "Records Del. Table Rel. Error"
{
    DataClassification = ToBeClassified;
    Permissions = TableData "17" = IMD, Tabledata "36" = IMD, Tabledata "37" = IMD, Tabledata "38" = IMD, Tabledata "39" = IMD, Tabledata "81" = IMD, Tabledata "21" = IMD, Tabledata "25" = IMD, Tabledata "32" = IMD, Tabledata "110" = IMD, TableData "111" = IMD, TableData "112" = IMD, TableData "113" = IMD, TableData "114" = IMD, TableData "115" = IMD, TableData "120" = IMD, Tabledata "121" = IMD, Tabledata "122" = IMD, Tabledata "123" = IMD, Tabledata "124" = IMD, Tabledata "125" = IMD, Tabledata "169" = IMD, Tabledata "379" = IMD, Tabledata "380" = IMD, Tabledata "271" = IMD, Tabledata "5802" = IMD, tabledata "6650" = IMD, tabledata "6660" = IMD;


    fields
    {
        field(1; "Table ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Entry No."; Integer)
        {

        }
        field(3; "Field No."; Integer)
        {

        }
        field(4; "Field Name"; Text[30])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup (Field.FieldName WHERE(TableNo = FIELD("Table ID"), "No." = FIELD("Field No.")));
        }
        field(5; Error; Text[250])
        {

        }
    }

    keys
    {
        key(PK; "Table ID", "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}