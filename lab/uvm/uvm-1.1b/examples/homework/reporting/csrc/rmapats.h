#ifndef __DO_RMAHDR_
#define __DO_RMAHDR_

#ifdef __cplusplus
  extern "C" {
#endif

typedef unsigned long UP;
typedef unsigned U;
typedef unsigned char UB;
typedef unsigned short US;
typedef unsigned char SVAL;
typedef unsigned char TYPEB;
typedef unsigned char scalar;
typedef struct vec32 vec32;
typedef struct qird QIRD;
typedef unsigned char UST_e;
typedef unsigned uscope_t;
typedef U  NumLibs_t;
struct vec32 {
    U  I1;
    U  I2;
};
typedef unsigned RP;
typedef unsigned RO;
typedef unsigned short HsimEdge;
typedef unsigned char HsimExprChar;
typedef U  FlatNodeNum;
typedef U  InstNum;
typedef unsigned long long TimeStamp64;
typedef U  TimeStamp;
typedef TimeStamp  RmaTimeStamp;
typedef TimeStamp64  RmaTimeStamp64;
typedef union {
    double I495;
    unsigned long long I496;
    unsigned  I497[2];
} rma_clock_struct;
typedef struct eblk EBLK;
typedef int (* E_fn)(void);
struct eblk {
    struct eblk * I502;
    E_fn  I503;
    struct iptmpl * I504;
    unsigned I512;
    struct eblk * I513;
};
typedef struct {
    RP  I502;
    RP  I503;
    RP  I504;
    unsigned I512;
    RP  I513;
} RmaEblk;
typedef union {
    double I495;
    unsigned long long I496;
    unsigned  I497[2];
} clock_struct;
typedef clock_struct  RmaClockStruct;
typedef enum {
    PD_SING = 0,
    PD_RF = 1,
    PD_PLSE = 2,
    PD_PLSE_RF = 3,
    PD_NULL = 4
} PD_e;
typedef struct RmaRetain_t RmaRetain;
struct RmaRetain_t {
    RmaEblk  I501;
    RP  I533;
    RP  I534;
    U  I535;
    US  I536 :1;
    US  I537 :4;
    US  newval :2;
    US  I539 :2;
    US  I168 :2;
};
typedef struct MPSched MPS;
typedef struct RmaMPSched RmaMps;
struct MPSched {
    MPS  * I523;
    scalar  I524;
    scalar  I525;
    scalar  I526;
    scalar  fHsim :1;
    scalar  I168 :6;
    U  I528;
    EBLK  I529;
    void * I530;
    UP   I531[1];
};
struct RmaMPSched {
    RP  I523;
    scalar  I524;
    scalar  I525;
    scalar  I526;
    scalar  fHsim :1;
    scalar  I168 :6;
    U  I528;
    RmaEblk  I529;
    RP  I530;
    RP   I531[1];
};
typedef struct RmaMPSchedPulse RmaMpsp;
struct RmaMPSchedPulse {
    RP  I523;
    scalar  I524;
    scalar  I525;
    scalar  I526;
    scalar  I168;
    U  I528;
    RmaEblk  I529;
    scalar  I543;
    scalar  I544;
    scalar  I545;
    scalar  I546;
    U  I547;
    RmaClockStruct  I548;
    RmaClockStruct  I549;
    U  state;
    U  I551;
    RP  I504;
    RP  I552;
    RP  I553;
    RP   I531[1];
};
typedef struct MPItem MPI;
struct MPItem {
    U  * I555;
    void * I556;
};
typedef struct {
    RmaEblk  I501;
    RP  I557;
    scalar  I558;
    scalar  I543;
    scalar  I559;
} RmaTransEventHdr;
typedef struct RmaMPSchedPulseNewCsdf RmaMpspNewCsdf;
struct RmaMPSchedPulseNewCsdf {
    RP  I523;
    scalar  I524;
    scalar  I525;
    scalar  I526;
    scalar  fHsim :1;
    scalar  I168 :6;
    U  I528;
    RmaEblk  I529;
    scalar  I543;
    scalar  I544;
    scalar  I545;
    scalar  I546;
    U  state :4;
    U  I561 :28;
    RmaClockStruct  I548;
    RmaClockStruct  I549;
    RP  I562;
    RP  I504;
    RP  I563;
    RP   I531[1];
};
typedef struct red_t {
    U  I564;
    U  I565;
    U  I566;
} RED;
typedef struct predd {
    PD_e  I168;
    RED   I567[1];
} PREDD;
typedef unsigned long long ULL;
typedef struct {
    RP  I568;
    RP  I552;
    RP  I504;
    RP  I553;
    RmaEblk  I501;
    RmaEblk  I569;
    RP  I570;
    scalar  I558;
    scalar  I543;
    char state;
    uscope_t  I571;
    U  I572;
    RP  I573;
    scalar  I544;
    scalar  I545;
    scalar  I546;
    RmaClockStruct  I548;
    RmaClockStruct  I549;
    RP  I530;
} RmaPulse;
typedef enum {
    QIRDModuleC = 1,
    QIRDSVPackageC = 2
} QIRDModuleType;
typedef struct {
    U  I574 :1;
    U  I575 :1;
    U  I576 :1;
    U  I577 :1;
    U  I578 :1;
    U  I579 :1;
    U  I580 :1;
    U  I581 :1;
    U  I582 :1;
    U  I583 :1;
    U  I584 :1;
    U  I585 :1;
    U  I586 :1;
    U  I587 :1;
    U  I588 :1;
    U  I589 :1;
    U  I590 :1;
    U  I591 :1;
    U  I592 :1;
    U  I593 :1;
    QIRDModuleType  I594 :2;
    U  I595 :1;
    U  I596 :1;
    U  I597 :1;
    U  I598 :1;
    U  I599 :1;
    U  I600 :1;
    U  I601 :1;
    U  I602 :1;
    U  I603 :1;
    U  I604 :1;
    U  I605 :1;
    U  I606 :1;
    U  I607 :1;
    U  I608 :1;
} BitFlags;
struct qird {
    US  I4;
    US  I5;
    U  I6;
    U  I7;
    char * I8;
    char * I9;
    U  * I10;
    char * I11;
    U  I12;
    U  I13;
    struct vcd_rt * I14;
    U  I16;
    struct _vcdOffset_rt * I17;
    UP  * I19;
    U  I20;
    UP  * I21;
    U  I22;
    U  I23;
    U  I24;
    U  * I25;
    U  * I26;
    void * I27;
    U  I28;
    int I29;
    UP  I30;
    U  I31;
    U  I32;
    U  I33;
    UP  I34;
    U  * I35;
    BitFlags  I36;
    U  I37;
    U  I38;
    U  I39;
    U  I40;
    U  I41;
    U  * I42;
    U  I43;
    U  * I44;
    U  I45;
    U  I46;
    U  I47;
    U  I48;
    U  I49;
    U  I50;
    U  I51;
    U  * I52;
    U  I53;
    U  I54;
    U  * I55;
    U  I56;
    U  * I57;
    U  I58;
    U  I59;
    U  I60;
    U  I61;
    U  * I62;
    U  I63;
    U  * I64;
    U  I65;
    U  I66;
    U  I67;
    U  I68;
    U  I69;
    U  I70;
    U  * I71;
    char * I72;
    U  I73;
    U  I74;
    U  I75;
    U  I76;
    U  I77;
    U  * I78;
    U  I79;
    U  I80;
    UP  * I81;
    U  I82;
    U  I83;
    UP  * I84;
    U  I85;
    U  I86;
    U  I87;
    U  I88;
    U  I89;
    U  I90;
    U  * I91;
    U  I92;
    U  I93;
    U  * I94;
    U  * I95;
    U  * I96;
    U  * I97;
    U  * I98;
    U  I99;
    U  I100;
    struct taskInfo * I101;
    U  I103;
    U  I104;
    int * I105;
    UP  * I106;
    U  I107;
    U  I108;
    U  I109;
    U  I110;
    U  I111;
    struct qrefer * I112;
    U  * I114;
    unsigned * I115;
    void * I116;
    U  I117;
    U  I118;
    U  I119;
    U  I120;
    U  * I121;
    U  I122;
    U  * I123;
    U  I124;
    U  I125;
    U  I126;
    U  * I127;
    U  I128;
    U  * I129;
    U  I130;
    U  I131;
    U  * I132;
    U  I133;
    U  I134;
    U  * I135;
    U  * I136;
    U  * I137;
    U  I138;
    U  I139;
    U  I140;
    U  I141;
    U  I142;
    struct qrefee * I143;
    U  * I145;
    U  I146;
    struct qdefrefee * I147;
    U  * I149;
    int (* I150)(void);
    char * I151;
    U  I152;
    U  I153;
    void * I154;
    NumLibs_t  I155;
    char * I156;
    U  * I157;
    U  I158;
    U  I159;
    U  I160;
    U  I161;
    U  I162;
    U  * I163;
    U  * I164;
    int I165;
    struct clock_load * I166;
    int I181;
    struct clock_data * I182;
    int I198;
    struct clock_hiconn * I199;
    U  I203;
    int I204;
    U  I205;
    int I206;
    U  * I207;
    U  * I208;
    U  I209;
    void * I210;
    U  I211;
    U  I212;
    UP  * I213;
    void * I214;
    U  I215;
    UP  * I216;
    U  * I217;
    int (* I218)(void);
    U  * I219;
    UP  * I220;
    U  * I221;
    U  I222;
    U  I223;
    U  I224;
    UP  * I225;
    U  * I226;
    U  I227 :1;
    U  I228 :1;
    U  I229 :1;
    U  I230 :1;
    U  I231 :28;
    U  I232;
    U  I233;
    U  I234;
    U  I235;
    UP  * I236;
    UP  * I237;
    U  * I238;
    U  * I239;
    UP  * I240;
    UP  * I241;
    UP  * I242;
    U  * I243;
    UP  * I244;
    UP  * I245;
    U  I246;
    U  I247;
    U  I248;
    UP  * I249;
    UP  * I250;
    UP  * I251;
    UP  * I252;
    UP  * I253;
    UP  * I254;
    UP  * I255;
    UP  * I256;
    UP  * I257;
    UP  * I258;
    UP  * I259;
    U  I260;
    U  I261;
    U  I262;
    U  I263;
    U  I264;
    U  I265;
    U  I266;
    U  I267;
    U  I268;
    U  I269;
    UP  * I270;
    struct daidirInfo * I271;
    struct vcs_tftable * I273;
    U  I275;
    UP  * I276;
    UP  * I277;
    UP  (* I278)(void);
    UP  (* I279)(void);
    UP  (* I280)(void);
    UP  (* I281)(void);
    int * I282;
    int (* I283)(void);
    char * I284;
    UP  * I285;
    UP  * I286;
    int (* I287)(void);
    int * I288;
    U  * I289;
    U  * I290;
    void * I291;
    U  I292;
    U  I293;
    U  I294;
    U  I295;
    U  I296;
    U  I297;
    UP  * I298;
    U  * I299;
    U  * I300;
    U  I301 :15;
    U  I302 :14;
    U  I303 :1;
    U  I304 :1;
    U  I305 :1;
    U  I306 :3;
    U  I307 :1;
    U  I308 :28;
    struct scope * I309;
    U  I311;
    U  I312;
    U  I313;
    U  * I314;
    U  * I315;
    U  * I316;
    U  I317;
    U  I318;
    U  I319;
    struct pcbt * I320;
    U  I329;
    U  I330;
    void * I331;
    int I332;
    U  I333;
    U  I334;
    U  I335;
    U  I336;
    U  I337;
    void * I338;
    UP  * I339;
    U  I340;
    U  I341;
    void * I342;
    U  I343;
    void * I344;
    U  I345;
    void * I346;
    U  I347;
    int (* I348)(void);
    int (* I349)(void);
    void * I350;
    void * I351;
    void * I352;
    U  I353;
    U  I354;
    char * I355;
    U  I356;
    U  * I357;
    U  I358;
    U  * I359;
    U  I360;
    U  I361;
    U  I362;
    U  I363;
    U  I364;
    U  I365;
    U  * I366;
    U  I367;
    U  I368;
    U  * I369;
    U  I370;
    U  * I371;
    char * I372;
    U  I373;
    U  I374;
    U  I375;
    U  I376;
    U  * I377;
    U  I378;
    U  I379;
    struct cosim_info * I380;
    U  I382;
    U  * I383;
    U  I384;
    U  I385;
    U  * I386;
    U  I387;
    U  * I388;
    U  I389;
    U  I390;
    U  * I391;
    U  I392;
    U  * I393;
    U  I394;
    U  I395;
    U  I396;
    U  I397;
    U  I398;
    U  I399;
    U  I400;
    U  I401;
    U  * I402;
    U  * I403;
    void (* I404)(void);
    U  * I405;
    UP  * I406;
    struct mhdl_outInfo * I407;
    UP  * I409;
    U  I410;
    UP  * I411;
    U  I412;
    void * I413;
    U  * I414;
    void * I415;
    U  I416;
    U  I417;
    void * I418;
    void * I419;
    U  * I420;
    U  * I421;
    U  * I422;
    U  * I423;
    void * I424;
    U  I425;
    void * I426;
    U  * I427;
    char * I428;
    int (* I429)(void);
    U  * I430;
    char * I431;
    char * I432;
    U  I433;
    U  * I434;
    struct regInitInfo * I435;
    UP  * I437;
    U  * I438;
    char * I439;
    U  I440;
    U  I441;
    U  I442;
    U  I443;
    U  I444;
    U  I445;
    U  I446;
    U  I447;
    U  * I448;
    U  * I449;
    U  I450;
    U  I451;
    U  I452;
    U  I453;
    UP  * I454;
    U  I455;
    UP  * I456;
    U  I457;
    U  I458;
    U  I459;
    U  * I460;
    U  * I461;
    UP  * I462;
    UP  * I463;
    void * I464;
    UP  I465;
    void * I466;
    void * I467;
    void * I468;
    U  * I469;
    U  * I470;
    U  I471;
    U  I472;
    int I473;
    void * I474;
    UP  * I475;
    UP  I476;
    U  I477;
    U  I478;
    U  * I479;
    U  I480;
    U  * I481;
    U  I482;
    U  I483;
    U  * I484;
};
typedef struct pcbt {
    U  * I322;
    UP  I323;
    U  I324;
    U  I325;
    U  I326;
    U  I327;
    U  I328;
} PCBT;
struct iptmpl {
    QIRD  * I506;
    struct vcs_globals_t * I507;
    void * I509;
    UP  I510;
    UP  I511;
    struct iptmpl * I504[2];
};
typedef unsigned long long FileOffset;
typedef struct _hsimPeriodL {
    char  I641[256];
    struct _hsimPeriodL * I613;
} HsimPeriodL;
typedef struct {
    U   I643[2];
    U  I644 :1;
    U  I645 :1;
    U  I646 :8;
    U  I647 :8;
    U  I648 :8;
    U  I649 :4;
    unsigned long long I650;
    unsigned long long I651;
    unsigned long long I652;
    unsigned long long I653;
    unsigned long long I654;
    U  I655;
    U  I656;
    U  I657;
    U  I658;
    HsimPeriodL  * I659;
    HsimPeriodL  * I660;
    U  I661;
} HsimSignalMonitor;
typedef struct {
    FlatNodeNum  I662;
    InstNum  I663;
    scalar  I664;
    U  I665;
    U  I666;
    U  I667;
    U  I668;
    U  I669;
    U  I670;
    U  I671;
    HsimSignalMonitor  * I672;
    RmaTimeStamp64  I673;
    U  I674;
} HsimNodeRecord;
typedef struct {
    RP  I675;
    RP  I504;
} RmaIbfIp;
typedef struct {
    RP  I675;
    RP  I676;
} RmaIbfPcode;
typedef struct {
    RmaEblk  I501;
} RmaEvTriggeredOrSyncLoadCg;
typedef struct {
    RmaEblk  I501;
    RP  I677;
    vec32  I678;
} RmaAnySchedVCg;
typedef struct {
    RmaEblk  I501;
    RP  I677;
    vec32   I679[1];
} RmaAnySchedWCg;
typedef struct {
    RmaEblk  I501;
    RP  I677;
    scalar   I680[1];
} RmaAnySchedECg;
typedef struct {
    RP  I681;
} RmaRootCbkCg;
typedef struct {
    RP  I682;
} RmaRootVcdCg;
typedef struct {
    RP  I683;
} RmaRootForceCbkCg;
typedef struct {
    RmaEblk  I501;
    RP  I684;
} RmaForceCbkJmpCg;
typedef struct {
    RP  ptable;
    RP  pfn;
    RP  I676;
} Rma1InputGateFaninCgS;
typedef struct {
    U  I5;
    U  iinput;
    RP  I690;
} RmaCondOptLoad;
typedef struct {
    U  I5;
    U  iinput;
    RP  I690;
} RmaCellStateUpdate;
typedef struct {
    U  I5;
    U  state;
    US  I691;
    US  I616;
    U  * I692;
} RmaCellState;
typedef struct {
    U  iinput;
    RP  I693;
} RmaMultiInputLogicGateCg;
typedef struct {
    U  iinput;
    RP  ptable;
    RP  I693;
} RmaSeqPrimEdgeInputCg;
typedef struct {
    RmaEblk  I501;
    RP  I676;
} RmaSched0GateCg;
typedef struct {
    RmaEblk  I501;
    RP  I676;
    RP  pfn;
} RmaUdpDeltaGateCg;
typedef struct {
    scalar  I694;
    RmaEblk  I501;
    RP  I676;
    RP  pfn;
} RmaSchedDeltaGateCg;
typedef struct {
    UB  I695;
    RP  I696;
    RP  I697;
} RmaPropNodeSeqLhsSCg;
typedef struct {
    RmaEblk  I501;
    RP  I676;
    U  I621;
    U   I492[1];
} RmaBitEdgeEblk;
typedef struct {
    U  I5;
    RP  I567;
    RmaEblk  I501;
    RmaIbfPcode  I698;
} RmaGateDelay;
typedef struct {
    U  I5;
    union {
        RP  I791;
        RP  I997;
        RP  I1003;
    } I533;
    RmaIbfPcode  I698;
} RmaMPDelay;
typedef struct {
    U  I5;
    RmaPulse  I699;
    RmaIbfPcode  I698;
} RmaMPPulseHybridDelay;
typedef struct {
    U  I5;
    RmaIbfPcode  I698;
    RmaMps  I700;
} RmaMPHybridDelay;
typedef struct {
    U  I5;
    U  I701;
    RmaIbfPcode  I698;
    RmaEblk  I529;
} RmaMPHybridDelayPacked;
typedef struct {
    U  I5;
    RmaIbfPcode  I698;
    RmaMpspNewCsdf  I702;
} RmaMPPulseDelay;
typedef struct {
    U  I5;
    RmaMpsp  I702;
    RmaIbfPcode  I698;
} RmaMPPulseOptHybridDelay;
typedef struct {
    U  I5;
    U  I566;
    RmaTransEventHdr  I626;
    RP  I563;
    RmaIbfPcode  I698;
} RmaNtcTransDelay;
typedef struct {
    U  I5;
    U  I566;
    RmaEblk  I501;
    RmaIbfPcode  I698;
} RmaNtcTransMpwOptDelay;
typedef struct {
    U  I5;
    RmaEblk  I501;
    RmaIbfPcode  I698;
} RmaNtcTransZeroDelay;
typedef struct {
    U  I5;
    U  I703;
    U  I704;
    RmaTransEventHdr  I626;
    RP  I563;
    RmaIbfPcode  I698;
} RmaNtcTransDelayRF;
typedef struct {
    U  I5;
    U  I703;
    U  I704;
    RmaEblk  I501;
    RmaIbfPcode  I698;
} RmaNtcTransMpwOptDelayRF;
typedef struct {
    U  I5;
    RP  I705;
    RmaTransEventHdr  I626;
    RP  I563;
    RmaIbfPcode  I698;
} RmaICTransDelay;
typedef struct {
    U  I5;
    RP  I705;
    RmaEblk  I501;
    RmaIbfPcode  I698;
} RmaICTransMpwOptDelay;
typedef struct {
    U  I5;
    RmaEblk  I501;
    RmaIbfPcode  I698;
} RmaICTransZeroDelay;
typedef struct {
    U  I5;
    RP  I567;
    RmaEblk  I501;
    RmaIbfPcode  I698;
} RmaICSimpleDelay;
typedef struct {
    U  I5;
    union {
        RP  psimple;
        RP  I997;
        RP  I1003;
    } I533;
    RmaIbfPcode  I698;
} RmaICDelay;
typedef struct {
    U  I5;
    RP  I567;
    RmaEblk  I501;
    RmaIbfPcode  I698;
} RmaPortDelay;
typedef struct TableAssign_ {
    struct TableAssign_ * I613;
    struct TableAssign_ * I557;
    U  I5;
    U  iinput;
    RP  ptable;
    RP  I693;
} TableAssign;
typedef struct {
    U  I5;
    RP  I557;
    RP  I707;
} RmaTableAssignList;
typedef struct {
    RP  I708;
} RmaWakeupListCg;
typedef struct {
    U  I709;
    U  I710;
    RmaTimeStamp   I711[1];
} RmaTsArray;
typedef struct {
    RP  I613;
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
} RmaTcCoreSimple;
typedef struct {
    RP  I613;
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
    RP  I722;
} RmaTcCoreConditional;
typedef struct {
    RP  I613;
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
    RP  I722;
    RP  I723;
} RmaTcCoreConditionalOpt;
typedef struct {
    RP  I613;
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
    RP  I723;
    RP  I724;
} RmaTcCoreConditionalMtc;
typedef struct {
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
} RmaTcCoreSimpleNoList;
typedef struct {
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
    RP  I725;
} RmaTcCoreSimpleNoListMdb;
typedef struct {
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
    RP  I722;
} RmaTcCoreConditionalNoList;
typedef struct {
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
    RP  I722;
    RP  I723;
} RmaTcCoreConditionalOptNoList;
typedef struct {
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
    RP  I723;
    RP  I724;
} RmaTcCoreConditionalMtcNoList;
typedef struct {
    RP  I712;
    RP  I498;
    U  I713;
    scalar  I714;
    scalar  I715;
    US  I716 :1;
    US  I717 :1;
    US  I718 :1;
    US  I719 :1;
    US  I720 :1;
    US  I721 :11;
    RP  I722;
    RP  I725;
} RmaTcCoreConditionalNoListMdb;
typedef struct {
    RP  I726;
    RmaTimeStamp  I727;
    scalar  I728;
} RmaConditionalTSLoadNoList;
typedef struct {
    RP  I613;
    RP  I726;
    RmaTimeStamp  I727;
    scalar  I728;
} RmaConditionalTSLoad;
typedef struct {
    RmaTimeStamp  I727;
    scalar  I728;
    US  I714;
    RP  I723;
} RmaConditionalTSLoadOptNoList;
typedef struct {
    RP  I613;
    RmaTimeStamp  I727;
    scalar  I728;
    US  I714;
    RP  I723;
} RmaConditionalTSLoadOpt;
typedef struct {
    RP  I723;
    RP  I729;
} RmaConditionalTSLoadMtcNoList;
typedef struct {
    RP  I613;
    RP  I723;
    RP  I729;
} RmaConditionalTSLoadMtc;
typedef struct {
    U  I730;
    U  I731;
    FlatNodeNum  I732;
    U  I621;
    U  I733;
    U  I734;
    RmaIbfPcode  I698;
    union {
        scalar  I735;
        vec32  I736;
        scalar  * I737;
        vec32  * I738;
    } val;
} RmaScanSwitchData;
typedef struct {
    RP  I613;
    RP  I557;
    RP  I739;
} RmaDoublyLinkedListElem;
typedef struct {
    RmaDoublyLinkedListElem  I740;
    RmaIbfPcode  I698;
} RmaSwitchGate;
struct clock_load {
    U  I168 :5;
    U  I169 :12;
    U  I170 :1;
    U  I171 :2;
    U  I172 :1;
    U  I173 :1;
    U  I174 :1;
    U  I175 :9;
    U  I176;
    U  I177;
    void (* pfn)(void * I179, char val);
};
typedef struct clock_data {
    U  I184 :1;
    U  I185 :1;
    U  I186 :1;
    U  I187 :1;
    U  I168 :5;
    U  I169 :12;
    U  I188 :6;
    U  I189 :1;
    U  I171 :2;
    U  I172 :1;
    U  I175 :1;
    U  I190;
    U  I191;
    U  I192;
    U  I176;
    U  I193;
    U  I194;
    U  I195;
    U  I196;
    U  I197;
} HdbsClockData;
struct clock_hiconn {
    U  I201;
    U  I202;
    U  I176;
    U  I171;
};
typedef struct _RmaDaiCg {
    RP  I741;
    RP  I742;
    U  I743;
} RmaDaiCg;
typedef union _RmaCbkMemOptUnion {
    RP  I741;
    RP  I744;
    RP  I745;
} RmaCbkMemOptUnion;
typedef struct _RmaDaiOptCg {
    RmaCbkMemOptUnion  I746;
} RmaDaiOptCg;
struct futq {
    struct futq * I514;
    struct futq * I516;
    RmaEblk  * I517;
    RmaEblk  * I518;
    U  I512;
};
struct sched_table {
    struct futq * I519;
    struct futq I520;
    struct hash_bucket * I521;
};
struct dummyq_struct {
    clock_struct  I747;
    EBLK  * I748;
    EBLK  * I749;
    struct futq * I750;
    struct futq * I751;
    struct sched_table * I752;
    struct millenium * I754;
    EBLK  * I756;
    EBLK  * I757;
    EBLK  * I758;
    EBLK  * I759;
    EBLK  * I760;
    EBLK  * I761;
    EBLK  * I762;
    EBLK  * I763;
    EBLK  * I764;
    EBLK  * I765;
    EBLK  * I766;
    EBLK  * I767;
    EBLK  * I768;
    EBLK  * I769;
    EBLK  * I770;
    MPS  * I771;
};
typedef void (* FP)(void *  , scalar   );
typedef void (* FP1)(void *  );
typedef void (* FPRAP)(void *  , vec32  *  , U   );
typedef U  (* FPU1)(void *  );
typedef void (* FPV)(void *  , UB  *  );
typedef void (* FPVU)(void *  , UB  *  , U   );
typedef void (* FPLSEL)(void *  , scalar   , U   );
typedef void (* FPLSELV)(void *  , vec32  *  , U   , U   );
typedef void (* FPFPV)(UB  *  , UB  *  , U   , U   , U   , U   , U   , UB  *  , U   );
typedef void (* FPRPV)(UB  *  , U   , U   , U   );
typedef void (* FPEVCDLSEL)(void *  , scalar   , U   , UB  *  );
typedef void (* FPEVCDLSELV)(void *  , vec32  *  , U   , U   , UB  *  );
typedef struct _lqueue {
    EBLK  * I502;
    EBLK  * I772;
    int I773;
    struct _lqueue * I534;
} Queue;
typedef struct {
    EBLK  I775;
    U  I776;
    union {
        void * pHeap;
        Queue  * pList;
    } I489;
    Queue   I777[1];
} Qhdr;
extern UB   Xvalchg[];
extern UB   X4val[];
extern UB   X3val[];
extern UB   XcvtstrTR[];
extern UB   Xbuf[];
extern UB   Xbitnot[];
extern UB   Xwor[];
extern UB   Xwand[];
extern U   Xbitnot4val[];
extern UB   globalTable1Input[];
extern unsigned long long vcs_clocks;
extern UB   Xunion[];
extern U  fRTFrcRelCbk;
extern FP  txpFnPtr;
extern FP   rmaFunctionArray[];
extern FP   rmaFunctionRtlArray[];
extern U  rmaFunctionCount;
extern UB  dummyScalar;
extern UB  fScalarIsForced;
extern UB  fScalarIsReleased;
extern U  fNotimingchecks;
extern RP  * iparr;
extern FP1  * rmaPostAnySchedFnPtr;
extern FP1  * rmaPostAnySchedVFnPtr;
extern FP1  * rmaPostAnySchedWFnPtr;
extern FP1  * rmaPostAnySchedEFnPtr;
extern FP1  * rmaPostSchedUpdateClockStatusFnPtr;
extern FP1  * rmaPostSchedUpdateClockStatusNonCongruentFnPtr;
extern FP1  * rmaPostSchedUpdateEvTrigFnPtr;
extern FP1  * rmaSched0UpdateEvTrigFnPtr;
extern FP1  * rmaPostSchedRecoveryResetDbsFnPtr;
extern U  fGblDataOrTime0Prop;
extern UB   rmaEdgeStatusValArr[];
extern FP1  * propForceCbkSPostSchedCgFnPtr;
extern FP1  * propForceCbkMemoptSPostSchedCgFnPtr;
extern UB  * ptableGbl;
extern Qhdr  * lvlQueue;
extern U  mhdl_delta_count;
extern U  ignoreSchedForScanOpt;
extern U  fignoreSchedForDeadComboCloud;
extern int fZeroUser;
extern EBLK  * peblkFutQ1Head;
extern EBLK  * peblkFutQ1Tail;


extern void *mempcpy(void* s1, void* s2, unsigned n);
extern UB* rmaEvalDelays(UB* pcode, scalar val);
extern UB* rmaEvalDelaysV(UB* pcode, vec32* pval);
extern void rmaPopTransEvent(UB* pcode);
extern void rmaSetupFuncArray(UP* ra, U c, U w);
extern void SinitHsimPats(void);
extern void VVrpDaicb(void* ip, U nIndex);
extern int SDaicb(void *ip, U nIndex);
extern void SDaicbForHsimNoFlagScalar(void* pDaiCb, unsigned char value);
extern void SDaicbForHsimNoFlagStrengthScalar(void* pDaiCb, unsigned char value);
extern void SDaicbForHsimNoFlag(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimNoFlag2(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimWithFlag(void* pRmaDaiCg, unsigned char value);
extern void SDaicbForHsimNoFlagFrcRel(void* pRmaDaiCg, unsigned char reason, int msb, int lsb, int ndx);
extern void SDaicbForHsimNoFlagFrcRel2(void* pRmaDaiCg, unsigned char reason, int msb, int lsb, int ndx);
extern void VcsHsimValueChangeCB(void* pRmaDaiCg, void* pValue, unsigned int valueFormat);
extern U isNonDesignNodeCallbackList(void* pRmaDaiCg);
extern void SDaicbForHsimCbkMemOptNoFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptNoFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagScalar(void* pDaiCb, unsigned char value, unsigned char isStrength);
extern void VVrpNonEventNonRegdScalarForHsimOptCbkMemopt(void* ip, U nIndex);
extern void SDaicbForHsimCbkMemOptNoFlagDynElabScalar(U* mem, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptWithFlagDynElabScalar(U* mem, unsigned char value, unsigned char isStrength);
extern void SDaicbForHsimCbkMemOptNoFlagDynElabFrcRel(U* mem, unsigned char reason, int msb, int lsb, int ndx);
extern void SDaicbForHsimCbkMemOptNoFlagFrcRel(void* pDaiCb, unsigned char reason, int msb, int lsb, int ndx);
extern void hsimDispatchCbkMemOptForVcd(RP p, U val);
extern void* hsimGetCbkMemOptCallback(RP p);
extern void hsimDispatchCbkMemOptNoDynElabS(RP* p, U val, U isStrength);
extern void* hsimGetCbkPtrNoDynElab(RP p);
extern void hsimDispatchCbkMemOptDynElabS(U** pvcdarr, U** pcbkarr, U val, U isScalForced, U isScalReleased, U isStrength);
extern void hsimDispatchCbkMemOptNoDynElabVector(RP* /*RmaDaiOptCg* */p, void* pval, U /*RmaValueType*/ vt, U cbits);
extern void copyAndPropRootCbkCgS(RmaRootCbkCg* pRootCbk, scalar val);
extern void copyAndPropRootCbkCgV(RmaRootCbkCg* rootCbk, vec32* pval);
extern void copyAndPropRootCbkCgW(RmaRootCbkCg* rootCbk, vec32* pval);
extern void copyAndPropRootCbkCgE(RmaRootCbkCg* rootCbk, scalar* pval);
extern void dumpRootVcdCg(RmaRootVcdCg* pRootVcd, scalar val);
extern void Wsvvar_callback_non_dynamic1(RP* ptr, int);
extern void rmaExecEvSyncList(RP plist);
extern void Wsvvar_callback_virt_intf(RP* ptr);
extern void Wsvvar_callback_hsim_var(RP* ptr);
extern void checkAndConvertVec32To2State(vec32* value, vec32* svalue, U cbits, U* pforcedBits);
extern unsigned int fGblDataOrTime0Prop;
extern void SchedSemiLerMP1(UB* pmps, U partId);
extern void SchedSemiLerMPO(UB* pmpso, U partId);
extern void rmaDummyPropagate(void);
extern void hsUpdateModpathTimeStamp(UB* pmps);
extern void doMpd32One(UB* pmps);
extern void SchedSemiLerMP(UB* ppulse, U partId);
extern EBLK *peblkFutQ1Head;
extern EBLK *peblkFutQ1Tail;
extern void scheduleuna(UB *e, U t);
extern void scheduleuna_mp(EBLK *e, unsigned t);
extern void schedule(UB *e, U t);
extern void sched_hsopt(struct dummyq_struct * pQ, EBLK *e, U t);
extern void sched_millenium(struct dummyq_struct * pQ, void *e, U thigh, U t);
extern void schedule_1(EBLK *e);
extern void sched0(UB *e);
extern void sched0Raptor(UB *e);
extern void sched0lq(UB *e);
extern void sched0lqnc(EBLK *e);
extern void sched0una(UB *e);
extern void sched0una_th(struct dummyq_struct *pq, UB *e);
extern void scheduleuna_mp_th(struct dummyq_struct *pq, EBLK *e, unsigned t);
extern void schedal(UB *e);
extern void sched0_th(struct dummyq_struct * pQ, UB *e);
extern void sched0_hsim_front_th(struct dummyq_struct * pQ, UB *e);
extern void sched0_hsim_frontlq_th(struct dummyq_struct * pQ, UB *e);
extern void sched0lq_th(struct dummyq_struct * pQ, UB *e);
extern void schedal_th(struct dummyq_struct * pQ, UB *e);
extern void scheduleuna_th(struct dummyq_struct * pQ, void *e, U t);
extern void schedule_th(struct dummyq_struct * pQ, UB *e, U t);
extern void schedule_1_th(struct dummyq_struct * pQ, EBLK *peblk);
extern void SetupLER_th(struct dummyq_struct * pQ, UB *e);
extern void SchedSemiLer_th(struct dummyq_struct * pQ, EBLK *e);
extern void SchedSemiLerTXP_th(struct dummyq_struct * pQ, EBLK *e);
extern void SchedSemiLerTXPFreeVar_th(struct dummyq_struct * pQ, EBLK *e);
extern U getVcdFlags(UB *ip);
extern void VVrpNonEventNonRegdScalarForHsimOpt(void* ip, U nIndex);
extern void VVrpNonEventNonRegdScalarForHsimOpt2(void* ip, U nIndex);
extern void SchedSemiLerTBReactiveRegion(struct eblk* peblk);
extern void SchedSemiLerTBReactiveRegion_th(struct eblk* peblk, U partId);
extern void SchedSemiLerTr(UB* peblk, U partId);
extern void sched0sd_hsim(UB* peblk);
extern void appendNtcEvent(UB* phdr, scalar s, U schedDelta);
extern void hsimRegisterEdge(void* sm,  scalar s);
extern U pvcsGetPartId();
extern void HsimPVCSPartIdCheck(U instNo);
extern void debug_func(U partId, struct dummyq_struct* pQ, EBLK* EblkLastEventx); 
extern struct dummyq_struct* pvcsGetQ(U thid);
extern EBLK* pvcsGetLastEventEblk(U thid);
extern void insertTransEvent(RmaTransEventHdr* phdr, scalar s, scalar pv,	scalar resval, U schedDelta, int re, UB* predd, U fpdd);
extern void insertNtcEventRF(RmaTransEventHdr* phdr, scalar s, scalar pv, scalar resval, U schedDelta, U* delays);
extern U doTimingViolation(RmaTimeStamp ts,RP* pdata, U fskew, U limit, U floaded, U fcondopt);
extern void sched_gate_hsim(EBLK* peblk, unsigned t, RP* offset);
extern int getCurSchedRegion();
extern FP getRoutPtr(RP, U);
extern U rmaChangeCheckAndUpdateE(scalar* pvalDst, scalar* pvalSrc, U cbits);
extern void rmaUpdateE(scalar* pvalDst, scalar* pvalSrc, U cbits);
extern U rmaChangeCheckAndUpdateEFromW(scalar* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaLhsPartSelUpdateE(scalar* pvalDst, scalar* pvalSrc, U index, U width);
extern void rmaUpdateWithForceSelectorE(scalar* pvalDst, scalar* pvalSrc, U cbits, U* pforceSelector);
extern void rmaUpdateWFromE(vec32* pvalDst, scalar* pvalSrc, U cbits);
extern U rmaLhsPartSelWithChangeCheckE(scalar* pvalDst, scalar* pvalSrc, U index, U width);
extern void rmaLhsPartSelWFromE(vec32* pvalDst, scalar* pvalSrc, U index,U width);
extern U rmaChangeCheckAndUpdateW(vec32* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaUpdateW(vec32* pvalDst, vec32* pvalSrc, U cbits);
extern void rmaUpdateEFromW(scalar* pvalDst, vec32* pvalSrc, U cbits);
extern U rmaLhsPartSelWithChangeCheckW(vec32* pvalDst, vec32* pvalSrc, U index,U width);
extern void rmaLhsPartSelEFromW(scalar* pvalDst, vec32* pvalSrc, U index,U width);
extern U rmaLhsPartSelWithChangeCheckEFromW(scalar* pvalDst, vec32* pvalSrc, U index,U width);
extern void rmaLhsPartSelUpdateW(vec32* pvalDst, vec32* pvalSrc, U index, U width);
extern void rmaEvalWunionW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalWorW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalWandW(vec32* dst, vec32* src, U cbits, U count);
extern void rmaEvalUnionE(scalar* dst, scalar* src, U cbits, U count, RP ptable);
typedef U RmaCgFunctionType;
extern RmaIbfPcode* rmaEvalPartSelectsW(vec32* pvec32, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode, U fnonRootForce);
extern RmaIbfPcode* rmaEvalPartSelectsEToE(scalar* pv, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode, U fnonRootForce, UB* pevcdStatus);
extern RmaIbfPcode* rmaEvalPartSelectsEToW(scalar* pv, U startIndex, U onWidth, U offWidth, U count, RmaIbfPcode* pibfPcode, U fnonRootForce);
extern U rmaEvalBitPosEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitNegEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitChangeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U VcsForceVecVCg(UB* pcode, UB* pval, UB* pvDst, UB* pvCur, U fullcbits, U ibeginSrc, U ibeginDst, U width, U/*RmaValueConvType*/ convtype, U/*RmaForceType*/ frcType, UB* prhs, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsReleaseVecVCg(UB* pcode, UB* pvDst, U fullcbits, U ibeginDst, U width, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsForceVecWCg(UB* pcode, UB* pval, UB* pvDst, UB* pvCur, U fullcbits, U ibeginSrc, U ibeginDst, U width, U/*RmaValueConvType*/ convtype, U /*RmaForceType*/ frcType, UB* prhs, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsReleaseVecWCg(UB* pcode, UB* pvDst, U fullcbits, U ibeginDst, U width, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsForceVecECg(UB* pcode, UB* pval, UB* pvDst, UB* pvCur, U fullcbits, U ibeginSrc, U ibeginDst, U width, U /*RmaValueConvType*/ convtype, U /*RmaForceType*/ frcType,UB* prhs, UB* prhsDst, U frhs, U* pforcedbits, U fisRoot);
extern U VcsReleaseVecCg(UB* pcode, UB* pvDst, U ibeginDst, U width, U /*RmaValueType*/ type,U fisRoot, UB* prhsDst, U frhs, U* pforcedbits);
extern U VcsDriveBitsAndDoChangeCheckV(vec32* pvSel, vec32* pvCur, U fullcbits, U* pforcedbits, U isRoot);
extern U VcsDriveBitsAndDoChangeCheckW(vec32* pvSel, vec32* pvCur, U fullcbits, U* pforcedbits, U isRoot);
extern U VcsDriveBitsAndDoChangeCheckE(scalar* pvSel, scalar* pvCur, U fullcbits, U* pforcedbits, U isRoot);
extern void cgvecDebug_Eblk(UB* pcode);
extern U rmaCmpW(vec32* pvalDst, vec32* pvalSrc, U index, U width);
extern void copyVec32ArrMask(vec32* pv1, vec32* pv2, U len, U* mask);
extern void* memcpy(void*, const void*, size_t);
extern int memcmp(const void*, const void*, size_t);
extern void propagateScanOptPathVal(EBLK *peblk);
extern UB* rmaProcessScanSwitches(UB* pcode, scalar val);
extern UB* rmaProcessScanSwitchesV(UB* pcode, vec32 *pval);
extern UB* rmaProcessScanoptDump(UB* pcode, scalar val);
extern UB* rmaProcessScanoptDumpV(UB* pcode, vec32 *pval);
extern UB* rmaProcessScanChainOptSeqPrims(UB* pcode, scalar val);
extern void schedResetRecoveryDbs(U cedges, EBLK* peblkFirst);
extern UB* rmaEvalUnaryOpV(UB* pcode, vec32* pval);
extern UB* rmaEvalBinaryOpV(UB* pcode, vec32* pval);
extern UB* rmaEvalBinaryOpVOneFanoutCount(UB* pcode, vec32* pval);
extern UB* rmaEvalBinaryOpVLargeFanoutCount(UB* pcode, vec32* pval);
extern UB* rmaEvalAndOpVOneFanoutCount(UB* pcode, vec32* value);
extern UB* rmaEvalAndOpVLargeFanoutCount(UB* pcode, vec32* value);
extern UB* rmaEvalAndOpV(UB* pcode, vec32* value);
extern UB* rmaEvalOrOpVOneFanoutCount(UB* pcode, vec32* value);
extern UB* rmaEvalOrOpVLargeFanoutCount(UB* pcode, vec32* value);
extern UB* rmaEvalOrOpV(UB* pcode, vec32* value);
extern UB* rmaEvalTernaryOpV(UB* pcode, vec32* pval);
extern UB* rmaEvalUnaryOpW(UB* pcode, vec32* pval);
extern UB* rmaEvalBinaryOpW(UB* pcode, vec32* pval);
extern UB* rmaEvalTernaryOpW(UB* pcode, vec32* pval);
extern UB* rmaEvalUnaryOpE(UB* pcode, scalar* pv);
extern UB* rmaEvalBinaryOpE(UB* pcode, scalar* pv);
extern UB* rmaEvalTernaryOpE(UB* pcode, scalar* pv);
extern UB* rmaEvalTernaryOpS(UB* pcode, scalar val);
extern scalar rmaGetScalarFromWCg(vec32* pval, U index);
extern void rmaSetScalarInWCg(vec32* pval, U index, scalar s);
extern void rmaCountRaptorBits(void* pval, void* pvalPrev, U cbits, U vt);
extern void setHsimFunc(void* ip);
extern void unsetHsimFunc(void* ip);
extern UB* getEvcdStatusByFlagsE(scalar* pscalar, UB* pevcdTBDriverFlags, U cdrivers, UB* table, U cbits);
extern UB* getEvcdStatusByFlagsV(vec32* pvec32, UB* pevcdTBDriverFlags, U cdrivers, UB* table, U cbits);
extern UB* getEvcdStatusByFlagsS(scalar* pscalar, UB* pevcdTBDriverFlags, U cdrivers, UB* table);
extern UB* getSingleDrvEvcdStatusS(UB value, U fTBDriver);
extern UB* getSingleDrvEvcdStatusE(scalar* pscalars, U fTBDriver, U cbits);
extern UB* getSingleDrvEvcdStatusV(scalar* pscalars, U fTBDriver, U cbits);
extern UB* getEvcdStatusByDrvEvcdStatus(UB* pdrvevcdStatus, U cdrivers, UB* table, U cbits);
extern void evcdCallback(UP pcode, U cbits);
extern UB* getSavedEvcdStatus(void);
extern void saveEvcdStatus(UB*);
extern void mhdlMarkExport(void*, U);
extern void levelInsertQueue(int);
extern void VcsRciRtl(RP pcode);
extern EBLK* loopReportInlinedSched0Wrapper(EBLK *peblk);
extern void loopReportSched0Wrapper(EBLK *peblk, unsigned int sfType, unsigned int fTH, struct dummyq_struct* pq);
extern void loopReportSchedSemiLerWrapper(EBLK *peblk, int sfType);
extern void CallGraphPushNodeAndAddToGraph(UP flatNode, UP instNum, U dummy);
extern void CallGraphPopNode(void);
extern RP elabGetIpTpl(U in);
extern U rmaEvalBitBothEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitEdgeQ1W(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitEdgeQXW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitEdgeQ0W(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEval01EdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEval0XEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEval10EdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEval1XEdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalX1EdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalX0EdgeW(vec32* pvalCurr, vec32* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitPosEdgeE(scalar* pvalCurr, scalar* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitNegEdgeE(scalar* pvalCurr, scalar* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitBothEdgeE(scalar* pvalCurr, scalar* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitEdgeQ1E(scalar* pvalCurr, scalar* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitEdgeQ0E(scalar* pvalCurr, scalar* pvalPrev, U cbits, U* pedges);
extern U rmaEvalBitChangeE(scalar* pvalCurr, scalar* pvalPrev, U cbits, U* pedges);
typedef void (*FuncPtr)();


#ifdef __cplusplus
extern "C" {
#endif
void  hsG_0(struct dummyq_struct * I783, EBLK  * I784, U  I566);
U   hsG_1(U  I797);
#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
  }
#endif
#endif /*__DO_RMAHDR_*/

