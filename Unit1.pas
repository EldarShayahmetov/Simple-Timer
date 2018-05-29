unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Math, jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer2: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x, y , mx, my, r , sixsec, sec, radalpha, mradalpha, min,i,buttonSelected : integer;
  alpha, malpha : real;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
radalpha:=-90;
mradalpha:=-90;
r:=256;
with Image1.Canvas do
begin
Arc(0,0,512,512,0,0,0,0);
MoveTo(256,256);
LineTo(256,0);
end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
timer1.Enabled:=true;
Form1.Color:=clwhite;
edit1.ReadOnly:=true;
edit2.ReadOnly:=true;
if (strtoint(edit1.Text) > 60) or (strtoint(edit2.Text) > 60) then
begin
edit1.Text:='60';
edit2.Text:='0';
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if (edit1.Text=inttostr(min)) and (edit2.Text=inttostr(sec)) then
begin
Form1.Color:=clred;
radalpha:=-90;
mradalpha:=-90;
with Image1.Canvas do
begin
Brush.Color := Clred;
FillRect(Canvas.ClipRect);
Arc(0,0,512,512,0,0,0,0);
MoveTo(256,256);
LineTo(256,0);
end;
sec:=0;
sixsec:=0;
min:=0;
timer1.Enabled:=false;
timer2.Enabled:=true;
application.Title:='Внимание!!!';
showmessage('Время истекло!!!');
timer2.Enabled:=false;
image1.Canvas.Brush.Color := Clwhite;
image1.canvas.FillRect(Canvas.ClipRect);
with Image1.Canvas do
begin
Arc(0,0,512,512,0,0,0,0);
MoveTo(256,256);
LineTo(256,0);
end;
Form1.Color:=clwhite;
edit1.Text:='0';
edit2.Text:='15';
edit1.ReadOnly:=false;
edit2.ReadOnly:=false;
Exit;
end;

with Image1.Canvas do
begin
Brush.Color := ClWhite;
FillRect(Canvas.ClipRect);
Arc(0,0,512,512,0,0,0,0);
end;

radalpha:=radalpha+6;
alpha:=radalpha*(pi/180);
y:=trunc(r*sin(alpha));
x:=trunc(r*cos(alpha));
Image1.Canvas.MoveTo(256,256);
Image1.Canvas.LineTo(x+256,y+256);

if sec=60 then begin
sec:=0;
end;

if sixsec=60 then
begin
mradalpha:=mradalpha+6;
min:=min+1;
sixsec:=0;
end;

malpha:=mradalpha*(pi/180);
my:=trunc(r*sin(malpha));
mx:=trunc(r*cos(malpha));
Image1.Canvas.MoveTo(256,256);
Image1.Canvas.LineTo(mx+256,my+256);
sec:=sec+1;
sixsec:=sixsec+1;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
if form1.Color=clred then
begin
form1.Color:=clgreen;
image1.Canvas.Brush.Color := Clgreen;
image1.canvas.FillRect(Canvas.ClipRect);
with Image1.Canvas do
begin
Arc(0,0,512,512,0,0,0,0);
MoveTo(256,256);
LineTo(256,0);
end;
end
else
begin
form1.Color:=clred;
image1.Canvas.Brush.Color := Clred;
image1.canvas.FillRect(Canvas.ClipRect);
end;
with Image1.Canvas do
begin
Arc(0,0,512,512,0,0,0,0);
MoveTo(256,256);
LineTo(256,0);
end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
radalpha:=-90;
mradalpha:=-90;
with Image1.Canvas do
begin
Arc(0,0,512,512,0,0,0,0);
MoveTo(256,256);
LineTo(256,0);
end;
sec:=0;
sixsec:=0;
min:=0;
timer1.Enabled:=false;
timer2.Enabled:=false;
image1.Canvas.Brush.Color := Clwhite;
image1.canvas.FillRect(Canvas.ClipRect);
with Image1.Canvas do
begin
Arc(0,0,512,512,0,0,0,0);
MoveTo(256,256);
LineTo(256,0);
end;
Form1.Color:=clwhite;
edit1.Text:='0';
edit2.Text:='15';
edit1.ReadOnly:=false;
edit2.ReadOnly:=false;
end;

end.
