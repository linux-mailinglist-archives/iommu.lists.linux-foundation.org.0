Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB9399CCB
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 10:41:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE85383E57;
	Thu,  3 Jun 2021 08:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wx4sLDCjwSaI; Thu,  3 Jun 2021 08:41:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF98583E32;
	Thu,  3 Jun 2021 08:41:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA243C0001;
	Thu,  3 Jun 2021 08:41:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CAA4C0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B54C83E32
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0EEek5hB2Lj for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 08:41:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD24D83E1F
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:41:23 +0000 (UTC)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 2BC24602D5;
 Thu,  3 Jun 2021 10:41:21 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] iommu/vt-d: move variable to more local scope
Date: Thu, 03 Jun 2021 10:41:19 +0200
Message-ID: <1943275.8rWz7lOq5N@mobilepool36.emlix.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org
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

SXQgaXMgb25seSB1c2VkIGluc2lkZSB0aGUgbG9vcCBhbmQgdGhlIG9sZCB2YWx1ZSBpcyBub3Qg
cmV1c2VkLgoKU2lnbmVkLW9mZi1ieTogUm9sZiBFaWtlIEJlZXIgPGViQGVtbGl4LmNvbT4KLS0t
CiBkcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2lu
dGVsL2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMKaW5kZXggYmUzNTI4NGEy
MDE2Li5mYTI2MmI4MDVkZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUu
YworKysgYi9kcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMKQEAgLTIzNDAsNyArMjM0MCw2IEBA
IF9fZG9tYWluX21hcHBpbmcoc3RydWN0IGRtYXJfZG9tYWluICpkb21haW4sIHVuc2lnbmVkIGxv
bmcgaW92X3BmbiwKIAkJIHVuc2lnbmVkIGxvbmcgcGh5c19wZm4sIHVuc2lnbmVkIGxvbmcgbnJf
cGFnZXMsIGludCBwcm90KQogewogCXVuc2lnbmVkIGludCBsYXJnZXBhZ2VfbHZsID0gMDsKLQl1
bnNpZ25lZCBsb25nIGx2bF9wYWdlcyA9IDA7CiAJc3RydWN0IGRtYV9wdGUgKnB0ZSA9IE5VTEw7
CiAJcGh5c19hZGRyX3QgcHRldmFsOwogCXU2NCBhdHRyOwpAQCAtMjM2Niw2ICsyMzY1LDcgQEAg
X19kb21haW5fbWFwcGluZyhzdHJ1Y3QgZG1hcl9kb21haW4gKmRvbWFpbiwgdW5zaWduZWQgbG9u
ZyBpb3ZfcGZuLAogCiAJd2hpbGUgKG5yX3BhZ2VzID4gMCkgewogCQl1aW50NjRfdCB0bXA7CisJ
CXVuc2lnbmVkIGxvbmcgbHZsX3BhZ2VzOwogCiAJCWlmICghcHRlKSB7CiAJCQlsYXJnZXBhZ2Vf
bHZsID0gaGFyZHdhcmVfbGFyZ2VwYWdlX2NhcHMoZG9tYWluLCBpb3ZfcGZuLAotLSAKMi4zMS4x
CgoKLS0gClJvbGYgRWlrZSBCZWVyLCBlbWxpeCBHbWJILCBodHRwczovL3d3dy5lbWxpeC5jb20K
Rm9uICs0OSA1NTEgMzA2NjQtMCwgRmF4ICs0OSA1NTEgMzA2NjQtMTEKR290aGFlciBQbGF0eiAz
LCAzNzA4MyBHw7Z0dGluZ2VuLCBHZXJtYW55ClNpdHogZGVyIEdlc2VsbHNjaGFmdDogR8O2dHRp
bmdlbiwgQW10c2dlcmljaHQgR8O2dHRpbmdlbiBIUiBCIDMxNjAKR2VzY2jDpGZ0c2bDvGhydW5n
OiBIZWlrZSBKb3JkYW4sIERyLiBVd2UgS3JhY2tlIOKAkyBVc3QtSWROci46IERFIDIwNSAxOTgg
MDU1CgplbWxpeCAtIHNtYXJ0IGVtYmVkZGVkIG9wZW4gc291cmNlCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
