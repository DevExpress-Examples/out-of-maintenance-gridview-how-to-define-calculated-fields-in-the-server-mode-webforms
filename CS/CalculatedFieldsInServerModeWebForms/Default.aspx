<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CalculatedFieldsInServerModeWebForms.Default" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculated Fields in the Server Mode</title>
    <style type="text/css">
        .grid-container {
            padding: 2em 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Calculated Fields in the Server Mode
        </h1>

        <blockquote>
            <p>
                In this example we demonstrate how you can implement calculated fields when the GridView extension
                <br />
                is bound to a Server Mode data source.
            </p>

            <p>
                On the side of the SQL server you need to use a Table-Value function and implement all calculated fields there.
                <br />
                See the <a href="https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/sql/linq/how-to-use-table-valued-user-defined-functions">How to: Use Table-Valued User-Defined Functions</a> link to learn more about Table-Valued functions.
            </p>
            <div class="grid-container">
                <dx:ASPxGridView ID="GridView" ClientInstanceName="GridView" runat="server" KeyFieldName="Id" DataSourceID="EntityServerModeDataSource1">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Id"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ProductName"></dx:GridViewDataTextColumn>

                        <dx:GridViewDataDateColumn FieldName="ProductionDate"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataSpinEditColumn FieldName="ProductPrice" PropertiesSpinEdit-DisplayFormatString="c"></dx:GridViewDataSpinEditColumn>
                        <dx:GridViewDataSpinEditColumn FieldName="UnitsInStock"></dx:GridViewDataSpinEditColumn>
                        <dx:GridViewDataSpinEditColumn FieldName="ProductStockSumProce"
                            UnboundExpression="[ProductPrice] * [UnitsInStock]"
                            UnboundType="Decimal"
                            PropertiesSpinEdit-DisplayFormatString="c">
                        </dx:GridViewDataSpinEditColumn>
                        <dx:GridViewDataDateColumn FieldName="ProductExpiresDate"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataSpinEditColumn FieldName="DaysUntilExpires"></dx:GridViewDataSpinEditColumn>
                    </Columns>

                    <Settings ShowFilterRow="true" ShowHeaderFilterButton="true" />
                    <FormatConditions>
                        <dx:GridViewFormatConditionColorScale
                            FieldName="DaysUntilExpires"
                            Format="GreenYellowRed" />
                    </FormatConditions>
                </dx:ASPxGridView>
                <dx:EntityServerModeDataSource ID="EntityServerModeDataSource1" runat="server" OnSelecting="EntityServerModeDataSource1_Selecting" />
            </div>
            <div style="padding-top: 1rem">
                In the provided GridView extension only the following fields come from the [Products] table as-is: <i>[Id], [ProductName], [ProductionDate], [ProductPrice], [UnitsInStock]</i>.
                <br />
                Other fields are calculated in the following manner:
        <ul>
            <li style="margin-top: 0.5em;">
                <i>Product Expires Date</i>
                <p>
                    This field is calculated on the SQL server side based on the value passed into the SQL function and the value in the <i>[ProductionDate]</i> field.
                </p>
                <code>DATEADD(day, @@daysExpiresOffset, ProductionDate) as ProductExpiresDate
                </code>
            </li>
            <li style="margin-top: 0.5em;">
                <i>Days Until Expires</i>
                <p>
                    This field is calculated on the SQL server side based on the current date value passed into the SQL function and the value in the <i>[ProductExpiresDate]</i> field.
                </p>
                <code>DATEDIFF(day, @@currentDate, p.ProductExpiresDate) as DaysUntilExpires
                </code>
            </li>
            <li style="margin-top: 0.5em;">
                <i>Product Stock Sum Price</i>
                <p>
                    This field is calculated using the built-in Criteria Language Syntax based on the values of the <i>[ProductPrice]</i> and <i>[UnitsInStock]</i> fields.<br />
                    See the <a href="https://documentation.devexpress.com/CoreLibraries/4928/DevExpress-Data-Library/Criteria-Language-Syntax">Criteria Language Syntax</a> and <a href="https://documentation.devexpress.com/WindowsForms/6211/Common-Features/Expressions">Unbount Expressions</a> documentation articles to learn more about this approach.
                </p>
                <code>
                    <pre>
settings.Columns.Add(col => {
    col.FieldName = "ProductStockSumProce";
    col.UnboundExpression = "[ProductPrice] * [UnitsInStock]";
    ...
});
                    </pre>
                </code>
            </li>
        </ul>
            </div>
        </blockquote>
    </form>
</body>
</html>
