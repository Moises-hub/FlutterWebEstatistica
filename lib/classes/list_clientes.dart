class ListClientes {
  String? iDCLIENTE;
  String? cPFCNPJ;
  String? iE;
  String? nOME;
  String? fANTASIA;
  String? eNDERECO;
  String? cIDADE;
  String? fONE;
  String? sTATUS;
  String? rEGIME;
  String? cLASSE;
  String? vERSAOSOFT;
  String? vERSAOATUALIZACAO;
  String? nFE;
  String? nFCE;
  String? nFSE;
  String? sPED;
  String? bOLETOBANCARIO;
  String? fOLHADEPAGAMENTO;
  String? eNVIOORCWHATS;
  String? pIX;
  String? cOBRANCA;
  String? pONTUACAO;
  String? oS;
  String? cTE;
  String? mDFE;
  String? cTEEM;
  String? mDFEEM;
  String? sALES;
  String? dASH;
  String? cOLETOR;

  ListClientes(
      {this.iDCLIENTE,
        this.cPFCNPJ,
        this.iE,
        this.nOME,
        this.fANTASIA,
        this.eNDERECO,
        this.cIDADE,
        this.fONE,
        this.sTATUS,
        this.rEGIME,
        this.cLASSE,
        this.vERSAOSOFT,
        this.vERSAOATUALIZACAO,
        this.nFE,
        this.nFCE,
        this.nFSE,
        this.sPED,
        this.bOLETOBANCARIO,
        this.fOLHADEPAGAMENTO,
        this.eNVIOORCWHATS,
        this.pIX,
        this.cOBRANCA,
        this.pONTUACAO,
        this.oS,
        this.cTE,
        this.mDFE,
        this.cTEEM,
        this.mDFEEM,
        this.sALES,
        this.dASH,
        this.cOLETOR});

  ListClientes.fromJson(Map<String, dynamic> json) {
    iDCLIENTE = json['ID_CLIENTE'];
    cPFCNPJ = json['CPF_CNPJ'];
    iE = json['IE'];
    nOME = json['NOME'];
    fANTASIA = json['FANTASIA'];
    eNDERECO = json['ENDERECO'];
    cIDADE = json['CIDADE'];
    fONE = json['FONE'];
    sTATUS = json['STATUS'];
    rEGIME = json['REGIME'];
    cLASSE = json['CLASSE'];
    vERSAOSOFT = json['VERSAO_SOFT'];
    vERSAOATUALIZACAO = json['VERSAO_ATUALIZACAO'];
    nFE = json['NFE'];
    nFCE = json['NFCE'];
    nFSE = json['NFSE'];
    sPED = json['SPED'];
    bOLETOBANCARIO = json['BOLETO_BANCARIO'];
    fOLHADEPAGAMENTO = json['FOLHA_DE_PAGAMENTO'];
    eNVIOORCWHATS = json['ENVIO_ORC_WHATS'];
    pIX = json['PIX'];
    cOBRANCA = json['COBRANCA'];
    pONTUACAO = json['PONTUACAO'];
    oS = json['OS'];
    cTE = json['CTE'];
    mDFE = json['MDFE'];
    cTEEM = json['CTE_EM'];
    mDFEEM = json['MDFE_EM'];
    sALES = json['SALES'];
    dASH = json['DASH'];
    cOLETOR = json['COLETOR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_CLIENTE'] = this.iDCLIENTE;
    data['CPF_CNPJ'] = this.cPFCNPJ;
    data['IE'] = this.iE;
    data['NOME'] = this.nOME;
    data['FANTASIA'] = this.fANTASIA;
    data['ENDERECO'] = this.eNDERECO;
    data['CIDADE'] = this.cIDADE;
    data['FONE'] = this.fONE;
    data['STATUS'] = this.sTATUS;
    data['REGIME'] = this.rEGIME;
    data['CLASSE'] = this.cLASSE;
    data['VERSAO_SOFT'] = this.vERSAOSOFT;
    data['VERSAO_ATUALIZACAO'] = this.vERSAOATUALIZACAO;
    data['NFE'] = this.nFE;
    data['NFCE'] = this.nFCE;
    data['NFSE'] = this.nFSE;
    data['SPED'] = this.sPED;
    data['BOLETO_BANCARIO'] = this.bOLETOBANCARIO;
    data['FOLHA_DE_PAGAMENTO'] = this.fOLHADEPAGAMENTO;
    data['ENVIO_ORC_WHATS'] = this.eNVIOORCWHATS;
    data['PIX'] = this.pIX;
    data['COBRANCA'] = this.cOBRANCA;
    data['PONTUACAO'] = this.pONTUACAO;
    data['OS'] = this.oS;
    data['CTE'] = this.cTE;
    data['MDFE'] = this.mDFE;
    data['CTE_EM'] = this.cTEEM;
    data['MDFE_EM'] = this.mDFEEM;
    data['SALES'] = this.sALES;
    data['DASH'] = this.dASH;
    data['COLETOR'] = this.cOLETOR;
    return data;
  }
}
