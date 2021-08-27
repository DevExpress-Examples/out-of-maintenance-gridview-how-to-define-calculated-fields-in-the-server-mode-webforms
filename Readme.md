<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/135603547/17.2.8%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T830580)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# GridView - How to define calculated fields in the Server Mode
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/135603547/)**
<!-- run online end -->


<p>In this example, we demonstrate how you can implement calculated fields when the GridView extension is bound to a Server Mode data source.</p>
<p>On the side of the SQL server, you need to use a Table-Value function and implement all calculated fields there. See the <a href="https://www.devexpress.com/Support/Center/p/T618007">How to define calculated fields in the Server Mode for the GridView control</a> KB article where we described this approach in greater detail.</p>
<p>In the provided GridView extension, only the following fields come from the [Products] table as-is: <em>[Id], [ProductName], [ProductionDate], [ProductPrice], [UnitsInStock]</em>. <br><br>Other fields are calculated in the following manner:</p>
<em>  Product Expires Date</em>
<p>  This field is calculated on the SQL server side based on the value passed into the SQL function and the value in the <em>[ProductionDate]</em> field.</p>
<code> DATEADD(day, @daysExpiresOffset, ProductionDate) as ProductExpiresDate<br><br></code><em>  Days Until Expires</em>
<p>  This field is calculated on the SQL server side based on the current date value passed into the SQL function and the value in the <em>[ProductExpiresDate]</em> field.</p>
<code> DATEDIFF(day, @currentDate, p.ProductExpiresDate) as DaysUntilExpires<br><br></code><em>  Product Stock Sum Price</em>
<p>  This field is calculated using the built-in Criteria Language Syntax based on the values of the <em>[ProductPrice]</em> and <em>[UnitsInStock]</em> fields. See the <a href="https://documentation.devexpress.com/CoreLibraries/4928/DevExpress-Data-Library/Criteria-Language-Syntax">Criteria Language Syntax</a> and <a href="https://documentation.devexpress.com/WindowsForms/6211/Common-Features/Expressions">Unbount Expressions</a> documentation articles to learn more about this approach.<br><br></p>

    <dx:GridViewDataSpinEditColumn FieldName="ProductStockSumProce"
    UnboundExpression="[ProductPrice] * [UnitsInStock]"
    UnboundType="Decimal"
    PropertiesSpinEdit-DisplayFormatString="c">
    </dx:GridViewDataSpinEditColumn>


<br/>
A backup file of the sample database can be found in the App_Data directory.


