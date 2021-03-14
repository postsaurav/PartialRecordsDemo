page 50000 PerformanceTesting
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;

    actions
    {
        area(Processing)
        {
            action(TestLoop)
            {
                ApplicationArea = All;
                Caption = 'Calculate Totals';
                ToolTip = 'Calculate Totals';
                Image = Totals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = codeunit PerformanceTesting;
            }
        }
    }
}