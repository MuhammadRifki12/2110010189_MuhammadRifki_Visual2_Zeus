unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractConnection, ZConnection, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls;

type
  TForm1 = class(TForm)
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  var Id : string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into kustomer values(null,"'+Edit1.Text+'","'+Edit2.Text+'","'+Edit3.Text+'","'+Edit4.Text+'","'+Edit5.Text+'")');
  zqry1.ExecSQL ;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from kustomer');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update kustomer set nmkustomer ="'+edit1.Text+'",telp="'+edit2.Text+'",alamat="'+edit3.Text+'",kota="'+edit4.Text+'",kodepos="'+edit5.Text+'" where id_kustomer="'+id+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from kustomer');
  zqry1.Open;end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add(' delete from kustomer where idkustomer= 3');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from kustomer');
  zqry1.Open;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  id :=  zqry1.Fields[0].AsString;
Edit1.Text := zqry1.Fields[1].AsString;
Edit2.Text := zqry1.Fields[2].AsString;
Edit3.Text := zqry1.Fields[3].AsString;
Edit4.Text := zqry1.Fields[4].AsString;
Edit5.Text := zqry1.Fields[5].AsString;
end;

end.
