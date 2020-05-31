unit utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, filectrl, xpman, ExtCtrls, StdCtrls, Menus, ComCtrls,
  ImgList, ZLib, IniFiles;

type
  Tmf = class(TForm)
    mm: TMainMenu;
    sb: TStatusBar;
    F1: TMenuItem;
    E1: TMenuItem;
    V1: TMenuItem;
    H1: TMenuItem;
    N1: TMenuItem;
    O1: TMenuItem;
    S1: TMenuItem;
    S2: TMenuItem;
    N2: TMenuItem;
    E2: TMenuItem;
    C1: TMenuItem;
    N3: TMenuItem;
    C2: TMenuItem;
    C3: TMenuItem;
    P1: TMenuItem;
    C4: TMenuItem;
    S3: TMenuItem;
    N4: TMenuItem;
    F2: TMenuItem;
    F3: TMenuItem;
    R1: TMenuItem;
    G1: TMenuItem;
    N5: TMenuItem;
    D1: TMenuItem;
    F4: TMenuItem;
    W1: TMenuItem;
    F5: TMenuItem;
    S4: TMenuItem;
    T1: TMenuItem;
    C5: TMenuItem;
    N6: TMenuItem;
    A1: TMenuItem;
    m: TRichEdit;
    sl: TSplitter;
    lb: TListBox;
    fod: TFontDialog;
    opd: TOpenDialog;
    sad: TSaveDialog;
    fid: TFindDialog;
    red: TReplaceDialog;
    t2: TMenuItem;
    N7: TMenuItem;
    I1: TMenuItem;
    E3: TMenuItem;
    N8: TMenuItem;
    M1: TMenuItem;
    M2: TMenuItem;
    D2: TMenuItem;
    R2: TMenuItem;
    procedure C1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure fidFind(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure redFind(Sender: TObject);
    procedure redReplace(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure F5Click(Sender: TObject);
    procedure S4Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure C5Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure O1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure E3Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure E2Click(Sender: TObject);
    procedure lbDblClick(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure mChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
  private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }
  public
    sp, li, ki: integer;
    ofn, td, sv: string;
    am, so: Boolean;
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
  end;

var
  mf: Tmf;

implementation

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi

{*Penjelasan singkat*}
{
Program ini adalah aplikasi pemroses teks sederhana semacam Notepad, tapi disini anda dapat menyimpan lebih dari satu judul file teks, kedalam satu file.
Program ini mengacu pada program BookPad dan NotepadEx yang telah saya buat sebelumnya (free apps but not open source), karena beberapa teman menyarankan
supaya dasar aplikasi ini di-open source-kan, maka saya berniat membuatnya kembali dari NOL dengan fungsi-fungsi dasarnya, agar agan-agan programmer bisa
mengembangkan lagi aplikasi ini ;)

Ayo dukung #IndonesiaNgoding sisihkan sedikit waktu anda untuk membuat aplikasi sederhana yang open-source, agar teman-teman lainnya bisa ikut belajar,
sambil mencoba-coba mengembangkan aplikasi-aplikasi open source tersebut. Tidak hanya Delphi, tapi semua bahasa pemrograman.

NOTE : penulisan Prosedur, Fungsi, dan Variabel sengaja saya "min"-kan, agar agan-agan bisa membaca dengan lebih teliti alur suatu prosedur / fungsi tsb.

Referensi : about.delphi.com, stackoverflow.com
}

{*Prosedur dan fungsi dasar*}

function sa(p: Integer): string;
var
  t: string;
begin
  Randomize;
  t := '0123456789abcdefABCDEF';
  //tips : ente bisa ubah variabel 't' diatas dengan susunan string sesuka anda
  Result := '';
  repeat
    Result := Result + t[Random(Length(t)) + 1];
  until (Length(Result) = p)
end;

procedure dd(const dn: string);
var
  fo: TSHFileOpStruct;
begin
  FillChar(fo, SizeOf(fo), 0);
  fo.wFunc := FO_DELETE;
  fo.pFrom := Pwidechar(dn + #0);
  fo.fFlags := FOF_SILENT or FOF_NOERRORUI or FOF_NOCONFIRMATION;
  SHFileOperation(fo);
end;

function tf: WideString;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  Result := StrPas(tempFolder);
end;

procedure rf;
label
  a;
var
  tif: TIniFile;
begin
  with mf do
  begin
a:
    dd(td);
    MkDir(td);
    tif := TIniFile.Create(td + '\conf');
    tif.WriteInteger('init', 'total', 0);
    li := -1;
    sv := 'Untitled';
    ki := 0;
    m.Font.Name := 'Courier New';
    m.Font.Size := 10;
    m.Font.Style := m.Font.Style - [fsbold, fsitalic, fsunderline, fsstrikeout];
    lb.Clear;
    m.Clear;
    so := True;
    caption := 'Untitled - MulTitle 1.0';
  end;
end;

function ie(t: string): Boolean;
begin
  result := mf.lb.Items.IndexOf(t) <> -1;
end;

function rc(m: TCustomMemo): string;
var
  r, c: LongInt;
begin
  r := SendMessage(m.Handle, EM_LINEFROMCHAR, m.SelStart, 0);
  c := m.SelStart - SendMessage(m.Handle, EM_LINEINDEX, SendMessage(m.Handle,
    EM_LINEFROMCHAR, m.SelStart, 0), 0);
  result := Format('Ln %d, Col %d', [r + 1, c + 1]);
end;

procedure svr(ji, ii: Integer; s: string);
label
  a;
var
  tif: TIniFile;
  t: string;
  i, j: integer;
  tsl, tsm: TStringList;
begin
  tif := TIniFile.Create(mf.td + '\conf');
  case ji of
    0:
      begin
        mf.m.Lines.SaveToFile(mf.td + '\' + inttostr(mf.li));
        mf.lb.Items.Add(s);
        mf.li := mf.lb.Items.Count - 1;
        mf.m.Clear;
        mf.m.Lines.SaveToFile(mf.td + '\' + IntToStr(mf.li));
        mf.lb.ItemIndex := mf.li;
        tif.WriteInteger('init', 'total', mf.lb.Items.Count - 1);
        tif.WriteString('title', IntToStr(mf.lb.Items.Count - 1), '"' + s + '"');
      end;

    1:
      begin
        tsl := TStringList.Create;
        tsm := TStringList.Create;
        tsl.Text := s;
        mf.lb.DoubleBuffered := True;
        for i := 0 to tsl.Count - 1 do
        begin
          mf.sb.Panels.Items[0].Text := 'Importing text based file(s) ( ' +
            inttostr(i + 1) + ' of ' + inttostr(tsl.Count) + ' )';
          Application.ProcessMessages;
          if ExtractFileName(tsl.Strings[i])[1] = '.' then
            t := ExtractFileName(tsl.Strings[i])
          else
            t := ChangeFileExt(ExtractFileName(tsl.Strings[i]), '');
          if ie(t) then
            t := t + '-copy';
          tsm.SaveToFile(mf.td + '\' + inttostr(mf.li));
          mf.lb.Items.Add(t);
          mf.li := mf.lb.Items.Count - 1;
          tsm.LoadFromFile(tsl.Strings[i]);
          if Length(tsm.Text) <= 0 then
            tsm.Text :=
              'INFO : This item was failed to load, or already empty when its imported.';
          tsm.SaveToFile(mf.td + '\' + IntToStr(mf.li));
          tif.WriteInteger('init', 'total', mf.lb.Items.Count);
          tif.WriteString('title', IntToStr(mf.lb.Items.Count - 1), '"' + t + '"');
          Sleep(Random(500));
            // biar ada efek seperti sedang memproses sesuatu hehehe...
        end;
        mf.sb.Panels.Items[0].Text := '';
        tsl.Free;
        tsm.Free;
      end;

    2:
      begin
        mf.m.Lines.SaveToFile(s);
      end;

    3:
      begin
        tif.EraseSection('title');
        for i := 0 to mf.lb.Items.Count - 1 do
          tif.WriteString('title', IntToStr(i), '"' + mf.lb.Items.Strings[i] + '"');
      end;

    4:
      begin
        //3 4 | 4$ | 3->4 | 4$->3
        RenameFile(mf.td + '\' + s, mf.td + '\' + s + '$');
        RenameFile(mf.td + '\' + inttostr(ii), mf.td + '\' + s);
        RenameFile(mf.td + '\' + s + '$', mf.td + '\' + inttostr(ii));
        tif.EraseSection('title');
        for i := 0 to mf.lb.Items.Count - 1 do
          tif.WriteString('title', IntToStr(i), '"' + mf.lb.Items.Strings[i] + '"');
        mf.am := true;
      end;

    5:
      begin
        j := -1;
        mf.sb.Panels.Items[0].Text := 'Deleting item...';
        for i := 0 to mf.lb.Items.Count - 1 do
          if mf.lb.Selected[i] then
          begin
            Sleep(Random(500));
            DeleteFile(mf.td + '\' + inttostr(i));
            Application.ProcessMessages;
          end;
        mf.sb.Panels.Items[0].Text := 'Reindexing item...';
        for i := 0 to mf.lb.Items.Count - 1 do
          if not mf.lb.Selected[i] then
          begin
            Sleep(Random(500));
            j := j + 1;
            RenameFile(mf.td + '\' + inttostr(i), mf.td + '\' + inttostr(j));
            Application.ProcessMessages;
          end;
        mf.lb.DeleteSelected;
        tif.EraseSection('title');
        for i := 0 to mf.lb.Items.Count - 1 do
          tif.WriteString('title', IntToStr(i), '"' + mf.lb.Items.Strings[i] + '"');
        mf.li := -1;
        mf.lb.ItemIndex := -1;
        mf.m.Clear;
        mf.sb.Panels.Items[0].Text := '';
      end;
  end;
end;

procedure fc(Files: TStrings; const Compressed: string);
var
  FileInName: TBytes;
  FileIn, FileOut: TFileStream;
  Compressor: TCompressionStream;
  NumFiles, I, Len, Size: Integer;
  Fin: Byte;
begin
  FileOut := TFileStream.Create(Compressed, fmCreate or fmShareExclusive);
  try
    Compressor := TCompressionStream.Create(clMax, FileOut);
    try
      NumFiles := Files.Count;
      Compressor.Write(NumFiles, SizeOf(Integer));
      for I := 0 to (NumFiles - 1) do
      begin
        FileIn := TFileStream.Create(Files[I], fmOpenRead and fmShareExclusive);
        try
          { write File Name }
          FileInName := TEncoding.UTF8.GetBytes(ExtractFileName(Files[I]));
          Len := Length(FileInName);
          Compressor.Write(Len, SizeOf(Integer));
          Compressor.Write(PByte(FileInName)^, Len);

          { Write File }
          Size := FileIn.Size;
          Compressor.Write(Size, SizeOf(Integer));
          Compressor.CopyFrom(FileIn, FileIn.Size);
          Fin := 0;
          Compressor.Write(Fin, SizeOf(Byte));
        finally
          FileIn.Free;
        end;
      end;
    finally
      FreeAndNil(Compressor);
    end;
  finally
    FreeAndNil(FileOut);
  end;
end;

 { ############################ }

procedure fdc(ArqOrigem, ArqDestino: string);
var
  NomeSaidaBytes: TBytes;
  NomeSaida: string;
  FileEntrada, FileOut: TFileStream;
  Descompressor: TDecompressionStream;
  NumArq, I, Len, Size: Integer;
  Fim: Byte;
begin
  FileEntrada := TFileStream.Create(ArqOrigem, fmOpenRead and fmShareExclusive);
  try
    Descompressor := TDecompressionStream.Create(FileEntrada);
    try
      Descompressor.ReadBuffer(NumArq, SizeOf(Integer));
      for I := 0 to (NumArq - 1) do
      begin
        Descompressor.ReadBuffer(Len, SizeOf(Integer));
        SetLength(NomeSaidaBytes, Len);
        Descompressor.ReadBuffer(PByte(NomeSaidaBytes)^, Len);
        NomeSaida := TEncoding.UTF8.GetString(NomeSaidaBytes);
        NomeSaida := ExtractFileName(NomeSaida); // to avoid a security risk
        FileOut := TFileStream.Create(IncludeTrailingBackslash(ArqDestino) +
          NomeSaida, fmCreate or fmShareExclusive);
        try
          Descompressor.ReadBuffer(Size, SizeOf(Integer));
          if Size > 0 then
            FileOut.CopyFrom(Descompressor, Size);
        finally
          FileOut.Free;
        end;
        Descompressor.Read(Fim, SizeOf(Byte));
      end;
    finally
      FreeAndNil(Descompressor);
    end;
  finally
    FreeAndNil(FileEntrada);
  end;
end;

procedure mtdo(f: string);
begin
end;

procedure mtds(f: string);
begin
end;

{*Prosedur komponen*}

procedure Tmf.C1Click(Sender: TObject);
begin
  m.Undo;
end;

procedure Tmf.C2Click(Sender: TObject);
begin
  m.CutToClipboard;
end;

procedure Tmf.P1Click(Sender: TObject);
begin
  m.PasteFromClipboard;
end;

procedure Tmf.C3Click(Sender: TObject);
begin
  m.CopyToClipboard;
end;

procedure Tmf.C4Click(Sender: TObject);
begin
  m.SelText := '';
end;

procedure Tmf.fidFind(Sender: TObject);
var
  S: string;
  i: integer;
begin
  with TFindDialog(Sender) do
  begin
    if sp = 0 then
      Options := Options - [frFindNext];
    if frfindNext in Options then
    begin
      i := sp + Length(Findtext);
      S := Copy(m.Lines.Text, i, MaxInt);
    end
    else
    begin
      S := m.Lines.Text;
      i := 1;
    end;
    sp := Pos(FindText, S);
    if sp > 0 then
    begin
      sp := sp + i - 1;
      m.SelStart := sp - 1;
      m.SelLength := Length(FindText);
      m.SetFocus;
    end
    else
    begin
      if frfindNext in Options then
        S := Concat('There are no further occurences of "', FindText, '" in m.')
      else
        S := Concat('Could not find "', FindText, '" in m.');
      MessageDlg(S, mtError, [mbOK], 0);
    end;
  end;
end;

procedure Tmf.F2Click(Sender: TObject);
begin
  sp := 0;
  fid.Execute;
end;

procedure Tmf.F3Click(Sender: TObject);
begin
  fid.Execute;
end;

procedure Tmf.redFind(Sender: TObject);
begin
  fid.FindText := red.FindText;
  fidfind(red);
end;

procedure Tmf.redReplace(Sender: TObject);
var
  i, j: Integer;
begin
  j := m.SelStart + m.SelLength;
  i := Pos(red.FindText, Copy(m.Text, j + 1, Length(m.Text) - j));
  if i > 0 then
  begin
    m.SetFocus;
    m.SelStart := j + i - 1;
    m.SelLength := Length(red.FindText);
    m.SelText := red.ReplaceText;
  end
  else
  begin
    MessageDlg('Text not found', mtInformation, [mbOK], 0);
  end;
end;

procedure Tmf.R1Click(Sender: TObject);
begin
  red.Execute;
end;

procedure gtl(c: TCustomEdit; l: integer);
begin
  c.SelStart := c.Perform(EM_LINEINDEX, l, 0);
  c.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure Tmf.G1Click(Sender: TObject);
var
  s: string;
  i: integer;
begin
  if m.lines.Count <= 3 then
    Exit
  else if not inputquery('Go To Line', 'Enter a line number less than ' +
    inttostr(m.Lines.Count), s) then
    exit
  else if not trystrtoint(s, i) then
    exit
  else
    gtl(m, strtoint(s));
end;

procedure Tmf.S3Click(Sender: TObject);
begin
  m.SelectAll;
end;

procedure Tmf.D1Click(Sender: TObject);
var
  p: TPoint;
  t: string;
begin
  p := m.CaretPos;
  t := m.Lines[p.y];
  t := Copy(t, 0, p.x) + formatdatetime('dd/mm/yyyy hh:mm:ss,zzz', now) + Copy(t,
    p.x + 1, Length(t));
  m.Lines[p.y] := t;
end;

procedure Tmf.W1Click(Sender: TObject);
var
  b: Boolean;
begin
  b := so;
  w1.Checked := not w1.Checked;
  m.WordWrap := w1.Checked;
  if W1.Checked then
    sb.Panels.Items[0].Width := Width
  else
    sb.Panels.Items[0].Width := Width - 200;
  so := b;
end;

procedure Tmf.F5Click(Sender: TObject);
begin
  if not fod.Execute then
    exit
  else
    m.Font := fod.Font;
end;

procedure Tmf.S4Click(Sender: TObject);
begin
  s4.Checked := not s4.Checked;
  sb.Visible := s4.Checked;
end;

procedure Tmf.T1Click(Sender: TObject);
begin
  t1.Checked := not t1.Checked;
  sl.Visible := t1.Checked;
  lb.Visible := t1.Checked;
end;

procedure Tmf.C5Click(Sender: TObject);
begin
  messagebox(handle,
    'A help file may be different each of this project edition later, so i don''t add the help file here',
    'MulTitle Help', 0);
end;

procedure Tmf.A1Click(Sender: TObject);
begin
  messagebox(handle, 'MulTitle 1.0'#13 + 'A Simple Batch Text Data Editor'#13#13
    + 'An open source Text Editor program that allow you to store multiple text files in one file based on my MDAO project,'#13
    + 'special for Newbie who want to made their own Batch Text Data Editor. '#13#13
    + 'Since this project is for Delphi Newbie Programmer, we''re not using a third-party component.'#13#13
    + '©2016 Arachmadi Putra Pambudi', 'About MulTitle 1.0', 0);
end;

procedure Tmf.N1Click(Sender: TObject);
begin
  if so then
    rf
  else
    case MessageBox(Handle, Pwidechar('Some changes has made on "' + sv +
      '", do you want to save them before create a new document ?'), 'New Document', 3) of
      mrYes:
        begin
          ki := 2;
          S1.Click;
        end;

      mrNo:
        begin
          rf;
        end;

      mrCancel:
        begin
          ki := 0;
          Exit;
        end;
    end;
end;

procedure Tmf.O1Click(Sender: TObject);
label
  a;
var
  tif: tinifile;
  i, j: integer;
begin
  if so then
    goto a
  else
    case MessageBox(Handle, Pwidechar('Some changes has made on "' + sv +
      '", do you want to save them before opening another document ?'), 'Open', 3) of
      mrYes:
        begin
          ki := 3;
          S1.Click;
        end;

      mrNo:
        begin
          goto a;
        end;

      mrCancel:
        begin
          ki := 0;
          Exit;
        end;
    end;

a:
  opd.title := 'Opening MulTitle document...';
  opd.Filter := 'MulTitle Document|*.mtd';
  if not opd.Execute then
    exit
  else
  begin
    fdc(opd.FileName, td);
    tif := TIniFile.Create(td + '\conf');
    j := tif.ReadInteger('init', 'total', 0);
    lb.Clear;
    for i := 0 to j - 1 do
      lb.Items.Add(tif.ReadString('title', IntToStr(i), ''));
    sv := opd.FileName;
    caption := ChangeFileExt(ExtractFileName(sv), '') + ' - MulTitle 1.0';
    so := True;
  end;
end;

procedure Tmf.M1Click(Sender: TObject);
var
  i: integer;
begin
  if lb.SelCount <> 1 then
    exit
  else
    i := lb.ItemIndex - 1;
  if lb.ItemIndex <= 0 then
    exit
  else
  begin
    lb.Items.Move(lb.ItemIndex, i);
    lb.ItemIndex := i;
    svr(4, i + 1, IntToStr(i));
    so := False;
  end;
end;

procedure Tmf.M2Click(Sender: TObject);
var
  i: Integer;
begin
  if lb.SelCount <> 1 then
    exit
  else
    i := lb.ItemIndex + 1;
  if lb.ItemIndex >= lb.Items.Count - 1 then
    exit
  else
  begin
    lb.Items.Move(lb.ItemIndex, i);
    lb.ItemIndex := i;
    svr(4, i - 1, IntToStr(i));
    so := False;
  end;
end;

procedure Tmf.FormCreate(Sender: TObject);
label
  a;
var
  tif: TIniFile;
begin
a:
  td := tf + '\' + sa(8);
  if DirectoryExists(td) then
  begin
    dd(td);
    goto a
  end
  else
    MkDir(td);
  tif := TIniFile.Create(td + '\conf');
  tif.WriteInteger('init', 'total', 0);
  li := -1;
  sv := 'Untitled';
  ki := 0;
  so := true;
end;

procedure Tmf.N7Click(Sender: TObject);
label
  a;
var
  s: string;
begin
a:
  if not InputQuery('New Item', 'Please type your new item title', s) then
    Exit
  else if Length(s) <= 0 then
    exit
  else
  begin
    if ie(s) then
    begin
      MessageBox(Handle, Pwidechar('Item with title "' + s + '" already exists'),
        'New Item', 0);
      goto a;
    end
    else
    begin
      svr(0, 0, s);
      so := False;
    end;
  end;
end;

procedure Tmf.I1Click(Sender: TObject);
begin
  opd.title := 'Importing item from text based sources...';
  opd.Filter := 'Text Document|*.txt|All Files|*.*';
  opd.Options := opd.Options + [ofallowmultiselect];
  if not opd.Execute then
  begin
    opd.Options := opd.Options - [ofallowmultiselect];
    Exit
  end
  else
  begin
    lb.Enabled := false;
    svr(1, 0, opd.Files.Text);
    so := False;
    lb.Enabled := true;
    opd.Options := opd.Options - [ofallowmultiselect];
  end;
end;

procedure Tmf.E3Click(Sender: TObject);
begin
  sad.title := 'Exporting item to text based file...';
  sad.Filter := 'Text Document|*.txt';
  if not sad.Execute then
    Exit
  else
    svr(2, 0, sad.FileName);
end;

procedure Tmf.D2Click(Sender: TObject);
var
  s: string;
begin
  if lb.SelCount <= 0 then
    exit
  else
  begin
    if lb.SelCount <> 1 then
      s := inttostr(lb.SelCount) + ' items'
    else
      s := inttostr(lb.SelCount) + ' item';
    if MessageBox(handle, Pwidechar('Do you really want to remove ' + s +
      ' ?'#13'You can''t undo this action.'), 'Delete Item', 4) = mrno then
      exit
    else
    begin
      svr(5, 0, '');
      so := False;
    end;
  end;
end;

procedure Tmf.R2Click(Sender: TObject);
label
  a;
var
  s: string;
begin
  if lb.SelCount = 1 then
  begin
a:
    if not InputQuery('Rename Item', 'Rename "' + lb.Items.Strings[lb.itemindex]
      + '" to...', s) then
      Exit
    else if (Length(s) <= 0) then
      exit
    else
    begin
      if ie(s) then
      begin
        MessageBox(Handle, Pwidechar('Item with title "' + s + '" already exists'),
          'Rename Item', 0);
        goto a;
      end
      else
      begin
        lb.Items.Strings[lb.ItemIndex] := s;
        svr(3, 0, '');
        so := False;
      end;
    end;
  end;
end;

procedure Tmf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  E2.Click;
end;

procedure Tmf.E2Click(Sender: TObject);
begin
  if so then
  begin
    dd(td);
    Application.Terminate;
  end
  else
    case MessageBox(Handle, Pwidechar('Some changes has made on "' + sv +
      '", do you want to save them before closing the program ?'),
      'Closing Program', 3) of
      mrYes:
        begin
          ki := 1;
          S1.Click;
        end;

      mrNo:
        begin
          dd(td);
          Application.Terminate;
        end;

      mrCancel:
        begin
          ki := 0;
          Exit;
        end;
    end;
end;

procedure Tmf.lbDblClick(Sender: TObject);
begin
  try
    if (li >= 0) and (am = false) then
      m.Lines.SaveToFile(td + '\' + inttostr(li));
    m.Lines.LoadFromFile(td + '\' + inttostr(lb.itemindex));
    li := lb.ItemIndex;
    am := false;
  except
  end;
end;

procedure Tmf.S2Click(Sender: TObject);
var
  ts: TStringlist;
  i: Integer;
begin
  if lb.Items.Count <= 0 then
  begin
    MessageBox(Handle, 'Sorry, but no item(s) to save', 'Save As', 0);
    so := false;
    exit;
  end;
  sad.title := 'Saving MulTitle document...';
  sad.Filter := 'MulTitle Document|*.mtd';
  if not sad.Execute then
    exit
  else
  begin
    ts := TStringlist.Create;
    ts.Add(td + '\conf');
    for i := 0 to lb.Items.Count - 1 do
      ts.Add(td + '\' + inttostr(i));
    fc(ts, ChangeFileExt(sad.FileName, '.mtd'));
    ts.Free;
    sv := ChangeFileExt(sad.FileName, '.mtd');
    so := True;
    case ki of
      1:
        begin
          dd(td);
          Application.Terminate;
        end;
      2:
        begin
          ki := 0;
          rf;
        end;

      3:
        begin
          ki := 0;
          rf;
          O1.Click;
        end;
    end;
    caption := ExtractFileName(ChangeFileExt(sv, '')) + ' - MulTitle 1.0';
  end;
end;

procedure Tmf.S1Click(Sender: TObject);
var
  ts: TStringlist;
  i: Integer;
begin
  if not FileExists(sv) then
    S2.Click
  else
  begin
    ts := TStringlist.Create;
    ts.Add(td + '\conf');
    for i := 0 to lb.Items.Count - 1 do
      ts.Add(td + '\' + inttostr(i));
    fc(ts, ChangeFileExt(sv, '.mtd'));
    ts.Free;
    sv := ChangeFileExt(sv, '.mtd');
    so := True;
    case ki of
      1:
        begin
          dd(td);
          Application.Terminate;
        end;
      2:
        begin
          ki := 0;
          rf;
        end;

      3:
        begin
          ki := 0;
          rf;
          O1.Click;
        end;
    end;
  end;
end;

procedure Tmf.mChange(Sender: TObject);
begin
  so := false;
end;

procedure Tmf.FormResize(Sender: TObject);
begin
  if W1.Checked then
    sb.Panels.Items[0].Width := Width
  else
    sb.Panels.Items[0].Width := Width - 200;
end;

procedure Tmf.mKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  sb.Panels.Items[1].Text := rc(m);
end;

procedure Tmf.mMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  sb.Panels.Items[1].Text := rc(m);
end;

end.

