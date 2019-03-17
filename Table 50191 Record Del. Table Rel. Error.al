table 50191 "Records Del. Table Rel. Error"
{
    DataClassification = ToBeClassified;

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
            CalcFormula = Lookup (Field.FieldName WHERE (TableNo = FIELD ("Table ID"), "No." = FIELD ("Field No.")));
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