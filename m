Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 664432E1DCD
	for <lists.iommu@lfdr.de>; Wed, 23 Dec 2020 16:14:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DF92F2E06F;
	Wed, 23 Dec 2020 15:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcG63yjQwqYb; Wed, 23 Dec 2020 15:14:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E5FF22DEC9;
	Wed, 23 Dec 2020 15:14:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBF37C0893;
	Wed, 23 Dec 2020 15:14:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C4BEC0893
 for <iommu@lists.linux-foundation.org>; Wed, 23 Dec 2020 15:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 48C0C85821
 for <iommu@lists.linux-foundation.org>; Wed, 23 Dec 2020 15:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9F3WW4lHmtV for <iommu@lists.linux-foundation.org>;
 Wed, 23 Dec 2020 15:14:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0D70985184
 for <iommu@lists.linux-foundation.org>; Wed, 23 Dec 2020 15:14:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608736490; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SDlIibi7+8gDgWtsKot5qJpuZhnMzbyPpIrVHWi2a5s=;
 b=WPgkx2IcUou9VomtuUiDwLOOZGLxvCzVsps40xq9VFcZFvfeArGYR1Krr/EMXHghzUT9CXHx
 XA/oZyHSf86ZBHmn+ZU1NNufSMomWeDRRn4/jfTTivxTesVmmmQlSRtZEFy40lDnIGJZFPNf
 c4ctSkLphZJ5gDdvvdr4DAeGpoA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fe35ededa47198188b3ee20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 15:14:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6CD9EC433C6; Wed, 23 Dec 2020 15:14:38 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1FB90C433CA;
 Wed, 23 Dec 2020 15:14:36 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 23 Dec 2020 07:14:36 -0800
From: isaacm@codeaurora.org
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/7] iommu/io-pgtable: Introduce dynamic io-pgtable fmt
 registration
In-Reply-To: <64657a85-e2d5-e13f-d6b5-9d68c4142b80@arm.com>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-2-git-send-email-isaacm@codeaurora.org>
 <4f388512-c3df-e9fc-ebd4-624ab36a6858@arm.com>
 <8b48b371811a170053e2ca810ab63abf@codeaurora.org>
 <64657a85-e2d5-e13f-d6b5-9d68c4142b80@arm.com>
Message-ID: <69cfff0e339985a8c344533573471bf4@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: freedreno@lists.freedesktop.org, kernel-team@android.com,
 pdaly@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, pratikp@codeaurora.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gMjAyMC0xMi0yMyAwNTo0NCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjAtMTItMjIg
MTk6NTQsIGlzYWFjbUBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPj4gT24gMjAyMC0xMi0yMiAxMToy
NywgUm9iaW4gTXVycGh5IHdyb3RlOgo+Pj4gT24gMjAyMC0xMi0yMiAwMDo0NCwgSXNhYWMgSi4g
TWFuamFycmVzIHdyb3RlOgo+Pj4+IFRoZSBpby1wZ3RhYmxlIGNvZGUgY29uc3RydWN0cyBhbiBh
cnJheSBvZiBpbml0IGZ1bmN0aW9ucyBmb3IgZWFjaAo+Pj4+IHBhZ2UgdGFibGUgZm9ybWF0IGF0
IGNvbXBpbGUgdGltZS4gVGhpcyBpcyBub3QgaWRlYWwsIGFzIHRoaXMKPj4+PiBpbmNyZWFzZXMg
dGhlIGZvb3RwcmludCBvZiB0aGUgaW8tcGd0YWJsZSBjb2RlLCBhcyB3ZWxsIGFzIHByZXZlbnRz
Cj4+Pj4gaW8tcGd0YWJsZSBmb3JtYXRzIGZyb20gYmVpbmcgYnVpbHQgYXMga2VybmVsIG1vZHVs
ZXMuCj4+Pj4gCj4+Pj4gSW4gcHJlcGFyYXRpb24gZm9yIG1vZHVsYXJpemluZyB0aGUgaW8tcGd0
YWJsZSBmb3JtYXRzLCBzd2l0Y2ggdG8gYQo+Pj4+IGR5bmFtaWMgcmVnaXN0cmF0aW9uIHNjaGVt
ZSwgd2hlcmUgZWFjaCBpby1wZ3RhYmxlIGZvcm1hdCBjYW4gCj4+Pj4gcmVnaXN0ZXIKPj4+PiB0
aGVpciBpbml0IGZ1bmN0aW9ucyB3aXRoIHRoZSBpby1wZ3RhYmxlIGNvZGUgYXQgYm9vdCBvciBt
b2R1bGUKPj4+PiBpbnNlcnRpb24gdGltZS4KPj4+PiAKPj4+PiBTaWduZWQtb2ZmLWJ5OiBJc2Fh
YyBKLiBNYW5qYXJyZXMgPGlzYWFjbUBjb2RlYXVyb3JhLm9yZz4KPj4+PiAtLS0KPj4+PiDCoCBk
cml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLXY3cy5jIHwgMzQgKysrKysrKysrKysrKy0KPj4+
PiDCoCBkcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLmPCoMKgwqDCoCB8IDkwIAo+Pj4+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+Pj4+IMKgIGRyaXZlcnMvaW9tbXUv
aW8tcGd0YWJsZS5jwqDCoMKgwqDCoMKgwqDCoCB8IDk0IAo+Pj4+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tCj4+Pj4gwqAgaW5jbHVkZS9saW51eC9pby1wZ3RhYmxlLmjC
oMKgwqDCoMKgwqDCoMKgIHwgNTEgKysrKysrKysrKysrKy0tLS0tLS0tCj4+Pj4gwqAgNCBmaWxl
cyBjaGFuZ2VkLCAyMDkgaW5zZXJ0aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pCj4+Pj4gCj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0tdjdzLmMgCj4+Pj4gYi9k
cml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLXY3cy5jCj4+Pj4gaW5kZXggMWQ5MmFjOS4uODlh
YWQyZiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLXY3cy5j
Cj4+Pj4gKysrIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS12N3MuYwo+Pj4+IEBAIC0y
OCw2ICsyOCw3IEBACj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+Cj4+Pj4gwqAgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9rbWVtbGVhay5o
Pgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4
L3NpemVzLmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPj4+PiDCoCAjaW5jbHVk
ZSA8bGludXgvc3BpbmxvY2suaD4KPj4+PiBAQCAtODM1LDcgKzgzNiw4IEBAIHN0YXRpYyBzdHJ1
Y3QgaW9fcGd0YWJsZSAKPj4+PiAqYXJtX3Y3c19hbGxvY19wZ3RhYmxlKHN0cnVjdCBpb19wZ3Rh
YmxlX2NmZyAqY2ZnLAo+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+Pj4gwqAgfQo+Pj4+
IMKgIC1zdHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2ZucyBpb19wZ3RhYmxlX2FybV92N3NfaW5pdF9m
bnMgPSB7Cj4+Pj4gK3N0YXRpYyBzdHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2ZucyBpb19wZ3RhYmxl
X2FybV92N3NfaW5pdF9mbnMgPSB7Cj4+Pj4gK8KgwqDCoCAuZm10wqDCoMKgID0gQVJNX1Y3UywK
Pj4+PiDCoMKgwqDCoMKgIC5hbGxvY8KgwqDCoCA9IGFybV92N3NfYWxsb2NfcGd0YWJsZSwKPj4+
PiDCoMKgwqDCoMKgIC5mcmVlwqDCoMKgID0gYXJtX3Y3c19mcmVlX3BndGFibGUsCj4+Pj4gwqAg
fTsKPj4+PiBAQCAtOTgyLDUgKzk4NCwzMyBAQCBzdGF0aWMgaW50IF9faW5pdCBhcm1fdjdzX2Rv
X3NlbGZ0ZXN0cyh2b2lkKQo+Pj4+IMKgwqDCoMKgwqAgcHJfaW5mbygic2VsZiB0ZXN0IG9rXG4i
KTsKPj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+IMKgIH0KPj4+PiAtc3Vic3lzX2luaXRj
YWxsKGFybV92N3NfZG9fc2VsZnRlc3RzKTsKPj4+PiArI2Vsc2UKPj4+PiArc3RhdGljIGludCBh
cm1fdjdzX2RvX3NlbGZ0ZXN0cyh2b2lkKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCByZXR1cm4gMDsK
Pj4+PiArfQo+Pj4+IMKgICNlbmRpZgo+Pj4+ICsKPj4+PiArc3RhdGljIGludCBfX2luaXQgYXJt
X3Y3c19pbml0KHZvaWQpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIGludCByZXQ7Cj4+Pj4gKwo+Pj4+
ICvCoMKgwqAgcmV0ID0gaW9fcGd0YWJsZV9vcHNfcmVnaXN0ZXIoJmlvX3BndGFibGVfYXJtX3Y3
c19pbml0X2Zucyk7Cj4+Pj4gK8KgwqDCoCBpZiAocmV0IDwgMCkgewo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBwcl9lcnIoIkZhaWxlZCB0byByZWdpc3RlciBBUk0gVjdTIGZvcm1hdFxuIik7Cj4+PiAK
Pj4+IFN1cGVyLW5pdDogSSB0aGluayAidjdzIiBzaG91bGQgcHJvYmFibHkgYmUgbG93ZXJjYXNl
IHRoZXJlLiBBbHNvCj4+PiBnZW5lcmFsIGNvbnNpc3RlbmN5IFdSVCB0byBzaG93aW5nIHRoZSBl
cnJvciBjb2RlIGFuZCB3aGV0aGVyIG9yIG5vdAo+Pj4gdG8gYWJicmV2aWF0ZSAiZm9ybWF0IiB3
b3VsZCBiZSBuaWNlLgo+Pj4gCj4+IE9rLCBJIGNhbiBmaXggdGhpcyBhY2NvcmRpbmdseS4KPj4g
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+
Pj4+ICvCoMKgwqAgcmV0ID0gYXJtX3Y3c19kb19zZWxmdGVzdHMoKTsKPj4+PiArwqDCoMKgIGlm
IChyZXQgPCAwKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpb19wZ3RhYmxlX29wc191bnJlZ2lzdGVy
KCZpb19wZ3RhYmxlX2FybV92N3NfaW5pdF9mbnMpOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHJldHVy
biByZXQ7Cj4+Pj4gK30KPj4+PiArY29yZV9pbml0Y2FsbChhcm1fdjdzX2luaXQpOwo+Pj4+ICsK
Pj4+PiArc3RhdGljIHZvaWQgX19leGl0IGFybV92N3NfZXhpdCh2b2lkKQo+Pj4+ICt7Cj4+Pj4g
K8KgwqDCoCBpb19wZ3RhYmxlX29wc191bnJlZ2lzdGVyKCZpb19wZ3RhYmxlX2FybV92N3NfaW5p
dF9mbnMpOwo+Pj4+ICt9Cj4+Pj4gK21vZHVsZV9leGl0KGFybV92N3NfZXhpdCk7Cj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0uYyAKPj4+PiBiL2RyaXZlcnMv
aW9tbXUvaW8tcGd0YWJsZS1hcm0uYwo+Pj4+IGluZGV4IDg3ZGVmNTguLmZmMGVhMmYgMTAwNjQ0
Cj4+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+Pj4gKysrIGIvZHJp
dmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+Pj4gQEAgLTEzLDYgKzEzLDcgQEAKPj4+PiDC
oCAjaW5jbHVkZSA8bGludXgvYml0b3BzLmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2lvLXBn
dGFibGUuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+Pj4gKyNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KPj4+PiDC
oCAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC90eXBlcy5o
Pgo+Pj4+IEBAIC0xMDQzLDI5ICsxMDQ0LDMyIEBAIGFybV9tYWxpX2xwYWVfYWxsb2NfcGd0YWJs
ZShzdHJ1Y3QgCj4+Pj4gaW9fcGd0YWJsZV9jZmcgKmNmZywgdm9pZCAqY29va2llKQo+Pj4+IMKg
wqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+Pj4gwqAgfQo+Pj4+IMKgIC1zdHJ1Y3QgaW9fcGd0YWJs
ZV9pbml0X2ZucyBpb19wZ3RhYmxlX2FybV82NF9scGFlX3MxX2luaXRfZm5zID0gewo+Pj4+IC3C
oMKgwqAgLmFsbG9jwqDCoMKgID0gYXJtXzY0X2xwYWVfYWxsb2NfcGd0YWJsZV9zMSwKPj4+PiAt
wqDCoMKgIC5mcmVlwqDCoMKgID0gYXJtX2xwYWVfZnJlZV9wZ3RhYmxlLAo+Pj4+IC19Owo+Pj4+
IC0KPj4+PiAtc3RydWN0IGlvX3BndGFibGVfaW5pdF9mbnMgaW9fcGd0YWJsZV9hcm1fNjRfbHBh
ZV9zMl9pbml0X2ZucyA9IHsKPj4+PiAtwqDCoMKgIC5hbGxvY8KgwqDCoCA9IGFybV82NF9scGFl
X2FsbG9jX3BndGFibGVfczIsCj4+Pj4gLcKgwqDCoCAuZnJlZcKgwqDCoCA9IGFybV9scGFlX2Zy
ZWVfcGd0YWJsZSwKPj4+PiAtfTsKPj4+PiAtCj4+Pj4gLXN0cnVjdCBpb19wZ3RhYmxlX2luaXRf
Zm5zIGlvX3BndGFibGVfYXJtXzMyX2xwYWVfczFfaW5pdF9mbnMgPSB7Cj4+Pj4gLcKgwqDCoCAu
YWxsb2PCoMKgwqAgPSBhcm1fMzJfbHBhZV9hbGxvY19wZ3RhYmxlX3MxLAo+Pj4+IC3CoMKgwqAg
LmZyZWXCoMKgwqAgPSBhcm1fbHBhZV9mcmVlX3BndGFibGUsCj4+Pj4gLX07Cj4+Pj4gLQo+Pj4+
IC1zdHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2ZucyBpb19wZ3RhYmxlX2FybV8zMl9scGFlX3MyX2lu
aXRfZm5zID0gewo+Pj4+IC3CoMKgwqAgLmFsbG9jwqDCoMKgID0gYXJtXzMyX2xwYWVfYWxsb2Nf
cGd0YWJsZV9zMiwKPj4+PiAtwqDCoMKgIC5mcmVlwqDCoMKgID0gYXJtX2xwYWVfZnJlZV9wZ3Rh
YmxlLAo+Pj4+IC19Owo+Pj4+IC0KPj4+PiAtc3RydWN0IGlvX3BndGFibGVfaW5pdF9mbnMgaW9f
cGd0YWJsZV9hcm1fbWFsaV9scGFlX2luaXRfZm5zID0gewo+Pj4+IC3CoMKgwqAgLmFsbG9jwqDC
oMKgID0gYXJtX21hbGlfbHBhZV9hbGxvY19wZ3RhYmxlLAo+Pj4+IC3CoMKgwqAgLmZyZWXCoMKg
wqAgPSBhcm1fbHBhZV9mcmVlX3BndGFibGUsCj4+Pj4gK3N0YXRpYyBzdHJ1Y3QgaW9fcGd0YWJs
ZV9pbml0X2ZucyBpb19wZ3RhYmxlX2FybV9scGFlX2luaXRfZm5zW10gPSAKPj4+PiB7Cj4+Pj4g
K8KgwqDCoCB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mbXTCoMKgwqAgPSBBUk1fMzJfTFBBRV9T
MSwKPj4+PiArwqDCoMKgwqDCoMKgwqAgLmFsbG9jwqDCoMKgID0gYXJtXzMyX2xwYWVfYWxsb2Nf
cGd0YWJsZV9zMSwKPj4+PiArwqDCoMKgwqDCoMKgwqAgLmZyZWXCoMKgwqAgPSBhcm1fbHBhZV9m
cmVlX3BndGFibGUsCj4+Pj4gK8KgwqDCoCB9LAo+Pj4+ICvCoMKgwqAgewo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCAuZm10wqDCoMKgID0gQVJNXzMyX0xQQUVfUzIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IC5hbGxvY8KgwqDCoCA9IGFybV8zMl9scGFlX2FsbG9jX3BndGFibGVfczIsCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIC5mcmVlwqDCoMKgID0gYXJtX2xwYWVfZnJlZV9wZ3RhYmxlLAo+Pj4+ICvCoMKg
wqAgfSwKPj4+PiArwqDCoMKgIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgLmZtdMKgwqDCoCA9IEFS
TV82NF9MUEFFX1MxLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuYWxsb2PCoMKgwqAgPSBhcm1fNjRf
bHBhZV9hbGxvY19wZ3RhYmxlX3MxLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZnJlZcKgwqDCoCA9
IGFybV9scGFlX2ZyZWVfcGd0YWJsZSwKPj4+PiArwqDCoMKgIH0sCj4+Pj4gK8KgwqDCoCB7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC5mbXTCoMKgwqAgPSBBUk1fNjRfTFBBRV9TMiwKPj4+PiArwqDC
oMKgwqDCoMKgwqAgLmFsbG9jwqDCoMKgID0gYXJtXzY0X2xwYWVfYWxsb2NfcGd0YWJsZV9zMiwK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZyZWXCoMKgwqAgPSBhcm1fbHBhZV9mcmVlX3BndGFibGUs
Cj4+Pj4gK8KgwqDCoCB9LAo+Pj4+ICvCoMKgwqAgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZm10
wqDCoMKgID0gQVJNX01BTElfTFBBRSwKPj4+PiArwqDCoMKgwqDCoMKgwqAgLmFsbG9jwqDCoMKg
ID0gYXJtX21hbGlfbHBhZV9hbGxvY19wZ3RhYmxlLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZnJl
ZcKgwqDCoCA9IGFybV9scGFlX2ZyZWVfcGd0YWJsZSwKPj4+PiArwqDCoMKgIH0sCj4+Pj4gwqAg
fTsKPj4+PiDCoMKgwqAgI2lmZGVmIENPTkZJR19JT01NVV9JT19QR1RBQkxFX0xQQUVfU0VMRlRF
U1QKPj4+PiBAQCAtMTI1MCw1ICsxMjU0LDQzIEBAIHN0YXRpYyBpbnQgX19pbml0IGFybV9scGFl
X2RvX3NlbGZ0ZXN0cyh2b2lkKQo+Pj4+IMKgwqDCoMKgwqAgcHJfaW5mbygic2VsZnRlc3Q6IGNv
bXBsZXRlZCB3aXRoICVkIFBBU1MgJWQgRkFJTFxuIiwgcGFzcywgCj4+Pj4gZmFpbCk7Cj4+Pj4g
wqDCoMKgwqDCoCByZXR1cm4gZmFpbCA/IC1FRkFVTFQgOiAwOwo+Pj4+IMKgIH0KPj4+PiAtc3Vi
c3lzX2luaXRjYWxsKGFybV9scGFlX2RvX3NlbGZ0ZXN0cyk7Cj4+Pj4gKyNlbHNlCj4+Pj4gK3N0
YXRpYyBpbnQgX19pbml0IGFybV9scGFlX2RvX3NlbGZ0ZXN0cyh2b2lkKQo+Pj4+ICt7Cj4+Pj4g
K8KgwqDCoCByZXR1cm4gMDsKPj4+PiArfQo+Pj4+IMKgICNlbmRpZgo+Pj4+ICsKPj4+PiArc3Rh
dGljIGludCBfX2luaXQgYXJtX2xwYWVfaW5pdCh2b2lkKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBp
bnQgcmV0LCBpOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KGlvX3BndGFibGVfYXJtX2xwYWVfaW5pdF9mbnMpOyBpKyspIAo+Pj4+IHsKPj4+PiArwqDCoMKg
wqDCoMKgwqAgcmV0ID0gCj4+Pj4gaW9fcGd0YWJsZV9vcHNfcmVnaXN0ZXIoJmlvX3BndGFibGVf
YXJtX2xwYWVfaW5pdF9mbnNbaV0pOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkg
ewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiRmFpbGVkIHRvIHJlZ2lzdGVy
IEFSTSBMUEFFIGZtdDogJWRcbiIpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
ZXJyX2lvX3BndGFibGVfcmVnaXN0ZXI7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+PiArwqDC
oMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoCByZXQgPSBhcm1fbHBhZV9kb19zZWxmdGVzdHMoKTsK
Pj4+PiArwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9p
b19wZ3RhYmxlX3JlZ2lzdGVyOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHJldHVybiAwOwo+Pj4+ICsK
Pj4+PiArZXJyX2lvX3BndGFibGVfcmVnaXN0ZXI6Cj4+Pj4gK8KgwqDCoCBmb3IgKGkgPSBpIC0g
MTsgaSA+PSAwOyBpLS0pCj4+PiAKPj4+IFBlcnNvbmFsbHkgSSBmaW5kICJ3aGlsZSAoaS0tKSIg
YSBiaXQgY2xlYXJlciBmb3IgdGhpcyBraW5kIG9mCj4+PiB1bndpbmRpbmcsIGJ1dCBtYXliZSBw
b3N0LWRlY3JlbWVudCBpc24ndCB0byBldmVyeW9uZSdzIHRhc3RlLgo+Pj4gCj4+IEknbSBub3Qg
cGFydGljdWxhcmx5IGF0dGFjaGVkIHRvIHRoZSBjdXJyZW50IGFwcHJvYWNoLCBzbyBhIHdoaWxl
IGxvb3AKPj4gaXMgb2theSB3aXRoIG1lIDopLgo+PiAKPj4+PiArwqDCoMKgwqDCoMKgwqAgCj4+
Pj4gaW9fcGd0YWJsZV9vcHNfdW5yZWdpc3RlcigmaW9fcGd0YWJsZV9hcm1fbHBhZV9pbml0X2Zu
c1tpXSk7Cj4+Pj4gK8KgwqDCoCByZXR1cm4gcmV0Owo+Pj4+ICt9Cj4+Pj4gK2NvcmVfaW5pdGNh
bGwoYXJtX2xwYWVfaW5pdCk7Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgdm9pZCBfX2V4aXQgYXJtX2xw
YWVfZXhpdCh2b2lkKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+PiArCj4+Pj4gK8Kg
wqDCoCBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShpb19wZ3RhYmxlX2FybV9scGFlX2luaXRf
Zm5zKTsgaSsrKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAKPj4+PiBpb19wZ3RhYmxlX29wc191bnJl
Z2lzdGVyKCZpb19wZ3RhYmxlX2FybV9scGFlX2luaXRfZm5zW2ldKTsKPj4+PiArfQo+Pj4+ICtt
b2R1bGVfZXhpdChhcm1fbHBhZV9leGl0KTsKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21t
dS9pby1wZ3RhYmxlLmMgYi9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUuYwo+Pj4+IGluZGV4IDk0
Mzk0YzguLjJjNmViMmUgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxl
LmMKPj4+PiArKysgYi9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUuYwo+Pj4+IEBAIC0xMCwzMyAr
MTAsNDUgQEAKPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvYnVnLmg+Cj4+Pj4gwqAgI2luY2x1ZGUg
PGxpbnV4L2lvLXBndGFibGUuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+
Pj4gKyNpbmNsdWRlIDxsaW51eC9yd2xvY2suaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+PiDCoCAtc3RhdGljIGNvbnN0
IHN0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zICoKPj4+PiAtaW9fcGd0YWJsZV9pbml0X3RhYmxl
W0lPX1BHVEFCTEVfTlVNX0ZNVFNdID0gewo+Pj4+IC0jaWZkZWYgQ09ORklHX0lPTU1VX0lPX1BH
VEFCTEVfTFBBRQo+Pj4+IC3CoMKgwqAgW0FSTV8zMl9MUEFFX1MxXSA9ICZpb19wZ3RhYmxlX2Fy
bV8zMl9scGFlX3MxX2luaXRfZm5zLAo+Pj4+IC3CoMKgwqAgW0FSTV8zMl9MUEFFX1MyXSA9ICZp
b19wZ3RhYmxlX2FybV8zMl9scGFlX3MyX2luaXRfZm5zLAo+Pj4+IC3CoMKgwqAgW0FSTV82NF9M
UEFFX1MxXSA9ICZpb19wZ3RhYmxlX2FybV82NF9scGFlX3MxX2luaXRfZm5zLAo+Pj4+IC3CoMKg
wqAgW0FSTV82NF9MUEFFX1MyXSA9ICZpb19wZ3RhYmxlX2FybV82NF9scGFlX3MyX2luaXRfZm5z
LAo+Pj4+IC3CoMKgwqAgW0FSTV9NQUxJX0xQQUVdID0gJmlvX3BndGFibGVfYXJtX21hbGlfbHBh
ZV9pbml0X2ZucywKPj4+PiAtI2VuZGlmCj4+Pj4gLSNpZmRlZiBDT05GSUdfSU9NTVVfSU9fUEdU
QUJMRV9BUk1WN1MKPj4+PiAtwqDCoMKgIFtBUk1fVjdTXSA9ICZpb19wZ3RhYmxlX2FybV92N3Nf
aW5pdF9mbnMsCj4+Pj4gLSNlbmRpZgo+Pj4+ICtzdHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2Zuc19u
b2RlIHsKPj4+PiArwqDCoMKgIHN0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zICpmbnM7Cj4+Pj4g
K8KgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4+Pj4gwqAgfTsKPj4+PiDCoCArc3RhdGlj
IExJU1RfSEVBRChpb19wZ3RhYmxlX2luaXRfZm5zX2xpc3QpOwo+Pj4+ICtzdGF0aWMgREVGSU5F
X1JXTE9DSyhpb19wZ3RhYmxlX2luaXRfZm5zX2xpc3RfbG9jayk7Cj4+Pj4gKwo+Pj4+ICtzdGF0
aWMgc3RydWN0IGlvX3BndGFibGVfaW5pdF9mbnMgKmlvX3BndGFibGVfZ2V0X2luaXRfZm5zKGVu
dW0gCj4+Pj4gaW9fcGd0YWJsZV9mbXQgZm10KQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qg
aW9fcGd0YWJsZV9pbml0X2Zuc19ub2RlICppdGVyOwo+Pj4+ICvCoMKgwqAgc3RydWN0IGlvX3Bn
dGFibGVfaW5pdF9mbnMgKmZucyA9IE5VTEw7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmVhZF9sb2Nr
KCZpb19wZ3RhYmxlX2luaXRfZm5zX2xpc3RfbG9jayk7Cj4+Pj4gK8KgwqDCoCBsaXN0X2Zvcl9l
YWNoX2VudHJ5KGl0ZXIsICZpb19wZ3RhYmxlX2luaXRfZm5zX2xpc3QsIGxpc3QpCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGlmIChpdGVyLT5mbnMtPmZtdCA9PSBmbXQpIHsKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmbnMgPSBpdGVyLT5mbnM7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+PiArwqDCoMKgIHJlYWRfdW5sb2Nr
KCZpb19wZ3RhYmxlX2luaXRfZm5zX2xpc3RfbG9jayk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmV0
dXJuIGZuczsKPj4+PiArfQo+Pj4gCj4+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGEgbG90IGVhc2ll
ciB0byBzdGljayB3aXRoIGEgc2ltcGxlIGFycmF5IGluZGV4ZWQKPj4+IGJ5IGVudW0gLSB0aGF0
IHdheSB5b3UgY2FuIGp1c3Qgc2V0L2NsZWFyL3Rlc3QgZW50cmllcyB3aXRob3V0IAo+Pj4gbmVl
ZGluZwo+Pj4gdG8gd29ycnkgYWJvdXQgbG9ja2luZy4gQmFzaWNhbGx5IGp1c3QgcmVtb3ZlIHRo
ZSBjb25zdCBhbmQgdGhlCj4+PiBpbml0aWFsaXNlcnMgZnJvbSB0aGUgZXhpc3Rpbmcgb25lIDsp
Cj4+PiAKPj4+IChhbmQgaWYgeW91IHRoaW5rIHlvdSdyZSBjb25jZXJuZWQgYWJvdXQgbWVtb3J5
LCBjb25zaWRlciB0aGF0IGp1c3QKPj4+IHRoZSBsaXN0IGhlYWQgcGx1cyBsb2NrIGlzIGFscmVh
ZHkgaGFsZiB0aGUgc2l6ZSBvZiB0aGUgdGFibGUpCj4+PiAKPj4+IE90aGVyIHRoYW4gdGhhdCwg
SSB0aGluayB0aGlzIGFsbCBsb29rcyBwcmV0dHkgcHJvbWlzaW5nIC0gSSdkIAo+Pj4gc3VnZ2Vz
dAo+Pj4gc2VuZGluZyBhIG5vbi1SRkMgYWZ0ZXIgcmMxIHNvIHRoYXQgaXQgZ2V0cyBldmVyeW9u
ZSdzIHByb3Blcgo+Pj4gYXR0ZW50aW9uLgo+Pj4gCj4+PiBUaGFua3MsCj4+PiBSb2Jpbi4KPj4+
IAo+PiAKPj4gVGhhbmtzIGZvciBhbGwgb2YgdGhlIGZlZWRiYWNrISBXaXRoIHJlc3BlY3QgdG8g
dGhlIGNvbW1lbnQgYWJvdXQgCj4+IGtlZXBpbmcgdGhlIGN1cnJlbnQgYXJyYXksCj4+IGRvbid0
IHdlIG5lZWQgc29tZSBzb3J0IG9mIGxvY2sgdG8gcHJvdGVjdCBhY2Nlc3MgdG8gdGhlIGRhdGEg
Cj4+IHN0cnVjdHVyZSAoZS5nLiBjb25jdXJyZW50IGFjY2Vzcwo+PiBpZiBhZGRpbmcgdHdvIG9w
cyBmb3IgdGhlIHNhbWUgZm9ybWF0KT8gT3IgZG8geW91IG1lYW4gdGhhdCB3ZSBzaG91bGQgCj4+
IHVzZSBhdG9taWMgb3BlcmF0aW9ucyB0bwo+PiBoYW5kbGUgdGhpcyBjbGVhbmx5Pwo+IAo+IEkg
ZG9uJ3QgdGhpbmsgYW55IHJhY2VzIGFyZSByZWFsaXN0aWNhbGx5IHBvc3NpYmxlIC0gYnVpbHQt
aW4KPiBpbml0Y2FsbHMgc2hvdWxkIHJ1biBzZXF1ZW50aWFsbHksIHdoaWxlIG1vZHVsZSBpbml0
IHNob3VsZCBiZQo+IHNlcmlhbGlzZWQgYnkgdGhlIG1vZHVsZSBsb2FkZXIgbG9jaywgc28gcmVn
aXN0cmF0aW9ucyBzaG91bGQgbmV2ZXIgYmUKPiBhYmxlIHRvIHJhY2UgYWdhaW5zdCBlYWNoIG90
aGVyLiBBbmQgaWYgdGhlcmUgY291bGQgYmUgYSByYWNlIGJldHdlZW4KPiByZWdpc3RlcmluZyBh
IGZvcm1hdCBhbmQgc29tZWJvZHkgdHJ5aW5nIHRvIHVzZSBpdCwgdGhlbiBzb21ldGhpbmcncwo+
IGZ1bmRhbWVudGFsbHkgd3JvbmcgYW55d2F5IC0gc3VyZSB3ZSBjb3VsZCB1c2UgUkVBRF9PTkNF
L1dSSVRFX09OQ0UKPiBmb3IgYWNjZXNzaW5nIHRoZSB0YWJsZSwgYnV0IHRoYXQgd291bGQgYmUg
YmFzaWNhbGx5IGJlIGFkbWl0dGluZyB0aGF0Cj4gd2UndmUgZmFpbGVkIGF0IHRoZSBwcmltYXJ5
IHB1cnBvc2Ugb2YgbWFraW5nIHN1cmUgZm9ybWF0cyBhcmUgbG9hZGVkCj4gKmJlZm9yZSogdGhl
IHVzZXJzIHRoYXQgZGVwZW5kIG9uIHRoZW0uCj4gCj4gV2l0aCBhIGRpcmVjdGx5LWluZGV4ZWQg
dGFibGUgdGhlcmUncyBubyBjb250ZW50aW9uIGJldHdlZW4gbG9va2luZyB1cAo+IG9uZSBmb3Jt
YXQgYW5kIHJlZ2lzdGVyaW5nIGFub3RoZXIgdW5yZWxhdGVkIGZvcm1hdCwgdW5saWtlIHdpdGgg
YQo+IGxpc3QuCj4gCj4gUm9iaW4uCj4gCgpHb3QgaXQuIEknbGwgc3RpY2sgd2l0aCB0aGUgYXJy
YXkgYXMgc3VnZ2VzdGVkLiBUaGFua3MgYWdhaW4gZm9yIHRoZSAKZmVlZGJhY2suCkknbGwgYmUg
c2VuZGluZyB0aGUgdmVyc2lvbiB3aXRoIHlvdXIgc3VnZ2VzdGlvbnMgd2hlbiA1LjExLXJjMSBj
b21lcyAKb3V0IGFzCmEgbm9uLVJGQy4KCi0tSXNhYWMKPj4gCj4+IFRoYW5rcywKPj4gSXNhYWMK
Pj4+PiArCj4+Pj4gwqAgc3RydWN0IGlvX3BndGFibGVfb3BzICphbGxvY19pb19wZ3RhYmxlX29w
cyhlbnVtIGlvX3BndGFibGVfZm10IAo+Pj4+IGZtdCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW9fcGd0YWJsZV9jZmcgKmNm
ZywKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2b2lkICpjb29raWUpCj4+Pj4gwqAgewo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGlvX3BndGFi
bGUgKmlvcDsKPj4+PiAtwqDCoMKgIGNvbnN0IHN0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zICpm
bnM7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2ZucyAqZm5zOwo+Pj4+IMKg
wqDCoMKgwqDCoMKgIGlmIChmbXQgPj0gSU9fUEdUQUJMRV9OVU1fRk1UUykKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+Pj4gwqAgLcKgwqDCoCBmbnMgPSBpb19wZ3RhYmxl
X2luaXRfdGFibGVbZm10XTsKPj4+PiArwqDCoMKgIGZucyA9IGlvX3BndGFibGVfZ2V0X2luaXRf
Zm5zKGZtdCk7Cj4+Pj4gwqDCoMKgwqDCoCBpZiAoIWZucykKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIE5VTEw7Cj4+Pj4gwqAgQEAgLTU5LDEyICs3MSw2NCBAQCBFWFBPUlRfU1lNQk9M
X0dQTChhbGxvY19pb19wZ3RhYmxlX29wcyk7Cj4+Pj4gwqAgdm9pZCBmcmVlX2lvX3BndGFibGVf
b3BzKHN0cnVjdCBpb19wZ3RhYmxlX29wcyAqb3BzKQo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKg
IHN0cnVjdCBpb19wZ3RhYmxlICppb3A7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgaW9fcGd0YWJsZV9p
bml0X2ZucyAqZm5zOwo+Pj4+IMKgwqDCoMKgwqDCoMKgIGlmICghb3BzKQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4gwqDCoMKgwqDCoMKgwqAgaW9wID0gaW9fcGd0YWJsZV9v
cHNfdG9fcGd0YWJsZShvcHMpOwo+Pj4+IMKgwqDCoMKgwqAgaW9fcGd0YWJsZV90bGJfZmx1c2hf
YWxsKGlvcCk7Cj4+Pj4gLcKgwqDCoCBpb19wZ3RhYmxlX2luaXRfdGFibGVbaW9wLT5mbXRdLT5m
cmVlKGlvcCk7Cj4+Pj4gK8KgwqDCoCBmbnMgPSBpb19wZ3RhYmxlX2dldF9pbml0X2Zucyhpb3At
PmZtdCk7Cj4+Pj4gK8KgwqDCoCBpZiAoZm5zKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmbnMtPmZy
ZWUoaW9wKTsKPj4+PiDCoCB9Cj4+Pj4gwqAgRVhQT1JUX1NZTUJPTF9HUEwoZnJlZV9pb19wZ3Rh
YmxlX29wcyk7Cj4+Pj4gKwo+Pj4+ICtpbnQgaW9fcGd0YWJsZV9vcHNfcmVnaXN0ZXIoc3RydWN0
IGlvX3BndGFibGVfaW5pdF9mbnMgKmluaXRfZm5zKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1
Y3QgaW9fcGd0YWJsZV9pbml0X2Zuc19ub2RlICppdGVyLCAqZm5zX25vZGU7Cj4+Pj4gK8KgwqDC
oCBpbnQgcmV0ID0gMDsKPj4+PiArCj4+Pj4gK8KgwqDCoCBpZiAoIWluaXRfZm5zIHx8IGluaXRf
Zm5zLT5mbXQgPj0gSU9fUEdUQUJMRV9OVU1fRk1UUyB8fAo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAh
aW5pdF9mbnMtPmFsbG9jIHx8ICFpbml0X2Zucy0+ZnJlZSkKPj4+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FSU5WQUw7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgZm5zX25vZGUgPSBremFsbG9jKHNp
emVvZigqZm5zX25vZGUpLCBHRlBfS0VSTkVMKTsKPj4+PiArwqDCoMKgIGlmICghZm5zX25vZGUp
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+Pj4+ICsKPj4+PiArwqDCoMKg
IHdyaXRlX2xvY2soJmlvX3BndGFibGVfaW5pdF9mbnNfbGlzdF9sb2NrKTsKPj4+PiArwqDCoMKg
IGxpc3RfZm9yX2VhY2hfZW50cnkoaXRlciwgJmlvX3BndGFibGVfaW5pdF9mbnNfbGlzdCwgbGlz
dCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGl0ZXItPmZucy0+Zm10ID09IGluaXRfZm5zLT5m
bXQpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUVYSVNUOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKGZuc19ub2RlKTsKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDC
oMKgIGlmICghcmV0KSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGZuc19ub2RlLT5mbnMgPSBpbml0
X2ZuczsKPj4+PiArwqDCoMKgwqDCoMKgwqAgSU5JVF9MSVNUX0hFQUQoJmZuc19ub2RlLT5saXN0
KTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgbGlzdF9hZGRfdGFpbCgmZm5zX25vZGUtPmxpc3QsICZp
b19wZ3RhYmxlX2luaXRfZm5zX2xpc3QpOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICvCoMKgwqAgd3Jp
dGVfdW5sb2NrKCZpb19wZ3RhYmxlX2luaXRfZm5zX2xpc3RfbG9jayk7Cj4+Pj4gK8KgwqDCoCBy
ZXR1cm4gcmV0Owo+Pj4+ICt9Cj4+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKGlvX3BndGFibGVfb3Bz
X3JlZ2lzdGVyKTsKPj4+PiArCj4+Pj4gK3ZvaWQgaW9fcGd0YWJsZV9vcHNfdW5yZWdpc3Rlcihz
dHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2ZucyAKPj4+PiAqaW5pdF9mbnMpCj4+Pj4gK3sKPj4+PiAr
wqDCoMKgIHN0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zX25vZGUgKml0ZXIsICp0bXA7Cj4+Pj4g
Kwo+Pj4+ICvCoMKgwqAgaWYgKCFpbml0X2ZucykKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Owo+Pj4+ICsKPj4+PiArwqDCoMKgIHdyaXRlX2xvY2soJmlvX3BndGFibGVfaW5pdF9mbnNfbGlz
dF9sb2NrKTsKPj4+PiArwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShpdGVyLCB0bXAs
ICZpb19wZ3RhYmxlX2luaXRfZm5zX2xpc3QsIAo+Pj4+IGxpc3QpCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGlmIChpdGVyLT5mbnMgPT0gaW5pdF9mbnMpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBsaXN0X2RlbCgmaXRlci0+bGlzdCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
a2ZyZWUoaXRlcik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIH0KPj4+PiArwqDCoMKgIHdyaXRlX3VubG9jaygmaW9fcGd0YWJsZV9pbml0
X2Zuc19saXN0X2xvY2spOwo+Pj4+ICt9Cj4+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKGlvX3BndGFi
bGVfb3BzX3VucmVnaXN0ZXIpOwo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2lvLXBn
dGFibGUuaCBiL2luY2x1ZGUvbGludXgvaW8tcGd0YWJsZS5oCj4+Pj4gaW5kZXggZWE3MjdlYi4u
NDViMzY3Y2UgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9pby1wZ3RhYmxlLmgKPj4+
PiArKysgYi9pbmNsdWRlL2xpbnV4L2lvLXBndGFibGUuaAo+Pj4+IEBAIC0xNjMsNiArMTYzLDM4
IEBAIHN0cnVjdCBpb19wZ3RhYmxlX29wcyB7Cj4+Pj4gwqAgfTsKPj4+PiDCoMKgwqAgLyoqCj4+
Pj4gKyAqIHN0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zIC0gQWxsb2MvZnJlZSBhIHNldCBvZiBw
YWdlIHRhYmxlcyBmb3IgCj4+Pj4gYQo+Pj4+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFydGljdWxhciBmb3JtYXQuCj4+Pj4g
KyAqCj4+Pj4gKyAqIEBmbXQ6wqDCoCBUaGUgcGFnZSB0YWJsZSBmb3JtYXQuCj4+Pj4gKyAqIEBh
bGxvYzogQWxsb2NhdGUgYSBzZXQgb2YgcGFnZSB0YWJsZXMgZGVzY3JpYmVkIGJ5IGNmZy4KPj4+
PiArICogQGZyZWU6wqAgRnJlZSB0aGUgcGFnZSB0YWJsZXMgYXNzb2NpYXRlZCB3aXRoIGlvcC4K
Pj4+PiArICovCj4+Pj4gK3N0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zIHsKPj4+PiArwqDCoMKg
IGVudW0gaW9fcGd0YWJsZV9mbXQgZm10Owo+Pj4+ICvCoMKgwqAgc3RydWN0IGlvX3BndGFibGUg
KigqYWxsb2MpKHN0cnVjdCBpb19wZ3RhYmxlX2NmZyAqY2ZnLCB2b2lkIAo+Pj4+ICpjb29raWUp
Owo+Pj4+ICvCoMKgwqAgdm9pZCAoKmZyZWUpKHN0cnVjdCBpb19wZ3RhYmxlICppb3ApOwo+Pj4+
ICt9Owo+Pj4+ICsKPj4+PiArLyoqCj4+Pj4gKyAqIGlvX3BndGFibGVfb3BzX3JlZ2lzdGVyKCkg
LSBSZWdpc3RlciB0aGUgcGFnZSB0YWJsZSByb3V0aW5lcyBmb3IgCj4+Pj4gYSBwYWdlIHRhYmxl
Cj4+Pj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZm9ybWF0Lgo+Pj4+ICsgKgo+Pj4+ICsgKiBAaW5pdF9mbnM6IFRoZSBmdW5jdGlv
bnMgZm9yIGFsbG9jYXRpbmcgYW5kIGZyZWVpbmcgdGhlIHBhZ2UgCj4+Pj4gdGFibGVzIG9mCj4+
Pj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhIHBhcnRpY3VsYXIgZm9ybWF0Lgo+Pj4+ICsg
Ki8KPj4+PiAraW50IGlvX3BndGFibGVfb3BzX3JlZ2lzdGVyKHN0cnVjdCBpb19wZ3RhYmxlX2lu
aXRfZm5zICppbml0X2Zucyk7Cj4+Pj4gKwo+Pj4+ICsvKioKPj4+PiArICogaW9fcGd0YWJsZV9v
cHNfdW5yZWdpc3RlcigpIC0gVW5yZWdpc3RlciB0aGUgcGFnZSB0YWJsZSByb3V0aW5lcyAKPj4+
PiBmb3IgYSBwYWdlCj4+Pj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhYmxlIGZvcm1hdC4KPj4+PiArICoKPj4+PiArICog
QGluaXRfZm5zOiBUaGUgZnVuY3Rpb25zIGZvciBhbGxvY2F0aW5nIGFuZCBmcmVlaW5nIHRoZSBw
YWdlIAo+Pj4+IHRhYmxlcyBvZgo+Pj4+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYSBwYXJ0
aWN1bGFyIGZvcm1hdC4KPj4+PiArICovCj4+Pj4gK3ZvaWQgaW9fcGd0YWJsZV9vcHNfdW5yZWdp
c3RlcihzdHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2ZucyAKPj4+PiAqaW5pdF9mbnMpOwo+Pj4+ICsK
Pj4+PiArLyoqCj4+Pj4gwqDCoCAqIGFsbG9jX2lvX3BndGFibGVfb3BzKCkgLSBBbGxvY2F0ZSBh
IHBhZ2UgdGFibGUgYWxsb2NhdG9yIGZvciAKPj4+PiB1c2UgYnkgYW4gSU9NTVUuCj4+Pj4gwqDC
oCAqCj4+Pj4gwqDCoCAqIEBmbXQ6wqDCoMKgIFRoZSBwYWdlIHRhYmxlIGZvcm1hdC4KPj4+PiBA
QCAtMjMzLDIzICsyNjUsNCBAQCBpb19wZ3RhYmxlX3RsYl9hZGRfcGFnZShzdHJ1Y3QgaW9fcGd0
YWJsZSAqaW9wLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpb3AtPmNmZy50bGItPnRsYl9hZGRf
cGFnZShnYXRoZXIsIGlvdmEsIGdyYW51bGUsIAo+Pj4+IGlvcC0+Y29va2llKTsKPj4+PiDCoCB9
Cj4+Pj4gwqAgLS8qKgo+Pj4+IC0gKiBzdHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2ZucyAtIEFsbG9j
L2ZyZWUgYSBzZXQgb2YgcGFnZSB0YWJsZXMgZm9yIAo+Pj4+IGEKPj4+PiAtICrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhcnRpY3Vs
YXIgZm9ybWF0Lgo+Pj4+IC0gKgo+Pj4+IC0gKiBAYWxsb2M6IEFsbG9jYXRlIGEgc2V0IG9mIHBh
Z2UgdGFibGVzIGRlc2NyaWJlZCBieSBjZmcuCj4+Pj4gLSAqIEBmcmVlOsKgIEZyZWUgdGhlIHBh
Z2UgdGFibGVzIGFzc29jaWF0ZWQgd2l0aCBpb3AuCj4+Pj4gLSAqLwo+Pj4+IC1zdHJ1Y3QgaW9f
cGd0YWJsZV9pbml0X2ZucyB7Cj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgaW9fcGd0YWJsZSAqKCphbGxv
Yykoc3RydWN0IGlvX3BndGFibGVfY2ZnICpjZmcsIHZvaWQgCj4+Pj4gKmNvb2tpZSk7Cj4+Pj4g
LcKgwqDCoCB2b2lkICgqZnJlZSkoc3RydWN0IGlvX3BndGFibGUgKmlvcCk7Cj4+Pj4gLX07Cj4+
Pj4gLQo+Pj4+IC1leHRlcm4gc3RydWN0IGlvX3BndGFibGVfaW5pdF9mbnMgCj4+Pj4gaW9fcGd0
YWJsZV9hcm1fMzJfbHBhZV9zMV9pbml0X2ZuczsKPj4+PiAtZXh0ZXJuIHN0cnVjdCBpb19wZ3Rh
YmxlX2luaXRfZm5zIAo+Pj4+IGlvX3BndGFibGVfYXJtXzMyX2xwYWVfczJfaW5pdF9mbnM7Cj4+
Pj4gLWV4dGVybiBzdHJ1Y3QgaW9fcGd0YWJsZV9pbml0X2ZucyAKPj4+PiBpb19wZ3RhYmxlX2Fy
bV82NF9scGFlX3MxX2luaXRfZm5zOwo+Pj4+IC1leHRlcm4gc3RydWN0IGlvX3BndGFibGVfaW5p
dF9mbnMgCj4+Pj4gaW9fcGd0YWJsZV9hcm1fNjRfbHBhZV9zMl9pbml0X2ZuczsKPj4+PiAtZXh0
ZXJuIHN0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zIGlvX3BndGFibGVfYXJtX3Y3c19pbml0X2Zu
czsKPj4+PiAtZXh0ZXJuIHN0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zIAo+Pj4+IGlvX3BndGFi
bGVfYXJtX21hbGlfbHBhZV9pbml0X2ZuczsKPj4+PiAtCj4+Pj4gwqAgI2VuZGlmIC8qIF9fSU9f
UEdUQUJMRV9IICovCj4+Pj4gCj4+PiAKPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+PiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+Pj4g
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gaW9tbXUgbWFpbGluZyBs
aXN0Cj4+IGlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCj4+IGh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21t
dUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
