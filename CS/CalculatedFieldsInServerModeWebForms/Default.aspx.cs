using CalculatedFieldsInServerModeWebForms.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculatedFieldsInServerModeWebForms
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
        }

        protected void EntityServerModeDataSource1_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            CalculatedFieldsTestEntities db = new CalculatedFieldsTestEntities();
            e.QueryableSource = db.CustomProducts(30, new DateTime(2018, 5, 16));
            e.KeyExpression = "Id";
        }
    }
}