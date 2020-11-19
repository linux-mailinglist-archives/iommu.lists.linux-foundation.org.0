Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 890FD2B922B
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 13:12:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 494982733D;
	Thu, 19 Nov 2020 12:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99YLl27bZOYP; Thu, 19 Nov 2020 12:12:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5D248272BB;
	Thu, 19 Nov 2020 12:12:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 553DAC0891;
	Thu, 19 Nov 2020 12:12:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A61E8C0891
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8DD65873C9
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7wgcioW8dV6 for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 12:12:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 19899873C8
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:12:50 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CcJTJ1kRJzLqQB;
 Thu, 19 Nov 2020 20:12:20 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.210.168.73) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 20:12:32 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <devel@acpica.org>
Subject: [RFC PATCH v2 2/8] ACPI/IORT: Add support for RMR node parsing
Date: Thu, 19 Nov 2020 12:11:44 +0000
Message-ID: <20201119121150.3316-3-shameerali.kolothum.thodi@huawei.com>
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

QWRkIHN1cHBvcnQgZm9yIHBhcnNpbmcgUk1SIG5vZGUgaW5mb3JtYXRpb24gZnJvbSBBQ1BJLgpG
aW5kIGFzc29jaWF0ZWQgc3RyZWFtIGlkcyBhbmQgc21tdSBub2RlwqBpbmZvIGZyb20gdGhlClJN
UiBub2RlIGFuZCBwb3B1bGF0ZSBhIGxpbmtlZCBsaXN0IHdpdGggUk1SIG1lbW9yeQpkZXNjcmlw
dG9ycy4KClNpZ25lZC1vZmYtYnk6IFNoYW1lZXIgS29sb3RodW0gPHNoYW1lZXJhbGkua29sb3Ro
dW0udGhvZGlAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2FjcGkvYXJtNjQvaW9ydC5jIHwgMTIy
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Fj
cGkvYXJtNjQvaW9ydC5jIGIvZHJpdmVycy9hY3BpL2FybTY0L2lvcnQuYwppbmRleCA5OTI5ZmY1
MGMwYzAuLmE5NzA1YWEzNTAyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9hY3BpL2FybTY0L2lvcnQu
YworKysgYi9kcml2ZXJzL2FjcGkvYXJtNjQvaW9ydC5jCkBAIC00MCw2ICs0MCwyNSBAQCBzdHJ1
Y3QgaW9ydF9md25vZGUgewogc3RhdGljIExJU1RfSEVBRChpb3J0X2Z3bm9kZV9saXN0KTsKIHN0
YXRpYyBERUZJTkVfU1BJTkxPQ0soaW9ydF9md25vZGVfbG9jayk7CiAKK3N0cnVjdCBpb3J0X3Jt
cl9pZCB7CisJdTMyICBzaWQ7CisJc3RydWN0IGFjcGlfaW9ydF9ub2RlICpzbW11OworfTsKKwor
LyoKKyAqIE9uZSBlbnRyeSBmb3IgSU9SVCBSTVIuCisgKi8KK3N0cnVjdCBpb3J0X3Jtcl9lbnRy
eSB7CisJc3RydWN0IGxpc3RfaGVhZCBsaXN0OworCisJdW5zaWduZWQgaW50IHJtcl9pZHNfbnVt
OworCXN0cnVjdCBpb3J0X3Jtcl9pZCAqcm1yX2lkczsKKworCXN0cnVjdCBhY3BpX2lvcnRfcm1y
X2Rlc2MgKnJtcl9kZXNjOworfTsKKworc3RhdGljIExJU1RfSEVBRChpb3J0X3Jtcl9saXN0KTsg
ICAgICAgICAvKiBsaXN0IG9mIFJNUiByZWdpb25zIGZyb20gQUNQSSAqLworCiAvKioKICAqIGlv
cnRfc2V0X2Z3bm9kZSgpIC0gQ3JlYXRlIGlvcnRfZndub2RlIGFuZCB1c2UgaXQgdG8gcmVnaXN0
ZXIKICAqCQkgICAgICAgaW9tbXUgZGF0YSBpbiB0aGUgaW9ydF9md25vZGVfbGlzdApAQCAtMzkz
LDcgKzQxMiw4IEBAIHN0YXRpYyBzdHJ1Y3QgYWNwaV9pb3J0X25vZGUgKmlvcnRfbm9kZV9nZXRf
aWQoc3RydWN0IGFjcGlfaW9ydF9ub2RlICpub2RlLAogCQlpZiAobm9kZS0+dHlwZSA9PSBBQ1BJ
X0lPUlRfTk9ERV9OQU1FRF9DT01QT05FTlQgfHwKIAkJICAgIG5vZGUtPnR5cGUgPT0gQUNQSV9J
T1JUX05PREVfUENJX1JPT1RfQ09NUExFWCB8fAogCQkgICAgbm9kZS0+dHlwZSA9PSBBQ1BJX0lP
UlRfTk9ERV9TTU1VX1YzIHx8Ci0JCSAgICBub2RlLT50eXBlID09IEFDUElfSU9SVF9OT0RFX1BN
Q0cpIHsKKwkJICAgIG5vZGUtPnR5cGUgPT0gQUNQSV9JT1JUX05PREVfUE1DRyB8fAorCQkgICAg
bm9kZS0+dHlwZSA9PSBBQ1BJX0lPUlRfTk9ERV9STVIpIHsKIAkJCSppZF9vdXQgPSBtYXAtPm91
dHB1dF9iYXNlOwogCQkJcmV0dXJuIHBhcmVudDsKIAkJfQpAQCAtMTY0Nyw2ICsxNjY3LDEwMyBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgaW9ydF9lbmFibGVfYWNzKHN0cnVjdCBhY3BpX2lvcnRfbm9k
ZSAqaW9ydF9ub2RlKQogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgdm9pZCBpb3J0X2VuYWJsZV9hY3Mo
c3RydWN0IGFjcGlfaW9ydF9ub2RlICppb3J0X25vZGUpIHsgfQogI2VuZGlmCitzdGF0aWMgaW50
IGlvcnRfcm1yX2Rlc2NfdmFsaWQoc3RydWN0IGFjcGlfaW9ydF9ybXJfZGVzYyAqZGVzYykKK3sK
KwlzdHJ1Y3QgaW9ydF9ybXJfZW50cnkgKmU7CisJdTY0IGVuZCwgc3RhcnQgPSBkZXNjLT5iYXNl
X2FkZHJlc3MsIGxlbmd0aCA9IGRlc2MtPmxlbmd0aDsKKworCWlmICghSVNfQUxJR05FRChzdGFy
dCwgU1pfNjRLKSB8fCAhSVNfQUxJR05FRChsZW5ndGgsIFNaXzY0SykpCisJCXJldHVybiAtRUlO
VkFMOworCisJZW5kID0gc3RhcnQgKyBsZW5ndGggLSAxOworCisJLyogQ2hlY2sgZm9yIGFkZHJl
c3Mgb3ZlcmxhcCAqLworCWxpc3RfZm9yX2VhY2hfZW50cnkoZSwgJmlvcnRfcm1yX2xpc3QsIGxp
c3QpIHsKKwkJdTY0IGVfc3RhcnQgPSBlLT5ybXJfZGVzYy0+YmFzZV9hZGRyZXNzOworCQl1NjQg
ZV9lbmQgPSBlX3N0YXJ0ICsgZS0+cm1yX2Rlc2MtPmxlbmd0aCAtIDE7CisKKwkJaWYgKHN0YXJ0
IDw9IGVfZW5kICYmIGVuZCA+PSBlX3N0YXJ0KQorCQkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJ
cmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgX19pbml0IGlvcnRfcGFyc2Vfcm1yKHN0cnVjdCBh
Y3BpX2lvcnRfbm9kZSAqaW9ydF9ub2RlKQoreworCXN0cnVjdCBpb3J0X3Jtcl9pZCAqcm1yX2lk
cywgKmlkczsKKwlzdHJ1Y3QgaW9ydF9ybXJfZW50cnkgKmU7CisJc3RydWN0IGFjcGlfaW9ydF9y
bXIgKnJtcjsKKwlzdHJ1Y3QgYWNwaV9pb3J0X3Jtcl9kZXNjICpybXJfZGVzYzsKKwl1MzIgbWFw
X2NvdW50ID0gaW9ydF9ub2RlLT5tYXBwaW5nX2NvdW50OworCWludCBpLCByZXQgPSAwLCBkZXNj
X2NvdW50ID0gMDsKKworCWlmIChpb3J0X25vZGUtPnR5cGUgIT0gQUNQSV9JT1JUX05PREVfUk1S
KQorCQlyZXR1cm4gMDsKKworCWlmICghaW9ydF9ub2RlLT5tYXBwaW5nX29mZnNldCB8fCAhbWFw
X2NvdW50KSB7CisJCXByX2VycihGV19CVUcgIkludmFsaWQgSUQgbWFwcGluZywgc2tpcHBpbmcg
Uk1SIG5vZGUgJXBcbiIsCisJCSAgICAgICBpb3J0X25vZGUpOworCQlyZXR1cm4gLUVJTlZBTDsK
Kwl9CisKKwlybXJfaWRzID0ga21hbGxvYyhzaXplb2YoKnJtcl9pZHMpICogbWFwX2NvdW50LCBH
RlBfS0VSTkVMKTsKKwlpZiAoIXJtcl9pZHMpCisJCXJldHVybiAtRU5PTUVNOworCisJLyogUmV0
cmlldmUgYXNzb2NpYXRlZCBzbW11IGFuZCBzdHJlYW0gaWQgKi8KKwlpZHMgPSBybXJfaWRzOwor
CWZvciAoaSA9IDA7IGkgPCBtYXBfY291bnQ7IGkrKywgaWRzKyspIHsKKwkJaWRzLT5zbW11ID0g
aW9ydF9ub2RlX2dldF9pZChpb3J0X25vZGUsICZpZHMtPnNpZCwgaSk7CisJCWlmICghaWRzLT5z
bW11KSB7CisJCQlwcl9lcnIoRldfQlVHICJJbnZhbGlkIFNNTVUgcmVmZXJlbmNlLCBza2lwcGlu
ZyBSTVIgbm9kZSAlcFxuIiwKKwkJCSAgICAgICBpb3J0X25vZGUpOworCQkJcmV0ID0gLUVJTlZB
TDsKKwkJCWdvdG8gb3V0OworCQl9CisJfQorCisJLyogUmV0cmlldmUgUk1SIGRhdGEgKi8KKwly
bXIgPSAoc3RydWN0IGFjcGlfaW9ydF9ybXIgKilpb3J0X25vZGUtPm5vZGVfZGF0YTsKKwlpZiAo
IXJtci0+cm1yX29mZnNldCB8fCAhcm1yLT5ybXJfY291bnQpIHsKKwkJcHJfZXJyKEZXX0JVRyAi
SW52YWxpZCBSTVIgZGVzY3JpcHRvciBhcnJheSwgc2tpcHBpbmcgUk1SIG5vZGUgJXBcbiIsCisJ
CSAgICAgICBpb3J0X25vZGUpOworCQlyZXQgPSAtRUlOVkFMOworCQlnb3RvIG91dDsKKwl9CisK
KwlybXJfZGVzYyA9IEFDUElfQUREX1BUUihzdHJ1Y3QgYWNwaV9pb3J0X3Jtcl9kZXNjLCBpb3J0
X25vZGUsCisJCQkJcm1yLT5ybXJfb2Zmc2V0KTsKKworCWZvciAoaSA9IDA7IGkgPCBybXItPnJt
cl9jb3VudDsgaSsrLCBybXJfZGVzYysrKSB7CisJCXJldCA9IGlvcnRfcm1yX2Rlc2NfdmFsaWQo
cm1yX2Rlc2MpOworCQlpZiAocmV0KSB7CisJCQlwcl9lcnIoRldfQlVHICJJbnZhbGlkIFJNUiBk
ZXNjcmlwdG9yWyVkXSBmb3Igbm9kZSAlcCwgc2tpcHBpbmcuLi5cbiIsCisJCQkgICAgICAgaSwg
aW9ydF9ub2RlKTsKKwkJCWdvdG8gb3V0OworCQl9CisKKwkJZSA9IGttYWxsb2Moc2l6ZW9mKCpl
KSwgR0ZQX0tFUk5FTCk7CisJCWlmICghZSkgeworCQkJcmV0ID0gLUVOT01FTTsKKwkJCWdvdG8g
b3V0OworCQl9CisKKwkJZS0+cm1yX2lkc19udW0gPSBtYXBfY291bnQ7CisJCWUtPnJtcl9pZHMg
PSBybXJfaWRzOworCQllLT5ybXJfZGVzYyA9IHJtcl9kZXNjOworCisJCWxpc3RfYWRkX3RhaWwo
JmUtPmxpc3QsICZpb3J0X3Jtcl9saXN0KTsKKwkJZGVzY19jb3VudCsrOworCX0KKworCXJldHVy
biAwOworCitvdXQ6CisJaWYgKCFkZXNjX2NvdW50KQorCQlrZnJlZShybXJfaWRzKTsKKwlyZXR1
cm4gcmV0OworfQogCiBzdGF0aWMgdm9pZCBfX2luaXQgaW9ydF9pbml0X3BsYXRmb3JtX2Rldmlj
ZXModm9pZCkKIHsKQEAgLTE2NzYsNiArMTc5Myw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpb3J0
X2luaXRfcGxhdGZvcm1fZGV2aWNlcyh2b2lkKQogCiAJCWlvcnRfZW5hYmxlX2Fjcyhpb3J0X25v
ZGUpOwogCisJCWlmIChpb3J0X3RhYmxlLT5yZXZpc2lvbiA9PSAxKQorCQkJaW9ydF9wYXJzZV9y
bXIoaW9ydF9ub2RlKTsKKwogCQlvcHMgPSBpb3J0X2dldF9kZXZfY2ZnKGlvcnRfbm9kZSk7CiAJ
CWlmIChvcHMpIHsKIAkJCWZ3bm9kZSA9IGFjcGlfYWxsb2NfZndub2RlX3N0YXRpYygpOwotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
b21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
