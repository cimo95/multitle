program MulTitle1;

uses
  Forms,
  utama in 'utama.pas' {mf};

{$R *.res}
//{$R backupres.res}

begin
  Application.Initialize;
  Application.Title := 'MulTitle 1.0';
  Application.CreateForm(Tmf, mf);
  Application.Run;
end.
