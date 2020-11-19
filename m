Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CC86A2B8B37
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 06:58:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68E918736F;
	Thu, 19 Nov 2020 05:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwXa-qUwOLW5; Thu, 19 Nov 2020 05:58:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C38E487346;
	Thu, 19 Nov 2020 05:58:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B58D5C07FF;
	Thu, 19 Nov 2020 05:58:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEACBC07FF
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 05:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B6A9186968
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 05:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIAn7bR-AgIx for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 05:58:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CA58786943
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 05:58:36 +0000 (UTC)
IronPort-SDR: WLeOqJvGNqE6GeRQau1fnxXIcVvKQh+vs5Zs0DbCvLYeXdGWWFn8mqusFIfcwCrxO7ywr2aJHb
 /cGbTA7pwrTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="235383092"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="235383092"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 21:58:35 -0800
IronPort-SDR: s9meoi1P7Q22K3FC62cjIaPmRut2VXtfLVImt0gET1ADZL/bjcsfFM1n2JtFjfqqbUOhQ9mWcN
 MYAabKsc8Rtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="431120296"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2020 21:58:33 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/vt-d: Fix compile error with CONFIG_PCI_ATS not set
Date: Thu, 19 Nov 2020 13:51:19 +0800
Message-Id: <20201119055119.2862701-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, iommu@lists.linux-foundation.org,
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

Rml4IHRoZSBjb21waWxlIGVycm9yIGJlbG93IChDT05GSUdfUENJX0FUUyBub3Qgc2V0KToKCmRy
aXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jOiBJbiBmdW5jdGlvbiDigJh2Zl9pbmhlcml0X21zaV9k
b21haW7igJk6CmRyaXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jOjMzODo1OTogZXJyb3I6IOKAmHN0
cnVjdCBwY2lfZGV24oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYcGh5c2Zu4oCZOyBkaWQgeW91
IG1lYW4g4oCYaXNfcGh5c2Zu4oCZPwogIDMzOCB8ICBkZXZfc2V0X21zaV9kb21haW4oJnBkZXYt
PmRldiwgZGV2X2dldF9tc2lfZG9tYWluKCZwZGV2LT5waHlzZm4tPmRldikpOwogICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaXNfcGh5c2ZuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1pb21tdS9DQU11SE1kWEE3d2ZKb3ZtZlNIMm5iQWhOMGNQeUNpRkhvZFR2ZzRhOEhtOXJ4
NURqLXdAbWFpbC5nbWFpbC5jb20vCkZpeGVzOiBmZjgyODcyOWJlNDQ2ICgiaW9tbXUvdnQtZDog
Q3VyZSBWRiBpcnFkb21haW4gaGlja3VwIikKQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51
dHJvbml4LmRlPgpSZXBvcnRlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4KU2lnbmVkLW9mZi1ieTogTHUgQmFvbHUgPGJhb2x1Lmx1QGxpbnV4LmludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aW9tbXUvaW50ZWwvZG1hci5jIGIvZHJpdmVycy9pb21tdS9pbnRlbC9kbWFyLmMKaW5kZXggYjJl
ODA0NDczMjA5Li4xMTMxOWU0ZGNlNGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvaW50ZWwv
ZG1hci5jCisrKyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jCkBAIC0zMzUsNyArMzM1LDkg
QEAgc3RhdGljIHZvaWQgIGRtYXJfcGNpX2J1c19kZWxfZGV2KHN0cnVjdCBkbWFyX3BjaV9ub3Rp
ZnlfaW5mbyAqaW5mbykKIAogc3RhdGljIGlubGluZSB2b2lkIHZmX2luaGVyaXRfbXNpX2RvbWFp
bihzdHJ1Y3QgcGNpX2RldiAqcGRldikKIHsKLQlkZXZfc2V0X21zaV9kb21haW4oJnBkZXYtPmRl
diwgZGV2X2dldF9tc2lfZG9tYWluKCZwZGV2LT5waHlzZm4tPmRldikpOworCXN0cnVjdCBwY2lf
ZGV2ICpwaHlzZm4gPSBwY2lfcGh5c2ZuKHBkZXYpOworCisJZGV2X3NldF9tc2lfZG9tYWluKCZw
ZGV2LT5kZXYsIGRldl9nZXRfbXNpX2RvbWFpbigmcGh5c2ZuLT5kZXYpKTsKIH0KIAogc3RhdGlj
IGludCBkbWFyX3BjaV9idXNfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
