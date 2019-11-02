table 50190 "Record Deletion Table"
{
    DataClassification = ToBeClassified;
    PasteIsValid = true;
    Permissions = TableData "17" = IMD, Tabledata "36" = IMD, Tabledata "37" = IMD, Tabledata "38" = IMD, Tabledata "39" = IMD, Tabledata "81" = IMD, Tabledata "21" = IMD, Tabledata "25" = IMD, Tabledata "32" = IMD, Tabledata "110" = IMD, TableData "111" = IMD, TableData "112" = IMD, TableData "113" = IMD, TableData "114" = IMD, TableData "115" = IMD, TableData "120" = IMD, Tabledata "121" = IMD, Tabledata "122" = IMD, Tabledata "123" = IMD, Tabledata "124" = IMD, Tabledata "125" = IMD, Tabledata "169" = IMD, Tabledata "379" = IMD, Tabledata "380" = IMD, Tabledata "271" = IMD, Tabledata "5802" = IMD, tabledata "6650" = IMD, tabledata "6660" = IMD;


    fields
    {
        field(1; "Table ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                //TryGetRecordCount(Rec);
            end;
        }
        field(2; "Table Name"; Text[250])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE("Object Type" = CONST(Table), "Object ID" = FIELD("Table ID")));
        }
        field(3; "No. of Records"; Integer)
        {
            Editable = false;
        }
        field(4; "No. of Table Relation Errors"; Integer)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Count ("Records Del. Table Rel. Error" WHERE("Table ID" = FIELD("Table ID")));
        }
        field(5; "Delete Records"; Boolean)
        {

        }
        field(6; Company; Text[30])
        {
            Editable = false;

        }
    }

    keys
    {
        key(PK; "Table ID")
        {
            Clustered = true;
        }
    }

    var
        Rec_AllObjWithCaption: Record AllObjWithCaption;

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