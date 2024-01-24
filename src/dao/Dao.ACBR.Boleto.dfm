object dmACBRBoleto: TdmACBRBoleto
  OldCreateOrder = False
  Height = 424
  Width = 532
  object FDConnectionBoleto: TFDConnection
    Params.Strings = (
      'ConnectionDef=BoletoACBR')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object fdqBoleto: TFDQuery
    Connection = FDConnectionBoleto
    SQL.Strings = (
      'SELECT * FROM BANCO')
    Left = 24
    Top = 80
    object fdqBoletoId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqBoletonumero: TIntegerField
      FieldName = 'numero'
      Origin = 'numero'
    end
    object fdqBoletoindiceACBr: TIntegerField
      FieldName = 'indiceACBr'
      Origin = 'indiceACBr'
    end
    object fdqBoletonumeroCorrespondente: TIntegerField
      FieldName = 'numeroCorrespondente'
      Origin = 'numeroCorrespondente'
    end
    object fdqBoletoversaoArquivo: TIntegerField
      FieldName = 'versaoArquivo'
      Origin = 'versaoArquivo'
    end
    object fdqBoletoversaoLote: TIntegerField
      FieldName = 'versaoLote'
      Origin = 'versaoLote'
    end
    object fdqBoletoorientacoesBanco: TWideMemoField
      FieldName = 'orientacoesBanco'
      Origin = 'orientacoesBanco'
      BlobType = ftWideMemo
    end
    object fdqBoletolocalPagamento: TWideMemoField
      FieldName = 'localPagamento'
      Origin = 'localPagamento'
      BlobType = ftWideMemo
    end
    object fdqBoletocasasDecimaisMoraJuros: TIntegerField
      FieldName = 'casasDecimaisMoraJuros'
      Origin = 'casasDecimaisMoraJuros'
    end
    object fdqBoletodensidadeGravacao: TIntegerField
      FieldName = 'densidadeGravacao'
      Origin = 'densidadeGravacao'
    end
    object fdqBoletocip: TWideMemoField
      FieldName = 'cip'
      Origin = 'cip'
      BlobType = ftWideMemo
    end
    object fdqBoletoprefixArqRemessa: TWideMemoField
      FieldName = 'prefixArqRemessa'
      Origin = 'prefixArqRemessa'
      BlobType = ftWideMemo
    end
    object fdqBoletocnab: TIntegerField
      FieldName = 'cnab'
      Origin = 'cnab'
    end
    object fdqBoletohomologacao: TIntegerField
      FieldName = 'homologacao'
      Origin = 'homologacao'
    end
    object fdqBoletoimprimirMensagemPadrao: TIntegerField
      FieldName = 'imprimirMensagemPadrao'
      Origin = 'imprimirMensagemPadrao'
    end
    object fdqBoletoleCedenteRetorno: TIntegerField
      FieldName = 'leCedenteRetorno'
      Origin = 'leCedenteRetorno'
    end
    object fdqBoletolerNossoNumeroCompleto: TIntegerField
      FieldName = 'lerNossoNumeroCompleto'
      Origin = 'lerNossoNumeroCompleto'
    end
    object fdqBoletoremoveAcentosArqRemessa: TIntegerField
      FieldName = 'removeAcentosArqRemessa'
      Origin = 'removeAcentosArqRemessa'
    end
    object fdqBoletocarteira: TIntegerField
      FieldName = 'carteira'
      Origin = 'carteira'
    end
  end
end
