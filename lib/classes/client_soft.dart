class Client_Soft {
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
  String? sALES;
  String? dASH;
  String? cOLETOR;

  Client_Soft(
      {this.nFE,
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
        this.sALES,
        this.dASH,
        this.cOLETOR});

  Client_Soft.fromJson(Map<String, dynamic> json) {
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
    sALES = json['SALES'];
    dASH = json['DASH'];
    cOLETOR = json['COLETOR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['SALES'] = this.sALES;
    data['DASH'] = this.dASH;
    data['COLETOR'] = this.cOLETOR;
    return data;
  }
}
