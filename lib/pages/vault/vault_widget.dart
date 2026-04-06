import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'vault_model.dart';
export 'vault_model.dart';

class VaultWidget extends StatefulWidget {
  const VaultWidget({super.key});

  static String routeName = 'Vault';
  static String routePath = '/vault';

  @override
  State<VaultWidget> createState() => _VaultWidgetState();
}

class _VaultWidgetState extends State<VaultWidget> {
  late VaultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VaultModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.weekResult = await actions.getVaultedItems(
        FFAppState().categoryContents.toList(),
        'thisWeek',
      );
      FFAppState().weekVaultItems = _model.weekResult!.toList().cast<dynamic>();
      safeSetState(() {});
      _model.earlierResult = await actions.getVaultedItems(
        FFAppState().categoryContents.toList(),
        'earlier',
      );
      FFAppState().earlierVaultItems =
          _model.earlierResult!.toList().cast<dynamic>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).deepNavy,
                FlutterFlowTheme.of(context).gradientBg2,
                FlutterFlowTheme.of(context).gradientBg1,
                FlutterFlowTheme.of(context).midnightBlue
              ],
              stops: [0, 0.3, 0.5, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8,
                          buttonSize: 40,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                          child: Text(
                            'Saved Motivations',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 24,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                color: Color(0x4CD4AF37),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.48,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(0, -1),
                  child: Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 50, 24, 16),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(),
                                      alignment: AlignmentDirectional(0, -1),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            color: FlutterFlowTheme.of(context)
                                                .header2,
                                            size: 28,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18, 0, 0, 0),
                                            child: Text(
                                              'This Week',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .header2,
                                                        fontSize: 24,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (FFAppState().weekVaultItems.length == 0)
                                      Text(
                                        'No saved motivations yet.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        final weeklyResult = FFAppState()
                                            .weekVaultItems
                                            .map((e) => e)
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: weeklyResult.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 16),
                                          itemBuilder:
                                              (context, weeklyResultIndex) {
                                            final weeklyResultItem =
                                                weeklyResult[weeklyResultIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  FullMotivationViewWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'motivationText':
                                                        serializeParam(
                                                      getJsonField(
                                                        weeklyResultItem,
                                                        r'''$["content"]''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'id': serializeParam(
                                                      getJsonField(
                                                        weeklyResultItem,
                                                        r'''$["id"]''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'motivationTitle':
                                                        serializeParam(
                                                      getJsonField(
                                                        weeklyResultItem,
                                                        r'''$["title"]''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'categoryName':
                                                        serializeParam(
                                                      getJsonField(
                                                        weeklyResultItem,
                                                        r'''$["category"]''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'date': serializeParam(
                                                      getJsonField(
                                                        weeklyResultItem,
                                                        r'''$["dateCreated"]''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                constraints: BoxConstraints(
                                                  maxHeight: 140,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFF7EC),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        2,
                                                        2,
                                                      ),
                                                      spreadRadius: 4,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12),
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .header2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(14, 14, 14, 14),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Text(
                                                          getJsonField(
                                                            weeklyResultItem,
                                                            r'''$["title"]''',
                                                          ).toString(),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 22,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: Text(
                                                            getJsonField(
                                                              weeklyResultItem,
                                                              r'''$["content"]''',
                                                            ).toString(),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize: 18,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                getJsonField(
                                                                  weeklyResultItem,
                                                                  r'''$["savedDate"]''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      fontSize:
                                                                          14,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, 0),
                                                            child: Container(
                                                              width: 50,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius: 8,
                                                                buttonSize: 48,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .trashAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 18,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Remove from Vault'),
                                                                                content: Text('Are you sure you want to remove this from your vault?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('No'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Yes'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    _model.updatedResult =
                                                                        await actions
                                                                            .removeFromVault(
                                                                      FFAppState()
                                                                          .categoryContents
                                                                          .toList(),
                                                                      getJsonField(
                                                                        weeklyResultItem,
                                                                        r'''$["id"]''',
                                                                      ).toString(),
                                                                    );
                                                                    FFAppState().categoryContents = _model
                                                                        .updatedResult!
                                                                        .toList()
                                                                        .cast<
                                                                            dynamic>();
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.weekResult2 =
                                                                        await actions
                                                                            .getVaultedItems(
                                                                      FFAppState()
                                                                          .categoryContents
                                                                          .toList(),
                                                                      'thisWeek',
                                                                    );
                                                                    FFAppState().weekVaultItems = _model
                                                                        .weekResult2!
                                                                        .toList()
                                                                        .cast<
                                                                            dynamic>();
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ]
                                      .divide(SizedBox(height: 20))
                                      .addToStart(SizedBox(height: 0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.28,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(0, -1),
                  child: Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 24, 16),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.update_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .header2,
                                            size: 28,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18, 0, 0, 0),
                                            child: Text(
                                              'Earlier',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .header2,
                                                        fontSize: 24,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (FFAppState().earlierVaultItems.length ==
                                        0)
                                      Text(
                                        'No saved motivations yet.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 20),
                                      child: Builder(
                                        builder: (context) {
                                          final earlyResult = FFAppState()
                                              .earlierVaultItems
                                              .map((e) => e)
                                              .toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: earlyResult.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 16),
                                            itemBuilder:
                                                (context, earlyResultIndex) {
                                              final earlyResultItem =
                                                  earlyResult[earlyResultIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    FullMotivationViewWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'motivationText':
                                                          serializeParam(
                                                        getJsonField(
                                                          earlyResultItem,
                                                          r'''$["content"]''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          earlyResultItem,
                                                          r'''$["id"]''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'motivationTitle':
                                                          serializeParam(
                                                        getJsonField(
                                                          earlyResultItem,
                                                          r'''$["title"]''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'categoryName':
                                                          serializeParam(
                                                        getJsonField(
                                                          earlyResultItem,
                                                          r'''$["category"]''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'date': serializeParam(
                                                        getJsonField(
                                                          earlyResultItem,
                                                          r'''$["dateCreated"]''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  constraints: BoxConstraints(
                                                    maxHeight: 140,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFF7EC),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          2,
                                                          2,
                                                        ),
                                                        spreadRadius: 4,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(12),
                                                      topRight:
                                                          Radius.circular(12),
                                                      bottomLeft:
                                                          Radius.circular(12),
                                                      bottomRight:
                                                          Radius.circular(12),
                                                    ),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .header2,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                14, 14, 14, 14),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Text(
                                                            getJsonField(
                                                              earlyResultItem,
                                                              r'''$["title"]''',
                                                            ).toString(),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize: 22,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        8,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              getJsonField(
                                                                earlyResultItem,
                                                                r'''$["content"]''',
                                                              ).toString(),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        18,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.7,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  getJsonField(
                                                                    earlyResultItem,
                                                                    r'''$["savedDate"]''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            14,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1, 0),
                                                              child: Container(
                                                                width: 50,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8,
                                                                  buttonSize:
                                                                      48,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .trashAlt,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 18,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Remove from Vault'),
                                                                                  content: Text('Are you sure you want to remove this from your vault?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('No'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Yes'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      _model.updatedEarlyResult =
                                                                          await actions
                                                                              .removeFromVault(
                                                                        FFAppState()
                                                                            .categoryContents
                                                                            .toList(),
                                                                        getJsonField(
                                                                          earlyResultItem,
                                                                          r'''$['id']''',
                                                                        ).toString(),
                                                                      );
                                                                      FFAppState().categoryContents = _model
                                                                          .updatedEarlyResult!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.earlierResult2 =
                                                                          await actions
                                                                              .getVaultedItems(
                                                                        FFAppState()
                                                                            .categoryContents
                                                                            .toList(),
                                                                        'earlier',
                                                                      );
                                                                      FFAppState().earlierVaultItems = _model
                                                                          .earlierResult2!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 20))
                                      .addToStart(SizedBox(height: 0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
