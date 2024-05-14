import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'commerce_model.dart';
export 'commerce_model.dart';

class CommerceWidget extends StatefulWidget {
  const CommerceWidget({Key? key}) : super(key: key);

  @override
  _CommerceWidgetState createState() => _CommerceWidgetState();
}

class _CommerceWidgetState extends State<CommerceWidget>
    with TickerProviderStateMixin {
  late CommerceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'blurOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.6, 0.6),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommerceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 54.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Detalhes',
                  style: FlutterFlowTheme.of(context).labelLarge,
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x28000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 400.0,
                              child: Stack(
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBQVFBcVFBUYGBcYGh0cGxoaGyAYIR0iICEbIh0kGhsdICwkICIpICAbJTYmKS4wMzMzICQ5PjkyPSwyMzABCwsLEA4QHRISHjQpJCo9MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjsyMjIyMjIyMjIyMjIyMv/AABEIALcBEwMBIgACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAAEBQMGAAECB//EADsQAAIBAwMCBAQDBwQCAgMAAAECEQADIQQSMQVBIlFhcQYTgZEyobEUQlLB0eHwI2Jy8TOSFcIWQ3P/xAAYAQADAQEAAAAAAAAAAAAAAAAAAQIDBP/EACURAAICAgICAQQDAAAAAAAAAAABAhEhMRJBA1ETIjJhcQQUgf/aAAwDAQACEQMRAD8A9P6S3+mPc/rRwNAdKWLaiQecjvmjgazRb2dg1ua4BrYNMR2K3XE1uaAOqytTWi1AHVamokeWOZAroOKSdhRGzkmB+dcLp1AG7J4miCa5eIzxSr2OzkvmKgTVBg0AyCR7x5V02nABCeAnuBUdmxCgXIY8TFPIYItNqmMC4ApOBn8XrHat663u2rIgkyD3MYn071xrrduRPhcwJAn23UHqdeBEnxJiTxwQTjPE1lLyVaZJ1qem2N4BncRwOYHeQJAqXRi6m43CWQYAwSPXGT+tJH1Tbg1szIlnHAnzP0onTdW3LttiX8I4x6mT/wBCRThNPIrJOqdVRh8tFLHcDkQDBnI5j0ru11FdoUlgYzugCeZBB8OfoB2qHQ9PRWPzCDc8vxDsfEO8ntU2m0q3HZbtpF/hAXb9mBg/r5iq+q7QZB7Zd7Bsr4djsr7PEQn4kCRzuUgA8QD7UVZvlLarbtm3OEVoJP8AuaD5SxkzjzqIXLdi8GUkWyDbc9twO5RPcxv4HaO9FXL7q4uEAptIIGSgwRkYzHiz5cxNUvZX5Cgfl2/CpbaOCRJ8yT58k0QrSAR3zVb1PVGYlbcwfoPcnsPzovRas2wQzNcODJOPZF5qF5o3RKdh3UkG2d1xSODbaD9R+E/UVSrfXbpuFRtuulw7HI2mYKyygwylZ4Mjmm/UPiZWPy7aye8mNvvQdkZW5sWVLAFRjcQR4j5+h86Xkn2g2Ra/qNq2y3Lqzec/gzI/ikTAUCSa86vaK5caQm0E4DMEj/2Ix6+lPOu6O7i60M1wMEaQCAcNu7QBgEnG/wBosfQPhhtMgfavzGEs7EA57Duo+knv2AcW4xtZYqaQv+FSNLbKXC4Zm3Bl8VuIEe3eSB5eVE9f6lprh+XetsWXhgYIkAjawJPlgj6U2/ZRJNxp8lQbQPcnLH7Up1/TLRf5i7lufxggz2ypG2YHIANKMXy5PH6KjCT2LuldOujxm6otqJClmMDtvlQVEeooXrnUUv8AhC7WTuDz7envQPXHu27gLN4f3SsgezDz95pRrNXvhlEefrXRWcD1sgv3N5gnI4mutJaklT71uxaBYyeM/wBvepUYJuII3mYjIH9z59v0bYiXwjBORWqgk96ypoXJntXStabeDlT2/pVjtuGEgyKpll6ZaXVlOD9OxrNSo3nC8osk1sGltrqankEe2aLt6pG4YfXH61VozaaCZrJrgGt0CO5rJrgGsZwBJ7UAatukkLE94rnU3Qilj2pa7BSWUNPMjge9Hh1ZASQffzqFK1RTREt0nbvO0HPlnsP88qy5qkkq/Aggx/n+GlO9y8E7trTt84qa9rkdwMqODA5J7VKkDQQ/UTvBUShwSce0VMt1iMZnOeAPU+VRppEZApWV9fymoHusDsEBZHOMf0qZyaWRNog16YJBJiDJ5JB/KgdTc+bsRQock7gT6Zz9D96l11//AE4AIMmTzu7yP0+1K+iol24xdQdqzB8yeY71lGstko76npWQqLcIvhUKJG5snPoJJ9SI74i1HUvlhk+bbuMwghbZJ743BtvJ8q18Qa1Dct22UQDJxnmPzpV1qwqAXVgMrrgCAeTwPb86vxOkl7EnWCwDet+wLhaQMkZ3QCCcScDMkdjVh1OvsqgLMCJgQZMjyjgjzqj6jqJ1WotGwjCAcv4RuiSNwngf9VY9O5ndfUA2xyDiQf3Tj/25rWMnFXIDvVAiwZSFQ/MTcPExQhsjsYB558qN1DKVNtzCAAzP4gZ2iB7EfQUv6xrbi2W8I8Y2qj+Imcc4jnvP6TR7vxO6JbU5b5YUz2gwJ9gG+9UmmsGkY2sjvrlq3b1FpkW69plPzNu7BHG1uVM8iRxRlx/lx8u8SpXdsuiT7B1g/U7qQ9K1ty6S9piDuMn90YUZ+xx61ZFAuKBda3cI7wZX2PI/SonBSVUOXj9CPXdZ09xDI+XdA8LHgkZClhyDxniaU/D/AFG4NR8sgut2JUAtnsY9POrJb+H7W9ma5KfwbYJ9N3Eev5Uej27Kt8pUTGSoknsAzGSRJFEIKKozjCTNaLpenDLda2GZWYoWZj4gSJ2EwMgmecA+tTavU7jzQvzDA8U+Wc/90PdvQJquS0bRgljs6uPS6/qBMngVBreoADmq71Hq0D9AKpZLbol67qlZGDd6rWnHhPM9hx9ZrbXGdtzf9Ub07SNeuLbQeJvsAMkn0AzW8Y0snNOVvB1oul3LlxbNvxFsl87QBySYnaPXJxjirNpPg22FDPfULuInZlsZCjd+fap9MiWE+TZO+5dYBrhwWJwoAztUT+poTrOqO4AudluEWMA+ZH/JpP1rKTzg1j48fUOv/wAW0hz8y5n1Uf8A1rKTWuqQAMY9ayptlfHEb6XVTTSzdqoOz2m2uI8j2Pse9F2Op0nErki3W7lEo9V7T9QB70ytakHvUsKHNrUMvBok61jtiAQc+RHl6Uj+d5GpE1Q70WS4FntuCP6ZqLVpuGWgDkefvSezqIyDFErq5OTB+4+39KfK0RwaBG1IyhO3HA70O2p8IhjMfahtX06/uLoVfJPhMHPo36CaTXWuI4FxWX3BH61PEY9t6wp4o8U5PmDR3TbAJFwGQZkev9aU23UjaTjzpn0WJIJG3yPFRnSJbGLak8Az6L/aoruka4CWxt9ST/Sj3vKiz2HlQPUOphBK+Lzjy9afxpfc7Ior2pdvnbFViqwJJAEjJ5HHtSLUoWuOLW5WlpQT2ndEdsEx2HnVqvajHhXexnYMZ9fagNP0o2rnz7l0C5uLQoxmZHrMkQBSTjHIJgvWtNbGltXQAWBt7mmTABEen4hxRL9FW6N1xzsww2kZxzJnEGh+o623dt3AiEDJB2xDCSQy/wAJyRzB7DFT9O1irpUU5ksgRQSZyexJOCMR35pSTpUDQb0B7bLBYBRuCCQCVxDGP8zU2oCpLkbtkLaU8SP3jPJmY8onk1W36AzXLVxC1sFwCDKyACzbAe8DtjNWjXDcUWcsefIRk/al5pVUVslsrnW9VfRE3ZF1t28+YMAT2Ayfr6UmtdY+XeZHA2kOw4gM5WT7yDVv6vo7j6d9422x+FRnwjEn8j9K8ze2yOGcSDg/vT9/0raEaVG8H9JZLPW7RO03T9AP035+lF6a64YOrEoDO6B2qpN09d3gGMmD5GYH+eVGaK3ctzsYgEQwnkeqn9ap0NKbLTq+qfMMuZjzxHtHFKh1IlonwgwB5+ZM+WR96Xal1tqPxFm4ngfyrV22QALbWydoOSw/VV+80q7KcowG93qcDmhm+ISBtcBkPIwD9CRVb1IvjLqyr5rx/wCwn9aEyTgGJ+9OMEzOXkUuhkl/5tzam5gSeSFJGY84MVF8T2lS+1tFCrbCrA89q7iT3JJOa50+naCy4jJ5x61ZE+GH1dxbztstPbtkkfiY7EDbQeMg+I49DWsaTMnJspml073GCW1LseFUSf8Ar1r0jpvw4+nsMbZti6y+J3Mk99ojCrMcSTEnyDfpnTbdldli2FHdzkn3Y5Y/kPSmS6Ud/EfNs/YdqJTvBUfpdnl/S9S5uXnuYe2pQDyZiVY/RQR9a41B3MATIUTHr2pt8adOWwr3bambjqXjgQGAPpJYT6x51WtHqEfaC+1iQDPmcSDxUtdo0jO8MluOJORWqOchSVC4HFZSsumG6nqj3TLEQOFAgD2H8+aksaylyJNGaa1XZhHHsZqquMiD5jH/AHUZvPaMHI7Gi9Jp6NbSrjcJAOQe471l5Iplwk0CJrZHNSrqKj1vTltsy5wYx5UI2nI4Jrm4nQvIhkupI4NTp1HzpVaS4fwgN+X61t7jL+NGHqRj78UuJSkmPE15rv8A+VxByPI5H2NV9NatTJqkbG4A+tLJVJjxblm4IKAeq+GPoMflW20G22xtsbnfbEn8uftVfu71OOPMUfodU4ggz50ESgmBHqL9yY+tZqeosqgiYIg071lq3fWD4X7MBz/zHf35qn9SL23+XcEFcx2I8we4PnTqzFxosnR9STItgG65j2UAfzk/SmPUdQlhCofddjMsQAfUA59jSLomvt20uun/AJXgLPCiJJ+/b0FddPtG7eW4+Vjcx8yOJ+sVlOKy2iWib9luMoe7ccKBMTkk+Q7ChkW2rDeD/EsNEH9fr6VP1TWM7lchQYA8/U0u6toW2LcRsmB7+lTDlJZxYJui0LrhcdEJVkZDlvEWYFY5xxJx3n0qpfEHVj+0KlpmK2zJ8ROe4DHMduT+VHXtASNzkKu0LtGST39KA+HNAPmfMdDsVueQPIn0H98CrjFOXK7oWy9arqcW/EsLthmbK5GRMfSCB/Oqb8T9HREtG25ZTcEryEnAjJIGe8+/FXH56mEjHtVO+KtE6tvtoVt7fFtOMHdlfcDIrSNXbeSk6M6t0BbDwjlpWQrZ45Hv5evviranR3GMrLAiQQTHr7Edx2irJdvi5ctMGZnzuVuM/wDdQ2Dct3PmW1L7W3uB+Ex5DvHM9+e0ktxyJti3pbXL7W9PckndAduV5J59OfOAO1ehr035roz20i0Ss2wGVuBkNnHpOarD6Rrt03beA53jbjnuPX+dXBOolbYRbZwscxTc47AQfFPTrCBjaIRnVRtUAqQSQ3hiAYPIzxScdHW2yWwJdgCO8ZjtTS7oiSxjkyB5Ua91E2sR/qAQPNR2j1P5e9GASyHHT2bKBFRSwEMxUGfP39q3bQvluPLz/wCX9P8AqhtMpJ3Nz2HYf3/z3YIaLLqghFFdkVCjVMDTQmBdQ0i3EZHAKsCCD3B5rxj4g6O2lum2ZKnKMf3h/UcH+9e6EUi+JugrqrRTAceK2x7N6+h4P9quLpkvJ4x89/4m+5rK1qLTIzIwZWUwR5HvWVpRNlpsuTECB50dZcA4M0otMvcn60bZcdquySzaO7xTNTIqv6W7TjQPuYL5mpkUhu3TRcdswdq/eBS67pYO1gPDimLamCzqSMzig7+pw1wjE1zlnCafasjA70TuGwxEjue1Ah3uCLak9yBmhNZqitvbtOTBmk4ktgnUbBaXlSTmQBQK6VdhJMN2AMT95ppoLTXEIQZHNIdUzK8HsatK8D5MLu2HtgG3c3qclTII/UH8qL0eoKkdwaCUlWVSwhiDPlXV2y6b1bDWzB+nl6VLRr45t7LFavQa66npBqLRED5iAtbPtkr6gxEexpY+qS2FLOBMexBrrUdX+WyFDuBpaNXFNCxLq/8AkkbiMinOnlUj+PyqHqpR0U7Qs5BAxycfeiNCjFuPAMz/AEo+5HNVYYJqbENHELzW9Ld2fLVlLwQcds8iptddlXIjyrvoumZx8xuOwFKdVkTCbunO5X2u7Z2qowB/uJMAmtDqFxrnydPbFtv32wwXz7RP3zijDcdQdvMR7UN0u01tfD3/ABE8sfM1hHCJob2LPyhgb1/eH73uD3H+37ZwYuoWxdtsqwVdWGPUEURavYzQl/WMtwC3bZgT4vI+o9f17+YE7LwVrR22uWbV0qqgKF89wGCWjgEjj+sUz6a+0lifxHkd/TPf05qToibtGqbZ/GB/7NFNdHpALexlEdwczVylhg2K9G4W4QqxE+GI5JPH1o67qD3SKGtJeW42222xfwluCPJWP9aYaTVLdLKRDLyhEEf1HrUSbwmqEAo/i57Vxe0W5t0ywH3/AL04/ZRO7bmuGtN2WnJ4Q02hVZuRii0euNfomA3j6xUFi7NaRkXtWMFapkeg0ap1NWhMKBrcVEj1JuqkSLdX8OaS65uXLNtmaJJAkwABP0ArKLua20pIa5bBHMmD9c1lOxHjKPRVm5S1HqdLldBmO01MCrZ8OaUMpa4SpYQnp6keR49p9KrfSulPtW7cU7OVEc+Rb/b5eftzYrWtHc5rGc+kbQheWMzp3QFX47EcH2rtNB8xI7Vmm6gjDY+QfyNHC/bRQvzMD0z96zf4G4NAXQtF8su26JMfatdb6ctxITmZJrtdfZWQpb1J/wCxUqa9GMAie20mfscfnUuw4SrQp6Roms7u5agdR0xLt6GHLZ7dqtFlbb5DzGT/AHFQ6jSIDuWdxNTyabsjjWGQp8P2QBCDHnmq/wDFHw/cg3bMkx40GSQOCo7kDtVmGpYRKn7VIbjnO2KhTadgnR5C954AblYBHlkDNGpg244BMirvr/h5b1z5j74wWQEbWI4JET9v6zWdN8O6piVa2U2hpLcHHCkczWynFo1jMd6SydRZNtY3KRE+R/v+tPLOkNtFXbmM1Wvge7FwgmdyfaIj8pq5XLMkSxBHliplJxZPk2K7nTrdxXB8B+1E9P0otJtVgRzmprugtsZckk45j9KjtaO2kCJjic1lKTZm2EraEcT5+tcG32VBUysvHEYqUFBmo2AImmfzAqVbTLJmYEx3ru64Amh7zwH84iikgA+h6Zhb2t4WDMdsjAJxjkUY+pS2doO5+8nC/wB6pt/XmzcW8pgMflt6CZPuRMj2p8vQRPiuXD5mQJPeMHvVReLKg4vLHVq+Dls+prvbbLK2NyzB7weR7elJ/wBgQCD8xgRmXP8AKKy7obYSULq3kHY/kxIFXzT2im4sflvIio1V+7Cqteu3EUlbj4PDKG9uIqbQdQ1Dn9wqMs2V2jvIzn0mi4sWPZZmXBnNVrqdv5VyR+FvyNbHX7g/FaePMEN+QM1DrOtWbiFXDL/yUiPuKdLplQpBVi5NFI1VzpmtB8MzmBHemx1QXjLeQ/zA9atMGhg9xUBZyAB5/wA6r3WfiIhCVb5VscufxN6KO36+1LPiHrItAG5LuZ2IMKI5k+kieTmqHr9fcvNuuGfIDAX2FVGLl+iW1H9jC917xHbakdiSZPvWUlrK14R9E85ewpDVj+HtLbVxcvqXUZFuYn1bBx/t79/I160YzRiao1qorszb9HqVj4k055V1nHZv5ih9ZY0d0Frd1bb+TSqn3B4+n2rzxNaeZ/pUya/3/T9an4Y9DU5Ic39cbbMoYGMGGB+qkHIoVeruD3P50A2oDcxQ7+hNJ+P0aLyjG91RnYblbaD4tpg/SidPq1U/Mt3GB/gcTx6jI/Oq8wcEMDmnPw9om1N0ISqRksYnH8IJyaiUKRpHyrsu/wAL65r4LrbCkv8A6hB8PB+7GB9x9bSLa1F8yBGZjvWvmRkZGMVyuWSZytkxSf5VwxERFdGcHNbW5M+lGCTTeXY1D8o1q1e85jM+h8qILj78UsMRVulfCnymuEOSSf8ATPG0eo7+Xt+Vg0xOA4gj6/nRLkZk0HqLpQbjLL5gSV/5AdvUcd+5q01eSpSb2SvbEyOfWuQnf0xXA1IK7lKlfOe3nPtml660C6Qr4CkhY8JiJyF4GMyeT5UTgtolDBbEc4JNdFPOlHTfiCzfaEJV1Ba4lwbSoHJk4IGPvTEXt+x7cNbOd4IIM4BUj1x9aycaxQUSbMgdx51u/bBRh3g/Ux/WpL5YAlQNwz7+lDJK/iBnvSeMDorHUulNdS2ijJYO3oWMt9l7U8fU/LusrTtaG8+eSPryKJ0zBfmvthiwJnjbEDHAyG+1CdQAuAlWAdMgzj1UnyI/ke1RKLUaTzslx9DNWUjHFae2sFR35pdp7bkAloERtAnI5z9qOs22AImY7zn1mnF2tAafSoYBqK9ogBtQgCMz39DU1jxENEQAZ95rb5aD9PX+9PAwe3pU24wBgiok6VbGe+Z+tTXVIGMMQYB488/53ru2ozGSJkzQKhPq+jSh+WQHBwSInzEjtH6URZ0aKqqT4m7A5PmSe/0gUyNmX3zgKVicTkVBf053bhBxzOSew9BH3p20qKTwI+sfD1u7be3PibKsf3WH4Y9MwfSfevJ7tkqxVhDKSCPUYP517XqdK0gCQBn7c5qn/FvwyzuLluBMC5ng48f17+seZrfweSnxZDRQNlZTG78kEiSIxA8X5jBPnGJmMVldmAAVepFf2/P+tDTXQaixBSvUqXf85/pQIaug9FhQxW6P8x/b866JoBblSpc8jVJkhQei9LqSpkUMlwNbYd0IcexhWg+/y8doNDJc5ppg0ejdA+JD+C4ZU4zyParfaTadxacYHn614tpdUQRmvYeiEvYtOZ/AJ9sxXL/JgsSRUL0HLcHaTWrrQOMRM0PYcXGJQ5Ulff0PmKJBmQ3euVOyzhLgIyMz7VzetjBmODUjbRzJqUoDmirGDMoJI7QP89qxSewgN+grL5HIBzj2z/grZuKVnjaOf1pUIC1fTQ275ZNuZ3RhSTyY7Ge457zSi4ty1ut4UNJLyWkSNw/iBIx9cRVj094FZP4uWHvx7471pRLtJEBQCPcn+gqlNoZ451XWl79y4jYJIVgoTEQYXyOfUzJyTTn4G6w1u6NOTNq6SMz4SFMbQDAJMA/Sj/i7omjUC4jfKuOR4QCUyYLOoyijzHnxVSGlu2nDhZCHcHtnevhJE7lkCCO8cV0WpRA9mygOfck/U+3b71s25GT6/WlGm6zbu2bTFl3XACwyYgw+B6gxTiy4IBQgr581xtO6YZB7Lqb14GSES2pBB77z9eZn1rem6epUqMAkz7HiuNPaUam6TPjS2T5eEEAg+0flRh1Cx3wIMY8qt1eRsjTp1tduI+XO2O080TdQmYxJqBF8OGJ9+eT9aiu6vjDT5RzlR79wZpWFMJufugCBPtxNaJUwfLt70NvZijCQskmYxgjj71He1EAsXRFEyxYQBEkkzwIpNioM1AVlIxu2mO/OP51CrDJUQ0A58vI/nUdnqFt9ptsGBByO+J7DJMGB6UHqOq2hbufMbYvG4+EgkSMHvQ3kBho9QG8LDawJEA48/vBX71xrHwVQgN2nvjgflSa89y6QbV3bEMHX94H8GIhicZHGMTIo9boYK1y4CVxHAViMyCAS2DHEDOZpZDQSiyQGaSQD5efbiBAqDWi26kMJUqCYjawPhIJ84IoVXNtsAncZuHkKJMDOQc8dsetEBQtjAJZQPId+CMLPnQUeS674fu/Mf5Sq1uTtJwY7Az5cfSsr1P8AbFH4ZI7Zn+VZW/8AYI4niJrIrUV1XYSaitxWCsoA3mtq5rU0TaKhSxEEYUg9/b0H8qBEmjum2wLfhcMrDzU4b+o9VqcabZcIceEpcj12o/HmA4j6VDrk2hSJ/Ase20EkehZj9jTC8jPbtNMmGWJ/iSAT5SVP1B86lsQObUNbXzRD/wCwk/rH0r2nTqbdtLYE7VUGDxAE4qi/DXw67XFu31I2ZVTGdv4C3p3jvHlzfkb7kx5Dyx71zebyJ1FFxR34RHvkjiYnmuluDIn6n+VD3m/COx8p3ZwcRPeok1KtvQGG7AiODGR5HisNFUSPf8WSCv4RGIPaa7+YcCecAx3E9v8AOKhIbMqDiTmIjjPmfyre0lGU8EiIIBAnDT59/SBRXsKMZGJG5gomfLtH65oLq2v+RbYxvgggZJJnE7QSB3mDEDzms1J229qNvcgqrYIBgDxGDtzHIMEjBrzbq2tuNcYsXJQqDLAww+8QZEfeqhDkwr2XDTfEy3GhB8u5wN+Q08jkRP7s954mkXWOv3bb3E3XAXLMCH/CTgCCPwgjjBwPWUN7qdxiCWcbSSIaTnzIj8xTfXalbjNafaLqx8t2CmTAO25I+x+9bfGovQXWhK+o1F7lrj7VAJnt23HufeSaY9G091G3XVupCeAhth5BkjBIA3HPHtNL3uXJh3PhxH4Y4mQI+9FdH03zLqL8w+JstzMZg4jt3rSWENMuepX5fybSsB8ofMuMSSNp3EDcxJAgnmcVFb19m3qVtO5XwBmCjcC22fy3NHnHtSzqupAVwD43fYex2kg4P5Vx0To/zp1DCFVjtc43tmRJjA7xP61zxSrkyuQ21/VgNO7BySjrZQg7fw/6jQ2Z4XMennQ+v6nqHt2lsXGZxb33IUsTuIKsYUxgdvM0t6rrrNoW7aot1mJulnkIDcPZJk+ED8X2zTHpmvW88XES1d2m5buW12m3/DvEbYgDmcEVaXbQtukQ6bVa0XApvMS0lLe7c2SCORwBMkkQATS/qfVr9pytrUs8Zdkf5gBz3Y/cgBftTLq/VxNy2FJ/duTuG4sD+AMxhIBPGfSqnqLKZO17Z7GPAeYgySJ9/oKuKT6G8IN/+Yv3RduNcJKbIHYEmBtnC4B4FA6nXXLiIpkqu6CzFz4jmJ4HbiultuLbA8MyyOQcMQfT+dYml4LAGQSAOYHJMZVR+cQKpJIlWb6T1W5prnzEP/JTw49Y5/zzNegabqdvVWwbjIu/OxipbHH4hhSQeAOOeJ8+u6i2QVRWgEZYwTPJgY7YH19K0ty2RBG0iT4iWmeMiIqZw5ZA9H1LfJRktwGAMFSPwkghVJJEgET6njie7XUAqb8tKqMgIHImSJIBYgjny9cVTonUXtKLdy3u+YQbdsLJM8NLcZiJPbsAKbanqOmvEWwFIE7oO1yYklSSJEgCM4AxXNODQUTWWRfmMASzMMNuyZJMboEwNs8/YUNq9S5DhVaZtwTKzziCOZ2g/rROqsfMshLSOV3TtKsR4hMJmRtbyn9am6f08gkX3Mj90DdAIYAYmeTjzgDtSxspK8AmjvWyincikjI2nnv+93Mn61lOvlDG5kUwJDOinjkqAYnn61lPkxcH6KNb+A2YT+0LBj/9ZnPpv9/tXLfBO2S9+FB/Fs/EBglRuMicRye1Wm7rLYsr4gTLKFDbe58/EIQxzg9vIBNawcgtAlSQylt0KCkhiIAJngciBFaqc3tktLoVD4CYuV+eBEQSgzPtcx9c+lDn4Lw0alJX91rZU9u248SJOfrirBpuo7t5bwuH3ElojhCTB/eVQO8boru/1IksD8ooUG5mlipgwAV/EQDyTyfSnyn7JwVTUfCwRSzX0BA3BSMuMxs8XiyCCBwecQSXp/hlHtq73SiBQQBbkxksw8QkAd+fTiitfptzeG4GQhGIMCCBC7eRGTg4ziKntaq58s23zJIUsxIX/j/tI3eviInFVzk1sWAdOgWxcty107QFUABAViZII8y059RNP7Gh09pCiIFbLOSST4tvAM7SJ/d/hpNe1JLMCJZySJyqRJE9/wCX3ovTgEL4pGZJAEHnI+/Ec9+ahtvbGqLSuo/1CC5kqrEdwOxIPnJ59+4ji11FTIXa0H8IMgbY/D5eL7ZpDoHdhucS5UwD4T4ZUA5xkDuMURquolLW8oNwZlBxP3I7jbn0M8Vk45o0WSwftJkQBOQGaQN3IHHBwc/nxQPUGVDbDMAqkFzEgCDJJ5POAff0KfR9fLhjcUW7bR2MAsSM+o2MRAOBnNEnQrcN1bb3YkBTuIQEbidomWnAk9xinxrY6G6dRItjcrMASpJwfD3JMBvYwT+VKOpfEo2zbMBmbxOGtkggwbcwCQY5gYPnQjae3bFsJtuHcbbq7i2OSX2oVLNubPfkYMUS/SLTreR1cvdKkklioKiV2EgcEkR5N5UWtsNoqR65cS4AqPbR2/5GexXkPkmeSwJHlToqTfW4+n3XGUpft4i4sCLluSJJgGZmQBySaBsG4XuWv/HsnYY2iQQoDEY8h5TR2p1bWUUuQ+pVd45hFxIBH4sZnPetX+BNdsivfCCXC76fUIyxNu2/4g05VicqBHMdx5SYerfDNx3uXQ6CW/ASVPAH4iNvPrS7U6prm69bIFtnG5YWUae5IkA8gz3PlTZluPdVjI+Y5TMwCR4CVJ8W6MRgwafJp22CoTa3SXgo3WjuWRv5DDjLDBIxW+i6S4ji4VyCvYgATnMDtP5UVd6pkgs8KAP/ABg8YkMrArmBBJ5AqW+9trh/0z4YYtuKmWPdcyfenJuqBpE/VNIt28XlCqiSAcmRiMHMUJoddN638zdstyERSSqAgjwrAk/nXD6q2RthgSILNgAdyI4njJpp0TTW7DfN5ZUZ4wT3CiB5k81H2xyS2jb9AtfM/wBRvl4ySYgxnbJ7CASMTSzVXkuH/TJRT/uMkiNpZuTA4BwIxTdtStsM1xt190YXCfEZKlgM+XFL9H0Rkt/OLbQo3F5EjH4bcCWbzbgUQl7/AMGmF6Xo95w9q4lzxKAtwgZggoSTJ7/rNL9R042bi27V0tcNwK20bl92bGf9oEDzorpHUWe4oY3NqEPCnaCoBnfyXPBk+X0rd2Leoe+1oowLbSWkEmYYqB2B4HkKLabRTd/sJ6rpBZtwtxQx3OWVV3YMCYEcEc5lgBVavdUbb8tJIEncRL+zEk/lA8opl1R7S6a2VMG6bhZrg3O0ETsIO1FnEDtGaW9E+UH3XE3H90OQEk8Fu5Hpmrj9tsTYRpulW/lm5fY2rcKYA8dz/wDms4B43tA96l6giQjNbS0Bm1bMcH9+8TLOTGF5PeBy36h1KzbLfLbfdIaXABaUgzMHw9lXCgHjiK7ptQ9y4rvHjbaHuDeTHPjuThczEelCbeWK+iO6+2C9xmN3lmwIxJgGSBxyOCIFav6+9bbZuFoADFtFUMIw25RuYHzJM0d0zrgRypW21qSE+YslciNxHbAkDuaZdet2run3OVF21O35YKLLndt25BXnxA8+lLk1KpIRH0n4mbw29m66x2o8bQNxG0Y/3E59frTzQ69WQbZ3FWjcNxBJC4AO2e0QCePWqN0HRsb9olhh1YAET4SO/Amj+r9TCuyWOzA7v3cTIUEZEkyScyfrPkgm6iUpNFmtBCBu2g/7gJ9Jx5RWqrP/AM65yUXP+5h+i1qo+Jk82T6kkjYGAGGgExMAT7kfeahuN4pSDHY4g+fqfSe1CrdkqQBHBE/Tnyit3LmQYEboiOPvHFdFCDbd6VG4Se/Ynyz3qd7oNsKiyDGec5HYyKXa23GF8UH8XoPI/wDXtUVs3AOQFif6n86XEVDJUVhKuMEAfmMz95JFS/s90bVFosTEN+KO0gjnk8TS9NRgQxIXkhe32xjFGaXqTOGCeEL+9MZ/hn2PapdoVBultBFZjuUjcJYc/hmQO+IokqDbyMFYEeR9R3gEfUUI91SIDE7gctBIgkqRtEHy9jSrU62bKqpO9Fy3YEsSTjvkCiryVhjrUagE7AYVR4uZIwSCfrH0ok6lbg+WoDOFIWXBI5GCTPEnbjz96empKgBgTuAEhTDHkAg85qbSdSZJK7VI7lJAme05x+tJw7RUcMf6jSJacWlQt8zaJZ52BfwlhG2RNzIxBnkxTy8iqGRVdQpVgyjdvggjPYfaBSDT2r7A3LR3OW8TggBRyonvHcCcn0pz1G/KEXGghJheXnBEcxUSTNUsYJtVYsaw21v71l/DB2EMMQSBMzjvTG9aQkSzeCQCD5CAD3JiTNVPTai7dvBrYdntbdqSVjiSwI5InB9M09dltbv2g7sTsGcDMt5EHvxUOLSSIkvQqvdM0gVn1Fx/GZ3eimIiD4Zzwpk1LZ09s2x8pzftgkKW/GoOdp3ASIyCT2wK22vsXwZs2nLCERyFBkhjuaPMbvpWupa5bCLth3u8NIEKO3mVBBifOm3JquybArPSktG44ClA0ohEgTA3XIybakcd6GXV3DcdQTue4qr4SVAUAEpzBBJYfpmt3eouWDo0buSFwP8AaZxEdhg1Fo3LvtAaSN3EDcAJKHziqSe5E7Nt0d7FwBNrK8rcVvGHEiRAyMRE96Za3S6cKygHfcKlMEQFAXa7EHIyfWaDtaRWY/61rfMhTcLtuBHbaBjuPOi+uatHAQSWBEOIhseIwDnyj0qZO5IbEGps34aTaFvLFhsG0RHMbhjED7UV0vVC2BcUMxnwzIXjEk5IHNA39K6EOLols7AZMdsDj61BresbrhACQBtAMEe/lNa05KiAwXB8w3MM0kkHCnOSZ8zTZNZbuN8y48gIVCgwoB/FBiTn9KrtjVbJkDdIMkTjiAakZrbEPEMYmO4/6ofjJ5NF36RqbC29gBVfEx9QJ5zj6Uj6hol3m5sdreCIaDwAsHlmJxHlQFjqG2T2B5Oeew+lZqer3HtqiMZFwtPB749s/lUxhJSspTYDrwPmIpVrZgRbY7oBmI8j71D+yxcI2MHBjbkZPGD3rnU6g3UQOJIJIuGS8fwkznNNtVqrgNoEk3LaDc7cqcwCfMD9M1rbVIqyK9p7dkCzdBxBuNbPiJMxbSccjJ9/ShtXeS8AWi2EXYi58KjgZ9ZJms1K7n33TuA2hQJBAxmRx5yaJ0fX1a4lq8i3bRaAbwEpnncAJHmD96M7ELdFo7T3NrXHWATO0CY7AyfvTJkti01trjkK0rj04J4OJjjmpPi7pttCrWlQHAKoSd26WBiIEcQJxFB3rTCxYABk/MwfRxHpyaHmmMF0oi6Bbbz2scdjnk/91troe3ujxGFAGO847DgfetadwgZLiMGXKDiCSJ3eYo3T9NH7P8xmg712qBmDgk/lA9KbebHYl2r3BrKOu6UgkQRHmKyrtBRB8zAVTAMf1z9aYBHdVdVyJBYtyfbkH1msrKGJGtO4xgnIDbjgTJxGexphfRS/y0BPaOBGIPPpxWqyokPoje0it8vYApkvH720T24E+9C67VMyzsRV4t7RwJ7z51lZSXQugaxvJAJIUT39uPrWajcv7wIHJiKysq+xHW03yOVABIO7AHtzRidPW0hul5UMBBEncRIgRArKypZY4Tqq3QqOxtmZ7vkcGf5Se9WKx+z7rm5S7qodljsDgqScR3E5rdZWE8FNuhZ1n4kbYf2cC3O4sdskwQMGRFV3U9U+ZLMTuYLukZfykg4E9qysrSKQMA1N4L4ZG0gFecTXTBbSyzfMuHIXIVZ7nzPpWVlaGLOU1D3A5uZIQlV7ZI8uKP0rC3qktwG/AcjkkZz2jkVlZSlplrRrVa9DqDKS5MKfTzPGY71nU7SKlpgGKsGBMxDLw0TiQcgVlZUUlRKBtPrvlbifGWG2OMQcH61XxZWY3RPmJrKytICYZdQW4k5PIHYf1rFuGR2E1lZVMTCrjKQBJ28gjB+o4rejM3BtPBnI/T71lZUvRVDjR6RVm4CNq+KSsme0Cee8mlWpLXGdgp2gFyWYEkx5DzNarKS2XWgKGZUGQJ2nPeRFMNdqrTTba0PCoAKnjAA5FZWVRmL3dRtySYAMYiPU0ycH9nsndkM6icxLSTWVlD6GOk6hYa2QtqWaBuIHhmJCjsJHbzqv6nqbsdqmADx5keZrKypglkRD81WgsCSQJOOYrKysqyz/2Q==',
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: true,
                                            tag: 'surfLesson',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'surfLesson',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'data:image/jpeg;base64,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',
                                          width: double.infinity,
                                          height: 400.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 12.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 4.0,
                                            sigmaY: 4.0,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 110.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 5.0,
                                                  color: Color(0x28000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Custo por NFT',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '100.00',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'Recomendação da comunidade',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                      Text(
                                                        '5.0',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'blurOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Como será investido',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 16.0, 0.0),
                                      child: Text(
                                        'O investimento será realizado na capacitação da comunidade e na doação de mudas, ccom uma comissão de 20% sobre as vendas finais (produto e crédito de carbono).',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                      child: Text(
                        'Responsável administrativo',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x28000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1602474457187-d43d18c88c6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3VyZmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                  width: 90.0,
                                  height: 90.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        'João Luis',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '4 projetos',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '5.0',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('Dashboard');
                                },
                                text: 'Comprar NFT',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFEC863A),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
