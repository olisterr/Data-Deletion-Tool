report 50199 DataDeletionTool
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Filtered Data Deletion';
    Permissions = TableData "17" = IMD, Tabledata "36" = IMD, Tabledata "37" = IMD, Tabledata "38" = IMD, Tabledata "39" = IMD, Tabledata "81" = IMD, Tabledata "21" = IMD, Tabledata "25" = IMD, Tabledata "32" = IMD, Tabledata "110" = IMD, TableData "111" = IMD, TableData "112" = IMD, TableData "113" = IMD, TableData "114" = IMD, TableData "115" = IMD, TableData "120" = IMD, Tabledata "121" = IMD, Tabledata "122" = IMD, Tabledata "123" = IMD, Tabledata "124" = IMD, Tabledata "125" = IMD, Tabledata "169" = IMD, Tabledata "379" = IMD, Tabledata "380" = IMD, Tabledata "271" = IMD, Tabledata "5802" = IMD, tabledata "6650" = IMD, tabledata "6660" = IMD;


    dataset
    {
        dataitem(DataItemName; "Company Information")
        {

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    Caption = 'Filters';
                    field(TableNo; TableNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Table No.';
                        trigger OnDrillDown()
                        var
                            RecAllObjects: Record AllObjWithCaption;
                            PageAllObjectst: Page "All Objects with Caption";
                        begin
                            Clear(RecAllObjects);
                            Clear(PageAllObjectst);
                            RecAllObjects.SetRange("Object Type", RecAllObjects."Object Type"::Table);
                            IF RecAllObjects.FindSet() then begin
                                PageAllObjectst.LookupMode := true;
                                PageAllObjectst.SetTableView(RecAllObjects);
                                PageAllObjectst.SetRecord(RecAllObjects);
                                IF PageAllObjectst.RunModal() = Action::LookupOK then begin
                                    PageAllObjectst.GetRecord(RecAllObjects);
                                    TableNo := RecAllObjects."Object ID";
                                    TableName := RecAllObjects."Object Name";
                                end;
                            end;

                        end;

                        trigger OnValidate()
                        var
                            RecAllObjects: Record AllObjWithCaption;
                        begin
                            Clear(RecAllObjects);
                            RecAllObjects.Reset();
                            RecAllObjects.SetRange("Object ID", TableNo);
                            IF RecAllObjects.FindFirst() then
                                TableName := RecAllObjects."Object Name";
                        end;
                    }
                    field(TableName; TableName)
                    {
                        ApplicationArea = All;
                        Editable = false;
                        Caption = 'Table Name';
                    }
                    field(PrimaryKeyFilter1; PrimaryKeyFilter1)
                    {
                        ApplicationArea = All;
                        Caption = 'Primary Key';
                        ToolTip = 'Primary key for the record    Click on |...| (Assist Edit) to browse the table';

                        trigger OnAssistEdit()
                        var
                            BrowseLink: Text;
                        begin
                            BrowseLink := 'https://businesscentral.dynamics.com/?table=' + FORMAT(TableNo);
                            Hyperlink(BrowseLink);
                        end;
                    }
                    field(PrimaryKeyFilter2; PrimaryKeyFilter2)
                    {
                        ApplicationArea = All;
                        Caption = 'Key 2';
                        ToolTip = 'Second Composite Key for the record';
                    }
                    field(PrimaryKeyFilter3; PrimaryKeyFilter3)
                    {
                        ApplicationArea = All;
                        Caption = 'Key 3';
                        ToolTip = 'Third Composite Key for the record';
                    }

                }
            }
        }
    }

    var
        TableNo: Integer;
        TableName: Text;
        PrimaryKeyFilter1: Text;
        PrimaryKeyFilter2: Text;
        PrimaryKeyFilter3: Text;
        RecRef: RecordRef;
        FldRef: FieldRef;
        KeyRefer: KeyRef;
        KeyIndex: Integer;

    trigger OnPostReport()
    begin
        //FetchRecord(37, 'Order', 'SO10041', '2000');
        if TableNo = 0 then
            Error('Table No. value cannot be blank');
        if PrimaryKeyFilter1 = '' then
            Error('Primary Key value cannot be blank');
        FetchRecord(TableNo, PrimaryKeyFilter1, PrimaryKeyFilter2, PrimaryKeyFilter3);
    end;

    local procedure FetchRecord(TableNo: Integer; Pk1: Text; Pk2: Text; Pk3: Text);
    var
        i: Integer;
        PK: array[3] of Text;
        DeleteConfirm: Text;
    begin
        PK[1] := Pk1;
        PK[2] := Pk2;
        PK[3] := Pk3;
        DeleteConfirm := 'Do you want to delete the following record? \';
        Clear(RecRef);
        Clear(FldRef);
        Clear(KeyRefer);
        RecRef.Open(TableNo);
        RecRef.SetRecFilter();
        KeyRefer := RecRef.KeyIndex(1);
        for i := 1 TO KeyRefer.FieldCount() do begin
            FldRef := KeyRefer.FieldIndex(i);
            IF PK[i] <> '' then
                FldRef.SetFilter(PK[i]);
        end;
        IF RecRef.FindSet() then begin
            DeleteConfirm := DeleteConfirm + Format(RecRef);
            repeat
                IF RecRef.Count = 1 then begin
                    IF Confirm(DeleteConfirm) then begin
                        RecRef.Delete();
                        Message('Record is deleted!')
                    end;
                end
                /*else begin
                    IF Confirm('Do you want to bulk delete all the records?') then begin
                        RecRef.DeleteAll();
                        Message('Records are deleted!');
                    end;
                end;*/

            until RecRef.Next() = 0;
        end;
        RecRef.Close();
    end;

    procedure GetTableNo(TableNumber: Integer)
    begin
        TableNo := TableNumber;
    end;

}