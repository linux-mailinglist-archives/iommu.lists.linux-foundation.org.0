Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0217934F
	for <lists.iommu@lfdr.de>; Wed,  4 Mar 2020 16:25:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AAB6853B9;
	Wed,  4 Mar 2020 15:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MirALbQ82WTF; Wed,  4 Mar 2020 15:25:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1DB05852C7;
	Wed,  4 Mar 2020 15:25:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00EE6C1D8E;
	Wed,  4 Mar 2020 15:25:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BE9EC013E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 15:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 89EE4852C7
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 15:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8gXMQDSkc99 for <iommu@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 15:25:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E27E58528B
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 15:25:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DCA7420A; Wed,  4 Mar 2020 16:25:27 +0100 (CET)
Date: Wed, 4 Mar 2020 16:25:23 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RESEND PATCH 1/4] iommu/omap: Fix pointer cast
 -Wpointer-to-int-cast warnings on 64 bit
Message-ID: <20200304152522.GA3315@8bytes.org>
References: <20200303202751.5153-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303202751.5153-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMDk6Mjc6NDhQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBwb2ludGVycyBzaG91bGQgYmUgY2FzdGVkIHRvIHVuc2lnbmVkIGxvbmcg
dG8gYXZvaWQKPiAtV3BvaW50ZXItdG8taW50LWNhc3Qgd2FybmluZ3Mgd2hlbiBjb21waWxpbmcg
b24gNjQtYml0IHBsYXRmb3JtIChlLmcuCj4gd2l0aCBDT01QSUxFX1RFU1QpOgo+IAo+ICAgICBk
cml2ZXJzL2lvbW11L29tYXAtaW9tbXUuYzogSW4gZnVuY3Rpb24g4oCYb21hcDJfaW9tbXVfZW5h
Ymxl4oCZOgo+ICAgICBkcml2ZXJzL2lvbW11L29tYXAtaW9tbXUuYzoxNzA6MjU6IHdhcm5pbmc6
Cj4gICAgICAgICBjYXN0IGZyb20gcG9pbnRlciB0byBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXpl
IFstV3BvaW50ZXItdG8taW50LWNhc3RdCj4gICAgICAgaWYgKCFvYmotPmlvcGdkIHx8ICFJU19B
TElHTkVEKCh1MzIpb2JqLT5pb3BnZCwgIFNaXzE2SykpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPgoKQXBwbGllZCBhbGwsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lvbW11
