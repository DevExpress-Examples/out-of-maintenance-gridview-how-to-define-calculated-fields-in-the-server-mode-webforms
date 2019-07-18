Imports CalculatedFieldsInServerModeWebForms.Model
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace CalculatedFieldsInServerModeWebForms
	Partial Public Class [Default]
		Inherits System.Web.UI.Page

		Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		End Sub

		Protected Sub EntityServerModeDataSource1_Selecting(ByVal sender As Object, ByVal e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs)
			Dim db As New CalculatedFieldsTestEntities()
			e.QueryableSource = db.CustomProducts(30, New DateTime(2018, 5, 16))
			e.KeyExpression = "Id"
		End Sub
	End Class
End Namespace