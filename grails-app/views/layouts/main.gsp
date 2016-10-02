<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <title><g:layoutTitle default="Grails"/></title>

    <!-- Style -->
    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="wrapper">
        <!-- HEADER -->
        <g:applyLayout name="LayoutHeader"/>

        <!-- CONTENT -->
        <section class="content-wrapper">
            <g:layoutBody/>
        </section>

        <!-- FOOTER -->
        <g:applyLayout name="LayoutFooter"/>
    </div>

    <asset:javascript src="application.js"/>
</body>
</html>

