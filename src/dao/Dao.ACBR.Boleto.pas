unit Dao.ACBR.Boleto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmACBRBoleto = class(TDataModule)
    FDConnectionBoleto: TFDConnection;
    fdqBoleto: TFDQuery;
    fdqBoletoId: TIntegerField;
    fdqBoletonumero: TIntegerField;
    fdqBoletoindiceACBr: TIntegerField;
    fdqBoletonumeroCorrespondente: TIntegerField;
    fdqBoletoversaoArquivo: TIntegerField;
    fdqBoletoversaoLote: TIntegerField;
    fdqBoletoorientacoesBanco: TWideMemoField;
    fdqBoletolocalPagamento: TWideMemoField;
    fdqBoletocasasDecimaisMoraJuros: TIntegerField;
    fdqBoletodensidadeGravacao: TIntegerField;
    fdqBoletocip: TWideMemoField;
    fdqBoletoprefixArqRemessa: TWideMemoField;
    fdqBoletocnab: TIntegerField;
    fdqBoletohomologacao: TIntegerField;
    fdqBoletoimprimirMensagemPadrao: TIntegerField;
    fdqBoletoleCedenteRetorno: TIntegerField;
    fdqBoletolerNossoNumeroCompleto: TIntegerField;
    fdqBoletoremoveAcentosArqRemessa: TIntegerField;
    fdqBoletocarteira: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmACBRBoleto: TdmACBRBoleto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
