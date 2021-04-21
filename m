Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C8399366F72
	for <lists.iommu@lfdr.de>; Wed, 21 Apr 2021 17:51:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5491660C0D;
	Wed, 21 Apr 2021 15:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DS5diHRkDcuE; Wed, 21 Apr 2021 15:51:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7375E60B80;
	Wed, 21 Apr 2021 15:51:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E6F3C000B;
	Wed, 21 Apr 2021 15:51:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46DADC000B
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 15:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 286B260BD8
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 15:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6mwN58xlX_U for <iommu@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 15:21:19 +0000 (UTC)
X-Greylist: delayed 00:08:35 by SQLgrey-1.8.0
Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B549160B83
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 15:21:19 +0000 (UTC)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 465176078C;
 Wed, 21 Apr 2021 17:12:42 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Subject: [PATCH] Intel IOMMU: fix sysfs leak in hotplug init path
Date: Wed, 21 Apr 2021 17:12:41 +0200
Message-ID: <1716403.SmlLz2RZUD@devpool47>
Organization: emlix GmbH
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Apr 2021 15:51:54 +0000
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
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

U2lnbmVkLW9mZi1ieTogUm9sZiBFaWtlIEJlZXIgPGViQGVtbGl4LmNvbT4KLS0tCiBkcml2ZXJz
L2lvbW11L2ludGVsL2RtYXIuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKSSBoYXZlIG5vdCBhY3R1YWxseSB0ZXN0ZWQgdGhpcyBidXQg
SSBndWVzcyBpdCBzaG91bGQgbWF0Y2ggdGhlIGNvZGUgaW4gCmZyZWVfaW9tbXUoKSBqdXN0IGJl
bG93LgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jIGIvZHJpdmVycy9p
b21tdS9pbnRlbC9kbWFyLmMKaW5kZXggZDVjNTFiNWMyMGFmLi5mYjM3YTliNzliM2EgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jCisrKyBiL2RyaXZlcnMvaW9tbXUvaW50
ZWwvZG1hci5jCkBAIC0xMTQ0LDcgKzExNDQsNyBAQCBzdGF0aWMgaW50IGFsbG9jX2lvbW11KHN0
cnVjdCBkbWFyX2RyaGRfdW5pdCAqZHJoZCkKIAogCQllcnIgPSBpb21tdV9kZXZpY2VfcmVnaXN0
ZXIoJmlvbW11LT5pb21tdSk7CiAJCWlmIChlcnIpCi0JCQlnb3RvIGVycl91bm1hcDsKKwkJCWdv
dG8gZXJyX3VucmVnaXN0ZXI7CiAJfQogCiAJZHJoZC0+aW9tbXUgPSBpb21tdTsKQEAgLTExNTIs
NiArMTE1Miw4IEBAIHN0YXRpYyBpbnQgYWxsb2NfaW9tbXUoc3RydWN0IGRtYXJfZHJoZF91bml0
ICpkcmhkKQogCiAJcmV0dXJuIDA7CiAKK2Vycl91bnJlZ2lzdGVyOgorCWlvbW11X2RldmljZV9z
eXNmc19yZW1vdmUoJmlvbW11LT5pb21tdSk7CiBlcnJfdW5tYXA6CiAJdW5tYXBfaW9tbXUoaW9t
bXUpOwogZXJyb3JfZnJlZV9zZXFfaWQ6Ci0tIAoyLjMxLjEKCgotLSAKUm9sZiBFaWtlIEJlZXIs
IGVtbGl4IEdtYkgsIGh0dHA6Ly93d3cuZW1saXguY29tCkZvbiArNDkgNTUxIDMwNjY0LTAsIEZh
eCArNDkgNTUxIDMwNjY0LTExCkdvdGhhZXIgUGxhdHogMywgMzcwODMgR8O2dHRpbmdlbiwgR2Vy
bWFueQpTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IEfDtnR0aW5nZW4sIEFtdHNnZXJpY2h0IEfDtnR0
aW5nZW4gSFIgQiAzMTYwCkdlc2Now6RmdHNmw7xocnVuZzogSGVpa2UgSm9yZGFuLCBEci4gVXdl
IEtyYWNrZSDigJMgVXN0LUlkTnIuOiBERSAyMDUgMTk4IDA1NQoKZW1saXggLSBzbWFydCBlbWJl
ZGRlZCBvcGVuIHNvdXJjZQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
aW9tbXU=
