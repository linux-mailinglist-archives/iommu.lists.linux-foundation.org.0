Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1021783F7
	for <lists.iommu@lfdr.de>; Tue,  3 Mar 2020 21:28:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6E36420415;
	Tue,  3 Mar 2020 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2oWemHzpU9f0; Tue,  3 Mar 2020 20:27:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CC21A20015;
	Tue,  3 Mar 2020 20:27:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE00CC013E;
	Tue,  3 Mar 2020 20:27:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AE4AC013E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 28F6120415
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3ZCe0O5uPMt for <iommu@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 20:27:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 83E8820015
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:27:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08CCA20CC7;
 Tue,  3 Mar 2020 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583267277;
 bh=6UaeTxB0EcXT+LhMv79ITkiIEzlAiO/oYwI25OmNdCE=;
 h=From:To:Cc:Subject:Date:From;
 b=tSChNZ7KPOV1+drPeErg8JAgd6eywCCoUpxqqWg119Q62uXljcSQ6MiSyp3T6z7cm
 ND9/x7IrXyJAWX81ZiDU57E2PGWeZp+fIoVRnuGOLmY3QEvGp70NaMeKavWSSvhvlJ
 +auTOmwbFErabMmd1vCSGP++nR3nck4Jjc6iGrhU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/4] iommu/omap: Fix pointer cast -Wpointer-to-int-cast
 warnings on 64 bit
Date: Tue,  3 Mar 2020 21:27:48 +0100
Message-Id: <20200303202751.5153-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

cG9pbnRlcnMgc2hvdWxkIGJlIGNhc3RlZCB0byB1bnNpZ25lZCBsb25nIHRvIGF2b2lkCi1XcG9p
bnRlci10by1pbnQtY2FzdCB3YXJuaW5ncyB3aGVuIGNvbXBpbGluZyBvbiA2NC1iaXQgcGxhdGZv
cm0gKGUuZy4Kd2l0aCBDT01QSUxFX1RFU1QpOgoKICAgIGRyaXZlcnMvaW9tbXUvb21hcC1pb21t
dS5jOiBJbiBmdW5jdGlvbiDigJhvbWFwMl9pb21tdV9lbmFibGXigJk6CiAgICBkcml2ZXJzL2lv
bW11L29tYXAtaW9tbXUuYzoxNzA6MjU6IHdhcm5pbmc6CiAgICAgICAgY2FzdCBmcm9tIHBvaW50
ZXIgdG8gaW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdwb2ludGVyLXRvLWludC1jYXN0XQog
ICAgICBpZiAoIW9iai0+aW9wZ2QgfHwgIUlTX0FMSUdORUQoKHUzMilvYmotPmlvcGdkLCAgU1pf
MTZLKSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpTaWduZWQtb2ZmLWJ5OiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CgotLS0KCk5vdCB0ZXN0ZWQgb24gaGFy
ZHdhcmUuCi0tLQogZHJpdmVycy9pb21tdS9vbWFwLWlvbW11LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2lvbW11L29tYXAtaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvb21hcC1pb21tdS5jCmluZGV4IGJl
NTUxY2MzNGJlNC4uNTBlOGFjZjg4ZWM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L29tYXAt
aW9tbXUuYworKysgYi9kcml2ZXJzL2lvbW11L29tYXAtaW9tbXUuYwpAQCAtMTY3LDcgKzE2Nyw3
IEBAIHN0YXRpYyBpbnQgb21hcDJfaW9tbXVfZW5hYmxlKHN0cnVjdCBvbWFwX2lvbW11ICpvYmop
CiB7CiAJdTMyIGwsIHBhOwogCi0JaWYgKCFvYmotPmlvcGdkIHx8ICFJU19BTElHTkVEKCh1MzIp
b2JqLT5pb3BnZCwgIFNaXzE2SykpCisJaWYgKCFvYmotPmlvcGdkIHx8ICFJU19BTElHTkVEKCh1
bnNpZ25lZCBsb25nKW9iai0+aW9wZ2QsICBTWl8xNkspKQogCQlyZXR1cm4gLUVJTlZBTDsKIAog
CXBhID0gdmlydF90b19waHlzKG9iai0+aW9wZ2QpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9t
bXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
