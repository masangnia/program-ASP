Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class _Default
    Inherits System.Web.UI.Page
    Private strSQL As String
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private objAdapter As OleDbDataAdapter
    Private objDataset As DataSet
    Private myCon As OleDbConnection
    Private objCommand As OleDbCommand
    Private strCon As String



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=C:\ASP-siti\LatihanDML\INVENTORY.mdb;"
            If Not IsPostBack Then
                Call ListGrid()
            End If

        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
       

    End Sub

    Private Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Try
            myCon = New OleDbConnection(strCon)
            Try
                myCon.Open()
                strSQL = "Select * FROM tb-karyawan WHERE id_karyawan = '" & Trim(txtIDKaryawan.Text) & "'"
                objCommand = New OleDbCommand(strSQL, myCon)
                objReader = objCommand.ExecuteReader(CommandBehavior.Default)
                If objReader.HasRows Then
                    MsgBox("Duplicate Data")
                Else
                    objCommand.Dispose()
                    strSQL = "INSERT INTO tb-karyawan(id_karyawan,nama_karyawan,jenis_kelamin,jabatan,tgl_masuk,status) VALUES('" & txtIDKaryawan.Text & "','" & txtNamaKaryawan.Text & "','" & optJenisKelamin.SelectedIndex & "','" & ddlJabatan.SelectedValue & "','" & txtTglMasuk.Text & "','" & CDbl(txtStatus.Text) & "')"
                    objCommand = New OleDbCommand(strSQL, myCon)
                    If objCommand.ExecuteNonQuery Then
                        MsgBox("Data telah di simpan")
                    Else
                        MsgBox("Data error di simpan")
                    End If
                End If
                objReader.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            Finally
                myCon.Close()
                objCommand = Nothing
                objReader = Nothing
                myCon = Nothing
                Call ListGrid()
                Call ClearObject()
            End Try
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub
    Private Sub ListGrid()
        Try
            objDataset = New DataSet
            myCon = New OleDbConnection(strCon)
            myCon.Open()
            strSQL = "SELECT * FROM tb-karyawan ORDER BY id_karyawan ASC"
            objAdapter = New OleDbDataAdapter(strSQL, myCon)
            objAdapter.Fill(objDataset)
            grdList.DataSource = objDataset
            grdList.DataBind()
            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Private Sub ClearObject()
        txtIDKaryawan.Text = ""
        txtNamaKaryawan.Text = ""
        optJenisKelamin.SelectedIndex = ""
        ddlJabatan.SelectedValue = ""
        txtTglMasuk.Text = ""
        txtStatus.Text = ""
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearObject()

    End Sub


    Private Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If txtIDKaryawan.Text = "" Or txtNamaKaryawan.Text = "" Or optJenisKelamin.SelectedIndex = "" Or ddlJabatan.SelectedValue = "" Or txtTglMasuk.Text = "" Or txtStatus.Text = "" Then
            MsgBox("Data tidak boleh kosong")
        Else
            myCon = New OleDbConnection(strCon)
            Try
                myCon.Open()
                strSQL = "UPDATE tb-karyawan SET nm_karyawan = '" & txtNamaKaryawan.Text & "', jenis_kelamin = '" & optJenisKelamin.SelectedIndex & "', jabatan = '" & ddlJabatan.SelectedValue & "', tgl_masuk = '" & txtTglMasuk.Text & "', satuan = '" & CDbl(txtStatus.Text) & "' WHERE id_karyawan = '" & txtIDKaryawan.Text & "'"
                objCommand = New OleDbCommand(strSQL, myCon)
                If objCommand.ExecuteNonQuery Then
                    MsgBox("Data telah diupdate")
                Else
                    MsgBox("Update gagal")
                End If
            Catch ex As Exception
                MsgBox(ex.Message)
            Finally
                myCon.Close()
                objCommand = Nothing
                objReader = Nothing
                myCon = Nothing
                Call ListGrid()
                Call ClearObject()
            End Try
        End If
    End Sub
   
    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If txtIDKaryawan.Text = "" Or txtNamaKaryawan.Text = "" Or optJenisKelamin.SelectedIndex = "" Or ddlJabatan.SelectedValue = "" Or txtTglMasuk.Text = "" Or txtStatus.Text = "" Then
            MsgBox("Data kosong")
        Else
            myCon = New OleDbConnection(strCon)
            Try
                myCon.Open()
                strSQL = "DELETE FROM tb-karyawan WHERE id_karyawan = '" & Trim(txtIDKaryawan.Text) & "'"
                objCommand = New OleDbCommand(strSQL, myCon)
                If objCommand.ExecuteNonQuery Then
                    MsgBox("Data telah dihapus")
                Else
                    MsgBox("Hapus gagal")
                End If
            Catch ex As Exception
                MsgBox(ex.Message)
            Finally
                myCon.Close()
                objCommand = Nothing
                objReader = Nothing
                myCon = Nothing
                Call ListGrid()
                Call ClearObject()
            End Try
        End If

    End Sub
    Private Sub grdList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdList.SelectedIndexChanged
        Try
            txtIDKaryawan.Text = grdList.SelectedRow.Cells(1).Text
            txtNamaKaryawan.Text = grdList.SelectedRow.Cells(2).Text
            optJenisKelamin.SelectedIndex = grdList.SelectedRow.Cells(3).Text
            ddlJabatan.SelectedValue = grdList.SelectedRow.Cells(4).Text
            txtTglMasuk.Text = grdList.SelectedRow.Cells(5).Text
            txtStatus.Text = Format(CDbl(grdList.SelectedRow.Cells(6).Text), "#,##0.00")
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

End Class