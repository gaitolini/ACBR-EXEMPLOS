//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ACBrEXEMPLOS;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  ACBr.Exemplos.View in '..\src\view\ACBr.Exemplos.View.pas' {ViewMainACBr},
  Dao.ACBR.Boleto in '..\src\dao\Dao.ACBR.Boleto.pas' {dmACBRBoleto: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TSplitView Demo';
  Application.CreateForm(TViewMainACBr, ViewMainACBr);
  Application.CreateForm(TdmACBRBoleto, dmACBRBoleto);
  Application.Run;
end.
