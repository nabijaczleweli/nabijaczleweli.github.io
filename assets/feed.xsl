<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
	<xsl:output method="html" version="1.0" encoding="UTF-8" />
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
		  <head>
		    <meta charset="utf-8" />
		    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
		    <meta name="viewport" content="width=device-width,initial-scale=1" />
		    <meta name="author" content="nabijaczleweli" />
		    <title><xsl:value-of select="/feed/title" /> (RSS) — nabijaczleweli</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

				<!-- Copypasted from /assets/icons.htm -->
		    <link href="/content/assets/common.css" rel="stylesheet" />
		    <link rel="apple-touch-icon" sizes="57x57" href="/assets/favicons/apple-touch-icon-57x57.png" />
		    <link rel="apple-touch-icon" sizes="60x60" href="/assets/favicons/apple-touch-icon-60x60.png" />
		    <link rel="apple-touch-icon" sizes="72x72" href="/assets/favicons/apple-touch-icon-72x72.png" />
		    <link rel="apple-touch-icon" sizes="76x76" href="/assets/favicons/apple-touch-icon-76x76.png" />
		    <link rel="apple-touch-icon" sizes="114x114" href="/assets/favicons/apple-touch-icon-114x114.png" />
		    <link rel="apple-touch-icon" sizes="120x120" href="/assets/favicons/apple-touch-icon-120x120.png" />
		    <link rel="apple-touch-icon" sizes="144x144" href="/assets/favicons/apple-touch-icon-144x144.png" />
		    <link rel="apple-touch-icon" sizes="152x152" href="/assets/favicons/apple-touch-icon-152x152.png" />
		    <link rel="apple-touch-icon" sizes="180x180" href="/assets/favicons/apple-touch-icon-180x180.png" />
		    <link rel="icon" type="image/png" href="/assets/favicons/favicon-32x32.png" sizes="32x32" />
		    <link rel="icon" type="image/png" href="/assets/favicons/android-chrome-192x192.png" sizes="192x192" />
		    <link rel="icon" type="image/png" href="/assets/favicons/favicon-96x96.png" sizes="96x96" />
		    <link rel="icon" type="image/png" href="/assets/favicons/favicon-16x16.png" sizes="16x16" />
		    <link rel="manifest" href="/assets/favicons/manifest.json" />
		    <link rel="mask-icon" href="/assets/favicons/safari-pinned-tab.svg" color="#5bbad5" />
		    <link rel="shortcut icon" href="/assets/favicons/favicon.ico" />
		    <link rel="alternate" href="/content/feed.xml" type="application/rss+xml" />
		    <meta name="apple-mobile-web-app-title" content="nabijaczleweli" />
		    <meta name="application-name" content="nabijaczleweli" />
		    <meta name="msapplication-TileColor" content="#da532c" />
		    <meta name="msapplication-TileImage" content="/assets/favicons/mstile-144x144.png" />
		    <meta name="msapplication-config" content="/assets/favicons/browserconfig.xml" />
		    <meta name="color-scheme" content="dark light" />

		    <link href="/kaschism/assets/column.css" rel="stylesheet" />
		    <link href="/content/assets/heading.css" rel="stylesheet" />
				<style type="text/css">
				</style>
		  </head>

			<body>
				<h2 id="go-back"><a class="go-back-link left" href=".">↩</a> This Atom (RSS?) feed has style information associated with it. <a class="go-back-link right" href=".">↩</a></h2>
				<p>
					<a href="feed.xml">Put it directly into your feed consumer.</a>
					You will certainly not regret putting it directly into your feed consumer.
				</p>
				<p>
					The feed has the contents, but this preview doesn't.
					Updated <xsl:value-of select="/feed/updated" />.
					Sorted by last update.
				</p>
				<xsl:for-each select="/feed/entry">
					<article>
						<h3 style="margin-bottom: 0;">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="id" />
								</xsl:attribute>
								<xsl:value-of select="title" />
							</a>
						</h3>
						<xsl:choose>
							<xsl:when test="published">
								Published: <time><xsl:attribute name="datetime"><xsl:value-of select="published" /></xsl:attribute> <xsl:value-of select="published" /></time>,
								updated    <time><xsl:attribute name="datetime"><xsl:value-of select="updated" />  </xsl:attribute> <xsl:value-of select="updated" />  </time>
							</xsl:when>
							<xsl:otherwise>
								Published: <time><xsl:attribute name="datetime"><xsl:value-of select="updated"   /></xsl:attribute> <xsl:value-of select="updated"    /></time>
							</xsl:otherwise>
						</xsl:choose>
					</article>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
