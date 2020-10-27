Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C9229AA8E
	for <lists.iommu@lfdr.de>; Tue, 27 Oct 2020 12:28:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8FD9886693;
	Tue, 27 Oct 2020 11:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPr2RLL9rsKl; Tue, 27 Oct 2020 11:28:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C62E5866AF;
	Tue, 27 Oct 2020 11:28:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADB38C0051;
	Tue, 27 Oct 2020 11:28:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1853C0051
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 11:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC60985045
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 11:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id duLsFlbAKZja for <iommu@lists.linux-foundation.org>;
 Tue, 27 Oct 2020 11:28:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B05AF84FD5
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 11:28:09 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CL8Zz4nPpzhcP9;
 Tue, 27 Oct 2020 19:28:11 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.24.15) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 27 Oct 2020 19:27:59 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <devel@acpica.org>
Subject: [RFC PATCH 2/4] ACPI/IORT: Add support for RMR node parsing
Date: Tue, 27 Oct 2020 11:26:44 +0000
Message-ID: <20201027112646.44680-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20201027112646.44680-1-shameerali.kolothum.thodi@huawei.com>
References: <20201027112646.44680-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.24.15]
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, guohanjun@huawei.com, robin.murphy@arm.com,
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

QWRkIHN1cHBvcnQgZm9yIHBhcnNpbmcgUk1SIG5vZGUgaW5mb3JtYXRpb24gZnJvbSBBQ1BJLgpG
aW5kIGFzc29jaWF0ZWQgc3RyZWFtIGlkcyBhbmQgc21tdSBub2RlwqBpbmZvIGZyb20gdGhlClJN
UiBub2RlIGFuZCBwb3B1bGF0ZSBhIGxpbmtlZCBsaXN0IHdpdGggUk1SIG1lbW9yeQpkZXNjcmlw
dG9ycy4KClNpZ25lZC1vZmYtYnk6IFNoYW1lZXIgS29sb3RodW0gPHNoYW1lZXJhbGkua29sb3Ro
dW0udGhvZGlAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2FjcGkvYXJtNjQvaW9ydC5jIHwgMTE5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Fj
cGkvYXJtNjQvaW9ydC5jIGIvZHJpdmVycy9hY3BpL2FybTY0L2lvcnQuYwppbmRleCA5OTI5ZmY1
MGMwYzAuLmIzMmNkNTNjY2EwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9hY3BpL2FybTY0L2lvcnQu
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
dHB1dF9iYXNlOwogCQkJcmV0dXJuIHBhcmVudDsKIAkJfQpAQCAtMTY0Nyw2ICsxNjY3LDEwMCBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgaW9ydF9lbmFibGVfYWNzKHN0cnVjdCBhY3BpX2lvcnRfbm9k
ZSAqaW9ydF9ub2RlKQogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgdm9pZCBpb3J0X2VuYWJsZV9hY3Mo
c3RydWN0IGFjcGlfaW9ydF9ub2RlICppb3J0X25vZGUpIHsgfQogI2VuZGlmCitzdGF0aWMgaW50
IGlvcnRfcm1yX2Rlc2NfdmFsaWQoc3RydWN0IGFjcGlfaW9ydF9ybXJfZGVzYyAqZGVzYykKK3sK
KwlzdHJ1Y3QgaW9ydF9ybXJfZW50cnkgKmU7CisJdTY0IGVuZCwgc3RhcnQgPSBkZXNjLT5iYXNl
X2FkZHJlc3MsIGxlbmd0aCA9IGRlc2MtPmxlbmd0aDsKKworCWlmICgoIUlTX0FMSUdORUQoc3Rh
cnQsIFNaXzY0SykpIHx8IChsZW5ndGggJSBTWl82NEsgIT0gMCkpCisJCXJldHVybiAtRUlOVkFM
OworCisJZW5kID0gc3RhcnQgKyBsZW5ndGggLSAxOworCisJLyogQ2hlY2sgZm9yIGFkZHJlc3Mg
b3ZlcmxhcCAqLworCWxpc3RfZm9yX2VhY2hfZW50cnkoZSwgJmlvcnRfcm1yX2xpc3QsIGxpc3Qp
IHsKKwkJdTY0IGVfc3RhcnQgPSBlLT5ybXJfZGVzYy0+YmFzZV9hZGRyZXNzOworCQl1NjQgZV9l
bmQgPSBlX3N0YXJ0ICsgZS0+cm1yX2Rlc2MtPmxlbmd0aCAtIDE7CisKKwkJaWYgKHN0YXJ0IDw9
IGVfZW5kICYmIGVuZCA+PSBlX3N0YXJ0KQorCQkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0
dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgX19pbml0IGlvcnRfcGFyc2Vfcm1yKHN0cnVjdCBhY3Bp
X2lvcnRfbm9kZSAqaW9ydF9ub2RlKQoreworCXN0cnVjdCBpb3J0X3Jtcl9pZCAqcm1yX2lkcywg
KmlkczsKKwlzdHJ1Y3QgaW9ydF9ybXJfZW50cnkgKmU7CisJc3RydWN0IGFjcGlfaW9ydF9ybXIg
KnJtcjsKKwlzdHJ1Y3QgYWNwaV9pb3J0X3Jtcl9kZXNjICpybXJfZGVzYzsKKwl1MzIgbWFwX2Nv
dW50ID0gaW9ydF9ub2RlLT5tYXBwaW5nX2NvdW50OworCWludCBpLCByZXQgPSAwLCBkZXNjX2Nv
dW50ID0gMDsKKworCWlmIChpb3J0X25vZGUtPnR5cGUgIT0gQUNQSV9JT1JUX05PREVfUk1SKQor
CQlyZXR1cm4gMDsKKworCWlmICghaW9ydF9ub2RlLT5tYXBwaW5nX29mZnNldCB8fCAhbWFwX2Nv
dW50KSB7CisJCXByX2VycihGV19CVUcgIkludmFsaWQgSUQgbWFwcGluZywgc2tpcHBpbmcgUk1S
IG5vZGUgJXBcbiIsCisJCSAgICAgICBpb3J0X25vZGUpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9
CisKKwlybXJfaWRzID0ga21hbGxvYyhzaXplb2YoKnJtcl9pZHMpICogbWFwX2NvdW50LCBHRlBf
S0VSTkVMKTsKKwlpZiAoIXJtcl9pZHMpCisJCXJldHVybiAtRU5PTUVNOworCisJLyogUmV0cmll
dmUgYXNzb2NpYXRlZCBzbW11IGFuZCBzdHJlYW0gaWQgKi8KKwlpZHMgPSBybXJfaWRzOworCWZv
ciAoaSA9IDA7IGkgPCBtYXBfY291bnQ7IGkrKywgaWRzKyspIHsKKwkJaWRzLT5zbW11ID0gaW9y
dF9ub2RlX2dldF9pZChpb3J0X25vZGUsICZpZHMtPnNpZCwgaSk7CisJCWlmICghaWRzLT5zbW11
KSB7CisJCQlwcl9lcnIoRldfQlVHICJJbnZhbGlkIFNNTVUgcmVmZXJlbmNlLCBza2lwcGluZyBS
TVIgbm9kZSAlcFxuIiwKKwkJCSAgICAgICBpb3J0X25vZGUpOworCQkJcmV0ID0gLUVJTlZBTDsK
KwkJCWdvdG8gb3V0OworCQl9CisJfQorCisJLyogUmV0cmlldmUgUk1SIGRhdGEgKi8KKwlybXIg
PSAoc3RydWN0IGFjcGlfaW9ydF9ybXIgKilpb3J0X25vZGUtPm5vZGVfZGF0YTsKKwlpZiAoIXJt
ci0+cm1yX29mZnNldCB8fCAhcm1yLT5ybXJfY291bnQpIHsKKwkJcHJfZXJyKEZXX0JVRyAiSW52
YWxpZCBSTVIgZGVzY3JpcHRvciBhcnJheSwgc2tpcHBpbmcgUk1SIG5vZGUgJXBcbiIsCisJCSAg
ICAgICBpb3J0X25vZGUpOworCQlyZXQgPSAtRUlOVkFMOworCQlnb3RvIG91dDsKKwl9CisKKwly
bXJfZGVzYyA9IEFDUElfQUREX1BUUihzdHJ1Y3QgYWNwaV9pb3J0X3Jtcl9kZXNjLCBpb3J0X25v
ZGUsCisJCQkJcm1yLT5ybXJfb2Zmc2V0KTsKKworCWZvciAoaSA9IDA7IGkgPCBybXItPnJtcl9j
b3VudDsgaSsrLCBybXJfZGVzYysrKSB7CisJCXJldCA9IGlvcnRfcm1yX2Rlc2NfdmFsaWQocm1y
X2Rlc2MpOworCQlpZiAocmV0KSB7CisJCQlwcl9lcnIoRldfQlVHICJJbnZhbGlkIFJNUiBkZXNj
cmlwdG9yWyVkXSBmb3Igbm9kZSAlcCwgc2tpcHBpbmcuLi5cbiIsCisJCQkgICAgICAgaSwgaW9y
dF9ub2RlKTsKKwkJCWdvdG8gb3V0OworCQl9CisKKwkJZSA9IGttYWxsb2Moc2l6ZW9mKCplKSwg
R0ZQX0tFUk5FTCk7CisJCWlmICghZSkKKwkJCWdvdG8gb3V0OworCQllLT5ybXJfaWRzX251bSA9
IG1hcF9jb3VudDsKKwkJZS0+cm1yX2lkcyA9IHJtcl9pZHM7CisJCWUtPnJtcl9kZXNjID0gcm1y
X2Rlc2M7CisKKwkJbGlzdF9hZGRfdGFpbCgmZS0+bGlzdCwgJmlvcnRfcm1yX2xpc3QpOworCQlk
ZXNjX2NvdW50Kys7CisJfQorCisJcmV0dXJuIDA7CisKK291dDoKKwlpZiAoIWRlc2NfY291bnQp
CisJCWtmcmVlKHJtcl9pZHMpOworCXJldHVybiByZXQ7Cit9CiAKIHN0YXRpYyB2b2lkIF9faW5p
dCBpb3J0X2luaXRfcGxhdGZvcm1fZGV2aWNlcyh2b2lkKQogewpAQCAtMTY3Niw2ICsxNzkwLDkg
QEAgc3RhdGljIHZvaWQgX19pbml0IGlvcnRfaW5pdF9wbGF0Zm9ybV9kZXZpY2VzKHZvaWQpCiAK
IAkJaW9ydF9lbmFibGVfYWNzKGlvcnRfbm9kZSk7CiAKKwkJaWYgKGlvcnRfdGFibGUtPnJldmlz
aW9uID09IDEpCisJCQlpb3J0X3BhcnNlX3Jtcihpb3J0X25vZGUpOworCiAJCW9wcyA9IGlvcnRf
Z2V0X2Rldl9jZmcoaW9ydF9ub2RlKTsKIAkJaWYgKG9wcykgewogCQkJZndub2RlID0gYWNwaV9h
bGxvY19md25vZGVfc3RhdGljKCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9pb21tdQ==
