Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B735CFF3
	for <lists.iommu@lfdr.de>; Mon, 12 Apr 2021 20:02:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4FA040468;
	Mon, 12 Apr 2021 18:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOSL193qRE-L; Mon, 12 Apr 2021 18:02:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC894044E;
	Mon, 12 Apr 2021 18:02:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5AD2C000A;
	Mon, 12 Apr 2021 18:02:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AC66C000A
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 18:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 299A783CFA
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 18:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tG19tmLmPaEu for <iommu@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 18:02:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95CB683BD8
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 18:02:00 +0000 (UTC)
Received: from localhost.localdomain (ip5f5ae88d.dynamic.kabel-deutschland.de
 [95.90.232.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id ABF1720647D4A;
 Mon, 12 Apr 2021 20:01:57 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Subject: [PATCH] iommu/amd: Put newline after closing bracket in warning
Date: Mon, 12 Apr 2021 20:01:41 +0200
Message-Id: <20210412180141.29605-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, iommu@lists.linux-foundation.org,
 Brijesh Singh <brijesh.singh@amd.com>, Robert Richter <rrichter@amd.com>
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

Q3VycmVudGx5LCBvbiB0aGUgRGVsbCBPcHRpUGxleCA1MDU1IHRoZSBFRlIgbWlzbWF0Y2ggd2Fy
bmluZyBsb29rcyBsaWtlCmJlbG93LgoKICAgIFsgICAgMS40Nzk3NzRdIHNtcGJvb3Q6IENQVTA6
IEFNRCBSeXplbiA1IFBSTyAxNTAwIFF1YWQtQ29yZSBQcm9jZXNzb3IgKGZhbWlseTogMHgxNywg
bW9kZWw6IDB4MSwgc3RlcHBpbmc6IDB4MSkKICAgIFvigKZdCiAgICBbICAgIDIuNTA3MzcwXSBB
TUQtVmk6IFtGaXJtd2FyZSBXYXJuXTogRUZSIG1pc21hdGNoLiBVc2UgSVZIRCBFRlIgKDB4Zjc3
ZWYyMjI5NGFkYSA6IDB4NDAwZjc3ZWYyMjI5NGFkYQogICAgICAgICAgICAgICAgICAgKS4KCkFk
ZCB0aGUgbmV3bGluZSBhZnRlciB0aGUgYCkuYCwgc28gaXTigJlzIG9uIG9uZSBsaW5lLgoKRml4
ZXM6IGE0NDA5MmUzMjZkNCAoImlvbW11L2FtZDogVXNlIElWSEQgRUZSIGZvciBlYXJseSBpbml0
aWFsaXphdGlvbiBvZiBJT01NVSBmZWF0dXJlcyIpCkNjOiBpb21tdUBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpDYzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFu
aXRAYW1kLmNvbT4KQ2M6IEJyaWplc2ggU2luZ2ggPGJyaWplc2guc2luZ2hAYW1kLmNvbT4KQ2M6
IFJvYmVydCBSaWNodGVyIDxycmljaHRlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBQYXVsIE1l
bnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPgotLS0KIGRyaXZlcnMvaW9tbXUvYW1kL2luaXQu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvYW1kL2luaXQuYyBiL2RyaXZlcnMvaW9tbXUvYW1k
L2luaXQuYwppbmRleCAzMjFmNTkwNmU2ZWQuLmY3ZTMxMDE4Y2QwYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9pb21tdS9hbWQvaW5pdC5jCisrKyBiL2RyaXZlcnMvaW9tbXUvYW1kL2luaXQuYwpAQCAt
MTgzNyw3ICsxODM3LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGxhdGVfaW9tbXVfZmVhdHVyZXNf
aW5pdChzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKIAkgKiBJVkhEIGFuZCBNTUlPIGNvbmZsaWN0
LgogCSAqLwogCWlmIChmZWF0dXJlcyAhPSBpb21tdS0+ZmVhdHVyZXMpCi0JCXByX3dhcm4oRldf
V0FSTiAiRUZSIG1pc21hdGNoLiBVc2UgSVZIRCBFRlIgKCUjbGx4IDogJSNsbHhcbikuIiwKKwkJ
cHJfd2FybihGV19XQVJOICJFRlIgbWlzbWF0Y2guIFVzZSBJVkhEIEVGUiAoJSNsbHggOiAlI2xs
eCkuXG4iLAogCQkJZmVhdHVyZXMsIGlvbW11LT5mZWF0dXJlcyk7CiB9CiAKLS0gCjIuMzEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFp
bGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
