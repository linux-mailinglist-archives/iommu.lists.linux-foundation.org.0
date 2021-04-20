Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D4D365563
	for <lists.iommu@lfdr.de>; Tue, 20 Apr 2021 11:29:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAF414020D;
	Tue, 20 Apr 2021 09:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IsAHOwkjkQ0V; Tue, 20 Apr 2021 09:29:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 069C940252;
	Tue, 20 Apr 2021 09:29:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D867DC0020;
	Tue, 20 Apr 2021 09:29:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09615C000B
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 09:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E69F44033F
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 09:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ke438ORTP_Ni for <iommu@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 09:29:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 080F840308
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 09:29:13 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FPdbS6mRpzpZTX;
 Tue, 20 Apr 2021 17:26:12 +0800 (CST)
Received: from A2006125610.china.huawei.com (10.47.83.26) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 20 Apr 2021 17:29:03 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v3 10/10] iommu/arm-smmu: Reserve any RMR regions associated
 with a dev
Date: Tue, 20 Apr 2021 10:27:51 +0200
Message-ID: <20210420082751.1829-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20210420082751.1829-1-shameerali.kolothum.thodi@huawei.com>
References: <20210420082751.1829-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.83.26]
X-CFilter-Loop: Reflected
Cc: jon@solid-run.com, linuxarm@huawei.com, steven.price@arm.com,
 guohanjun@huawei.com, Sami.Mujawar@arm.com, robin.murphy@arm.com,
 wanghuiqiang@huawei.com
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

RnJvbTogSm9uIE5ldHRsZXRvbiA8am9uQHNvbGlkLXJ1bi5jb20+CgpHZXQgUk1SIHJlZ2lvbnMg
YXNzb2NpYXRlZCB3aXRoIGEgZGV2wqByZXNlcnZlZCBzbyB0aGF0IHRoZXJlIGlzCmEgdW5pdHkg
bWFwcGluZyBmb3IgdGhlbSBpbsKgU01NVS4KClNpZ25lZC1vZmYtYnk6IEpvbiBOZXR0bGV0b24g
PGpvbkBzb2xpZC1ydW4uY29tPgpTaWduZWQtb2ZmLWJ5OiBTaGFtZWVyIEtvbG90aHVtIDxzaGFt
ZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9pb21tdS9hcm0v
YXJtLXNtbXUvYXJtLXNtbXUuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11
L2FybS9hcm0tc21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21tdS9hcm0vYXJtLXNtbXUvYXJt
LXNtbXUuYwppbmRleCA0ZDJmOTE2MjZkODcuLjhjYmU4Yjk4ZThmMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9pb21tdS9hcm0vYXJtLXNtbXUvYXJtLXNtbXUuYworKysgYi9kcml2ZXJzL2lvbW11L2Fy
bS9hcm0tc21tdS9hcm0tc21tdS5jCkBAIC0xNTkxLDYgKzE1OTEsMzggQEAgc3RhdGljIGludCBh
cm1fc21tdV9vZl94bGF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBvZl9waGFuZGxlX2Fy
Z3MgKmFyZ3MpCiAJcmV0dXJuIGlvbW11X2Z3c3BlY19hZGRfaWRzKGRldiwgJmZ3aWQsIDEpOwog
fQogCitzdGF0aWMgYm9vbCBhcm1fc21tdV9kZXZfaGFzX3JtcihzdHJ1Y3QgYXJtX3NtbXVfbWFz
dGVyX2NmZyAqY2ZnLAorCQkJCSBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMsCisJCQkJIHN0
cnVjdCBpb21tdV9ybXIgKmUpCit7CisJc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSA9IGNm
Zy0+c21tdTsKKwlzdHJ1Y3QgYXJtX3NtbXVfc21yICpzbXJzID0gc21tdS0+c21yczsKKwlpbnQg
aSwgaWR4OworCisJZm9yX2VhY2hfY2ZnX3NtZShjZmcsIGZ3c3BlYywgaSwgaWR4KSB7CisJCWlm
IChlLT5zaWQgPT0gc21yc1tpZHhdLmlkKQorCQkJcmV0dXJuIHRydWU7CisJfQorCisJcmV0dXJu
IGZhbHNlOworfQorCitzdGF0aWMgdm9pZCBhcm1fc21tdV9ybXJfZ2V0X3Jlc3ZfcmVnaW9ucyhz
dHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJCSAgc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkKK3sKKwlz
dHJ1Y3QgYXJtX3NtbXVfbWFzdGVyX2NmZyAqY2ZnID0gZGV2X2lvbW11X3ByaXZfZ2V0KGRldik7
CisJc3RydWN0IGlvbW11X2Z3c3BlYyAqZndzcGVjID0gZGV2X2lvbW11X2Z3c3BlY19nZXQoZGV2
KTsKKwlzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11ID0gY2ZnLT5zbW11OworCXN0cnVjdCBp
b21tdV9ybXIgKnJtcjsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkocm1yLCAmc21tdS0+cm1yX2xp
c3QsIGxpc3QpIHsKKwkJaWYgKCFhcm1fc21tdV9kZXZfaGFzX3JtcihjZmcsIGZ3c3BlYywgcm1y
KSkKKwkJCWNvbnRpbnVlOworCisJCWlvbW11X2RtYV9nZXRfcm1yX3Jlc3ZfcmVnaW9ucyhkZXYs
IHJtciwgaGVhZCk7CisJfQorfQorCiBzdGF0aWMgdm9pZCBhcm1fc21tdV9nZXRfcmVzdl9yZWdp
b25zKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCQkgICAgICBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFk
KQogewpAQCAtMTYwNSw2ICsxNjM3LDcgQEAgc3RhdGljIHZvaWQgYXJtX3NtbXVfZ2V0X3Jlc3Zf
cmVnaW9ucyhzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJbGlzdF9hZGRfdGFpbCgmcmVnaW9uLT5saXN0
LCBoZWFkKTsKIAogCWlvbW11X2RtYV9nZXRfcmVzdl9yZWdpb25zKGRldiwgaGVhZCk7CisJYXJt
X3NtbXVfcm1yX2dldF9yZXN2X3JlZ2lvbnMoZGV2LCBoZWFkKTsKIH0KIAogc3RhdGljIGludCBh
cm1fc21tdV9kZWZfZG9tYWluX3R5cGUoc3RydWN0IGRldmljZSAqZGV2KQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWls
aW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
