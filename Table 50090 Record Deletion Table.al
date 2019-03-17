table 50190 "Record Deletion Table"
{
    DataClassification = ToBeClassified;
    PasteIsValid = true;

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
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE ("Object Type" = CONST (Table), "Object ID" = FIELD ("Table ID")));
        }
        field(3; "No. of Records"; Integer)
        {
            Editable = false;
        }
        field(4; "No. of Table Relation Errors"; Integer)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Count ("Records Del. Table Rel. Error" WHERE ("Table ID" = FIELD ("Table ID")));
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