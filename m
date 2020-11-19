Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC002B9231
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 13:13:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B15A786AE0;
	Thu, 19 Nov 2020 12:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p38xzXfIDfPz; Thu, 19 Nov 2020 12:13:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B75886B0E;
	Thu, 19 Nov 2020 12:13:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 371FFC0891;
	Thu, 19 Nov 2020 12:13:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 608D5C0891
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 53FD4873FD
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkYhbAdYEfyN for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 12:13:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6A512873CE
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:13:09 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CcJTz013FzhdPH;
 Thu, 19 Nov 2020 20:12:55 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.210.168.73) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 20:12:56 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <devel@acpica.org>
Subject: [RFC PATCH v2 6/8] =?UTF-8?q?iommu/arm-smmu-v3:=20Add=20bypass=20?=
 =?UTF-8?q?flag=20to=C2=A0arm=5Fsmmu=5Fwrite=5Fstrtab=5Fent()?=
Date: Thu, 19 Nov 2020 12:11:48 +0000
Message-ID: <20201119121150.3316-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20201119121150.3316-1-shameerali.kolothum.thodi@huawei.com>
References: <20201119121150.3316-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.210.168.73]
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, steven.price@arm.com, guohanjun@huawei.com,
 Sami.Mujawar@arm.com, robin.murphy@arm.com, wanghuiqiang@huawei.com
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

QnkgZGVmYXVsdCzCoGRpc2FibGVfYnlwYXNzIGlzIHNldCBhbmQgYW55IGRldiB3aXRob3V0IGFu
IGlvbW11IGRvbWFpbgppbnN0YWxscyBTVEUgd2l0aCBDRkdfQUJPUlQgZHVyaW5nwqBhcm1fc21t
dV9pbml0X2J5cGFzc19zdGVzKCkuIEludHJvZHVjZQphICJieXBhc3MiIGZsYWcgdG/CoGFybV9z
bW11X3dyaXRlX3N0cnRhYl9lbnQoKSBzbyB0aGF0IHdlIGNhbiBmb3JjZSBpdCB0bwppbnN0YWxs
wqBDRkdfQllQQVNTIFNURSBmb3Igc3BlY2lmaWMgU0lEcy4gVGhpcyB3aWxsIGJlwqB1c2VmdWzC
oGZvciBSTVIKcmVsYXRlZCBTSURzLgoKU2lnbmVkLW9mZi1ieTogU2hhbWVlciBLb2xvdGh1bSA8
c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvaW9tbXUv
YXJtL2FybS1zbW11LXYzL2FybS1zbW11LXYzLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aW9tbXUvYXJtL2FybS1zbW11LXYzL2FybS1zbW11LXYzLmMgYi9kcml2ZXJzL2lvbW11L2FybS9h
cm0tc21tdS12My9hcm0tc21tdS12My5jCmluZGV4IDE5NTNiMzE3ZDgxNC4uNWYzNjZkNWE5ZWJm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS12My9hcm0tc21tdS12My5j
CisrKyBiL2RyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11LXYzL2FybS1zbW11LXYzLmMKQEAgLTEx
NzQsNyArMTE3NCw3IEBAIHN0YXRpYyB2b2lkIGFybV9zbW11X3N5bmNfc3RlX2Zvcl9zaWQoc3Ry
dWN0IGFybV9zbW11X2RldmljZSAqc21tdSwgdTMyIHNpZCkKIH0KIAogc3RhdGljIHZvaWQgYXJt
X3NtbXVfd3JpdGVfc3RydGFiX2VudChzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyICptYXN0ZXIsIHUz
MiBzaWQsCi0JCQkJICAgICAgX19sZTY0ICpkc3QpCisJCQkJICAgICAgX19sZTY0ICpkc3QsIGJv
b2wgYnlwYXNzKQogewogCS8qCiAJICogVGhpcyBpcyBoaWRlb3VzbHkgY29tcGxpY2F0ZWQsIGJ1
dCB3ZSBvbmx5IHJlYWxseSBjYXJlIGFib3V0CkBAIC0xMjQ1LDcgKzEyNDUsNyBAQCBzdGF0aWMg
dm9pZCBhcm1fc21tdV93cml0ZV9zdHJ0YWJfZW50KHN0cnVjdCBhcm1fc21tdV9tYXN0ZXIgKm1h
c3RlciwgdTMyIHNpZCwKIAogCS8qIEJ5cGFzcy9mYXVsdCAqLwogCWlmICghc21tdV9kb21haW4g
fHwgIShzMV9jZmcgfHwgczJfY2ZnKSkgewotCQlpZiAoIXNtbXVfZG9tYWluICYmIGRpc2FibGVf
YnlwYXNzKQorCQlpZiAoIXNtbXVfZG9tYWluICYmIGRpc2FibGVfYnlwYXNzICYmICFieXBhc3Mp
CiAJCQl2YWwgfD0gRklFTERfUFJFUChTVFJUQUJfU1RFXzBfQ0ZHLCBTVFJUQUJfU1RFXzBfQ0ZH
X0FCT1JUKTsKIAkJZWxzZQogCQkJdmFsIHw9IEZJRUxEX1BSRVAoU1RSVEFCX1NURV8wX0NGRywg
U1RSVEFCX1NURV8wX0NGR19CWVBBU1MpOwpAQCAtMTMxNyw3ICsxMzE3LDcgQEAgc3RhdGljIHZv
aWQgYXJtX3NtbXVfaW5pdF9ieXBhc3Nfc3RlcyhfX2xlNjQgKnN0cnRhYiwgdW5zaWduZWQgaW50
IG5lbnQpCiAJdW5zaWduZWQgaW50IGk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgbmVudDsgKytpKSB7
Ci0JCWFybV9zbW11X3dyaXRlX3N0cnRhYl9lbnQoTlVMTCwgLTEsIHN0cnRhYik7CisJCWFybV9z
bW11X3dyaXRlX3N0cnRhYl9lbnQoTlVMTCwgLTEsIHN0cnRhYiwgZmFsc2UpOwogCQlzdHJ0YWIg
Kz0gU1RSVEFCX1NURV9EV09SRFM7CiAJfQogfQpAQCAtMjAzOCw3ICsyMDM4LDcgQEAgc3RhdGlj
IHZvaWQgYXJtX3NtbXVfaW5zdGFsbF9zdGVfZm9yX2RldihzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVy
ICptYXN0ZXIpCiAJCWlmIChqIDwgaSkKIAkJCWNvbnRpbnVlOwogCi0JCWFybV9zbW11X3dyaXRl
X3N0cnRhYl9lbnQobWFzdGVyLCBzaWQsIHN0ZXApOworCQlhcm1fc21tdV93cml0ZV9zdHJ0YWJf
ZW50KG1hc3Rlciwgc2lkLCBzdGVwLCBmYWxzZSk7CiAJfQogfQogCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcg
bGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
