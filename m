Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5BD3C27BD
	for <lists.iommu@lfdr.de>; Fri,  9 Jul 2021 18:48:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85838423DC;
	Fri,  9 Jul 2021 16:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj1H8PCK1GCm; Fri,  9 Jul 2021 16:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 930A3423E6;
	Fri,  9 Jul 2021 16:48:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48357C000E;
	Fri,  9 Jul 2021 16:48:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81B50C000E
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 16:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 689CD83CAE
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 16:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3TFYin0RepN for <iommu@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 16:47:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D66B83C67
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 16:47:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="189413949"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="189413949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 09:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="492603155"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 09 Jul 2021 09:47:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Jul 2021 19:47:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] iommu/vt-d: Disable igfx iommu superpage on bxt/skl/glk
Date: Fri,  9 Jul 2021 19:47:46 +0300
Message-Id: <20210709164750.9465-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkg
cmFuIGludG8gc29tZSBraW5kIG9mIGZhaWwgd2l0aCBWVC1kIHN1cGVycGFnZSBvbiBHZW1pbmxh
a2UgaWdmeCwKc28gd2l0aG91dCBhbnkgYmV0dGVyIGlkZWFzIGxldCdzIGp1c3QgZGlzYWJsZSBp
dC4KCkFkZGl0aW9uYWxseSBTa3lsYWtlL0Jyb3h0b24gaWdmeCBoYXZlIGtub3duIGlzc3VlcyB3
aXRoIFZULWQKc3VwZXJwYWdlIGFzIHdlbGwsIHNvIGxldCdzIGRpc2FibGUgaXQgdGhlcmUgYXMg
d2VsbC4gVGhpcyBzaG91bGQKbGV0IHVzIHJlLWVuYWJsZSBmcmFtZSBidWZmZXIgY29tcHJlc3Np
b24gKEZCQykgZm9yIHNvbWUgZXh0cmEKcG93ZXIgc2F2aW5ncyB3aGVuIHRoZSBkaXNwbGF5IGlz
IG9uLgoKQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IEx1IEJh
b2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+CkNjOiBpb21tdUBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwoKVmlsbGUgU3lyasOkbMOkICg0KToKICBpb21tdS92dC1kOiBEaXNhYmxlIHN1
cGVycGFnZSBmb3IgR2VtaW5pbGFrZSBpZ2Z4CiAgaW9tbXUvdnQtZDogRGlzYWJsZSBzdXBlcnBh
Z2UgZm9yIEJyb3h0b24gaWdmeAogIGlvbW11L3Z0LWQ6IERpc2FibGUgc3VwZXJwYWdlIGZvciBT
a3lsYWtlIGlnZngKICBkcm0vaTkxNS9mYmM6IEFsbG93IEZCQyArIFZULWQgb24gU0tML0JYVAoK
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMgfCAxNiAtLS0tLS0tLS0K
IGRyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUuYyAgICAgICAgICAgICAgfCA0NCArKysrKysrKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pCgotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW9tbXU=
