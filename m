Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D35391CA5FD
	for <lists.iommu@lfdr.de>; Fri,  8 May 2020 10:25:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E1BF87C3C;
	Fri,  8 May 2020 08:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovTLxzCHSH4B; Fri,  8 May 2020 08:25:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 20A1187C20;
	Fri,  8 May 2020 08:25:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0591FC07FF;
	Fri,  8 May 2020 08:25:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EABFC07FF
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5732989781
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohmdFeHawhsR for <iommu@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:46:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB5D38977C
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:46:12 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9AC1CDE8277282167DC2;
 Fri,  8 May 2020 09:46:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 May 2020 09:46:00 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
Subject: [PATCH -next] iommu/arm-smmu-v3: remove set but not used variable
 'smmu'
Date: Fri, 8 May 2020 09:49:55 +0800
Message-ID: <20200508014955.87630-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 08 May 2020 08:24:59 +0000
Cc: chenzhou10@huawei.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9p
b21tdS9hcm0tc21tdS12My5jOjI5ODk6MjY6Cndhcm5pbmc6IHZhcmlhYmxlIOKAmHNtbXXigJkg
c2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KICBzdHJ1Y3QgYXJt
X3NtbXVfZGV2aWNlICpzbW11OwoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3
ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBDaGVuIFpob3UgPGNoZW56aG91MTBAaHVhd2VpLmNvbT4K
LS0tCiBkcml2ZXJzL2lvbW11L2FybS1zbW11LXYzLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2FybS1zbW11LXYzLmMg
Yi9kcml2ZXJzL2lvbW11L2FybS1zbW11LXYzLmMKaW5kZXggNDJlMWVlN2U1MTk3Li44OWVlOWM1
ZDhiODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUtdjMuYworKysgYi9kcml2
ZXJzL2lvbW11L2FybS1zbW11LXYzLmMKQEAgLTI5ODYsMTMgKzI5ODYsMTEgQEAgc3RhdGljIHZv
aWQgYXJtX3NtbXVfcmVsZWFzZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVj
dCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0KGRldik7CiAJc3Ry
dWN0IGFybV9zbW11X21hc3RlciAqbWFzdGVyOwotCXN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNt
bXU7CiAKIAlpZiAoIWZ3c3BlYyB8fCBmd3NwZWMtPm9wcyAhPSAmYXJtX3NtbXVfb3BzKQogCQly
ZXR1cm47CiAKIAltYXN0ZXIgPSBkZXZfaW9tbXVfcHJpdl9nZXQoZGV2KTsKLQlzbW11ID0gbWFz
dGVyLT5zbW11OwogCWFybV9zbW11X2RldGFjaF9kZXYobWFzdGVyKTsKIAlhcm1fc21tdV9kaXNh
YmxlX3Bhc2lkKG1hc3Rlcik7CiAJa2ZyZWUobWFzdGVyKTsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0
CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
