page 50000 PerformanceTesting
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            field(LblLegacyCode; LegacyCodeLbl)
            {
                ApplicationArea = All;
                Caption = 'Legacy Code';
                ToolTip = 'Executes the Legacy Code';
                trigger OnDrillDown()
                begin
                    PerformanceTesting.LegacyCode();
                end;
            }

            field(LblAutoCalcFields; AutoCalcFieldsLbl)
            {
                ApplicationArea = All;
                Caption = 'Legacy Code - With Auto CalcFields';
                ToolTip = 'Executes the Legacy Code - With Auto CalcFields';
                trigger OnDrillDown()
                begin
                    PerformanceTesting.LegacyCodewithAutoCalcFields();
                end;
            }
            field(LblPartialRecords; PartialRecordsLbl)
            {
                ApplicationArea = All;
                Caption = 'Legacy Code - With Partial Records';
                ToolTip = 'Executes the Legacy Code - With Partial Records';
                trigger OnDrillDown()
                begin
                    PerformanceTesting.LegacyCodewithPartialRecords();
                end;
            }
        }
    }

    var
        LegacyCodeLbl: Label 'Legacy Code';
        AutoCalcFieldsLbl: Label 'Legacy Code - With Auto CalcFields';
        PartialRecordsLbl: Label 'Legacy Code - With Partial Records';
        PerformanceTesting: Codeunit PerformanceTesting;
}