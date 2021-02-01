Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 208EE30A7CF
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 13:41:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B61478687A;
	Mon,  1 Feb 2021 12:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbFj++Qs6uAL; Mon,  1 Feb 2021 12:41:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B543F86BF8;
	Mon,  1 Feb 2021 12:41:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 989A5C1DA8;
	Mon,  1 Feb 2021 12:41:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9443DC013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 12:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7727186F9C
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 12:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMu9d6Y+8M-c for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 12:41:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 425B986F96
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 12:41:31 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DTnbG0smRz7f58;
 Mon,  1 Feb 2021 20:40:10 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.92.226) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Feb 2021 20:41:20 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-kernel@vger.kernel.org>, <iommu@lists.linux-foundation.org>
Subject: [PATCH v2] iommu: Check dev->iommu in iommu_dev_xxx functions
Date: Mon, 1 Feb 2021 12:40:49 +0000
Message-ID: <20210201124049.19956-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.47.92.226]
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, will@kernel.org, linuxarm@openeuler.org,
 prime.zeng@hisilicon.com, robin.murphy@arm.com
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

VGhlIGRldmljZSBpb21tdSBwcm9iZS9hdHRhY2ggbWlnaHQgaGF2ZSBmYWlsZWQgbGVhdmluZyBk
ZXYtPmlvbW11CnRvIE5VTEwgYW5kIGRldmljZSBkcml2ZXJzIG1heSBzdGlsbCBpbnZva2UgdGhl
c2UgZnVuY3Rpb25zIHJlc3VsdGluZwppbiBhIGNyYXNoIGluIGlvbW11IHZlbmRvciBkcml2ZXIg
Y29kZS4gSGVuY2UgbWFrZSBzdXJlIHdlIGNoZWNrIHRoYXQuCgpBbHNvIGFkZGVkIGlvbW11X29w
cyB0byB0aGUgInN0cnVjdCBkZXZfaW9tbXUiIGFuZCBzZXQgaXQgaWYgdGhlIGRldgppcyBzdWNj
ZXNzZnVsbHkgYXNzb2NpYXRlZCB3aXRoIGFuIGlvbW11LsKgCgpGaXhlczrCoGEzYTE5NTkyOWQ0
MCAoImlvbW11OiBBZGQgQVBJcyBmb3IgbXVsdGlwbGUgZG9tYWlucyBwZXIgZGV2aWNlIikKU2ln
bmVkLW9mZi1ieTogU2hhbWVlciBLb2xvdGh1bSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9kaUBo
dWF3ZWkuY29tPgotLS0KdjEgLS0+IHYyOgogLUFkZGVkIGlvbW11X29wcyB0byBzdHJ1Y3QgZGV2
X2lvbW11IGJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIHdpdGggUm9iaW4uCiAtUmViYXNlZCBhZ2Fp
bnN0IGlvbW11LXRyZWUgY29yZSBicmFuY2guCi0tLQogZHJpdmVycy9pb21tdS9pb21tdS5jIHwg
MTkgKysrKysrKy0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9pb21tdS5oIHwgIDIgKysKIDIg
ZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lvbW11L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L2lvbW11LmMKaW5kZXgg
ZmQ3NmUyZjU3OWZlLi42MDIzZDBiN2M1NDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvaW9t
bXUuYworKysgYi9kcml2ZXJzL2lvbW11L2lvbW11LmMKQEAgLTIxNyw2ICsyMTcsNyBAQCBzdGF0
aWMgaW50IF9faW9tbXVfcHJvYmVfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGxp
c3RfaGVhZCAqZ3JvdXBfbGlzdAogCX0KIAogCWRldi0+aW9tbXUtPmlvbW11X2RldiA9IGlvbW11
X2RldjsKKwlkZXYtPmlvbW11LT5vcHMgPSBpb21tdV9kZXYtPm9wczsKIAogCWdyb3VwID0gaW9t
bXVfZ3JvdXBfZ2V0X2Zvcl9kZXYoZGV2KTsKIAlpZiAoSVNfRVJSKGdyb3VwKSkgewpAQCAtMjg2
NSwxMCArMjg2Niw4IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGlvbW11X2Z3c3BlY19hZGRfaWRzKTsK
ICAqLwogaW50IGlvbW11X2Rldl9lbmFibGVfZmVhdHVyZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGVu
dW0gaW9tbXVfZGV2X2ZlYXR1cmVzIGZlYXQpCiB7Ci0JY29uc3Qgc3RydWN0IGlvbW11X29wcyAq
b3BzID0gZGV2LT5idXMtPmlvbW11X29wczsKLQotCWlmIChvcHMgJiYgb3BzLT5kZXZfZW5hYmxl
X2ZlYXQpCi0JCXJldHVybiBvcHMtPmRldl9lbmFibGVfZmVhdChkZXYsIGZlYXQpOworCWlmIChk
ZXYtPmlvbW11ICYmIGRldi0+aW9tbXUtPm9wcy0+ZGV2X2VuYWJsZV9mZWF0KQorCQlyZXR1cm4g
ZGV2LT5pb21tdS0+b3BzLT5kZXZfZW5hYmxlX2ZlYXQoZGV2LCBmZWF0KTsKIAogCXJldHVybiAt
RU5PREVWOwogfQpAQCAtMjg4MSwxMCArMjg4MCw4IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGlvbW11
X2Rldl9lbmFibGVfZmVhdHVyZSk7CiAgKi8KIGludCBpb21tdV9kZXZfZGlzYWJsZV9mZWF0dXJl
KHN0cnVjdCBkZXZpY2UgKmRldiwgZW51bSBpb21tdV9kZXZfZmVhdHVyZXMgZmVhdCkKIHsKLQlj
b25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMgPSBkZXYtPmJ1cy0+aW9tbXVfb3BzOwotCi0JaWYg
KG9wcyAmJiBvcHMtPmRldl9kaXNhYmxlX2ZlYXQpCi0JCXJldHVybiBvcHMtPmRldl9kaXNhYmxl
X2ZlYXQoZGV2LCBmZWF0KTsKKwlpZiAoZGV2LT5pb21tdSAmJiBkZXYtPmlvbW11LT5vcHMtPmRl
dl9kaXNhYmxlX2ZlYXQpCisJCXJldHVybiBkZXYtPmlvbW11LT5vcHMtPmRldl9kaXNhYmxlX2Zl
YXQoZGV2LCBmZWF0KTsKIAogCXJldHVybiAtRUJVU1k7CiB9CkBAIC0yODkyLDEwICsyODg5LDgg
QEAgRVhQT1JUX1NZTUJPTF9HUEwoaW9tbXVfZGV2X2Rpc2FibGVfZmVhdHVyZSk7CiAKIGJvb2wg
aW9tbXVfZGV2X2ZlYXR1cmVfZW5hYmxlZChzdHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0gaW9tbXVf
ZGV2X2ZlYXR1cmVzIGZlYXQpCiB7Ci0JY29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzID0gZGV2
LT5idXMtPmlvbW11X29wczsKLQotCWlmIChvcHMgJiYgb3BzLT5kZXZfZmVhdF9lbmFibGVkKQot
CQlyZXR1cm4gb3BzLT5kZXZfZmVhdF9lbmFibGVkKGRldiwgZmVhdCk7CisJaWYgKGRldi0+aW9t
bXUgJiYgZGV2LT5pb21tdS0+b3BzLT5kZXZfZmVhdF9lbmFibGVkKQorCQlyZXR1cm4gZGV2LT5p
b21tdS0+b3BzLT5kZXZfZmVhdF9lbmFibGVkKGRldiwgZmVhdCk7CiAKIAlyZXR1cm4gZmFsc2U7
CiB9CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2lvbW11LmggYi9pbmNsdWRlL2xpbnV4L2lv
bW11LmgKaW5kZXggNTI0ZmZjMmZmNjRmLi5mZjBjNzZiZGZiNjcgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvaW9tbXUuaAorKysgYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgKQEAgLTM1NCw2ICsz
NTQsNyBAQCBzdHJ1Y3QgaW9tbXVfZmF1bHRfcGFyYW0gewogICogQGZhdWx0X3BhcmFtOiBJT01N
VSBkZXRlY3RlZCBkZXZpY2UgZmF1bHQgcmVwb3J0aW5nIGRhdGEKICAqIEBmd3NwZWM6CSBJT01N
VSBmd3NwZWMgZGF0YQogICogQGlvbW11X2RldjoJIElPTU1VIGRldmljZSB0aGlzIGRldmljZSBp
cyBsaW5rZWQgdG8KKyAqIEBvcHM6CSBpb21tdS1vcHMgZm9yIHRhbGtpbmcgdG8gdGhlIGlvbW11
X2RldgogICogQHByaXY6CSBJT01NVSBEcml2ZXIgcHJpdmF0ZSBkYXRhCiAgKgogICogVE9ETzog
bWlncmF0ZSBvdGhlciBwZXIgZGV2aWNlIGRhdGEgcG9pbnRlcnMgdW5kZXIgaW9tbXVfZGV2X2Rh
dGEsIGUuZy4KQEAgLTM2NCw2ICszNjUsNyBAQCBzdHJ1Y3QgZGV2X2lvbW11IHsKIAlzdHJ1Y3Qg
aW9tbXVfZmF1bHRfcGFyYW0JKmZhdWx0X3BhcmFtOwogCXN0cnVjdCBpb21tdV9md3NwZWMJCSpm
d3NwZWM7CiAJc3RydWN0IGlvbW11X2RldmljZQkJKmlvbW11X2RldjsKKwljb25zdCBzdHJ1Y3Qg
aW9tbXVfb3BzCQkqb3BzOwogCXZvaWQJCQkJKnByaXY7CiB9OwogCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcg
bGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
