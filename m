Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CA452B84C
	for <lists.iommu@lfdr.de>; Wed, 18 May 2022 13:08:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54E8760E0B;
	Wed, 18 May 2022 11:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5_qkCB8qqSJ; Wed, 18 May 2022 11:08:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 28E8E60D78;
	Wed, 18 May 2022 11:08:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F285BC002D;
	Wed, 18 May 2022 11:08:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE3CEC002D
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 11:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D686983DFC
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 11:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSTivdBzV-nL for <iommu@lists.linux-foundation.org>;
 Wed, 18 May 2022 11:08:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4A5583689
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 11:08:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7C1423A;
 Wed, 18 May 2022 04:08:05 -0700 (PDT)
Received: from [10.57.82.55] (unknown [10.57.82.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A23F23F718;
 Wed, 18 May 2022 04:08:03 -0700 (PDT)
Message-ID: <a063199a-72dd-d2ab-10bb-7130697c5611@arm.com>
Date: Wed, 18 May 2022 12:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/8] iommu: mtk_iommu: Lookup phandle to retrieve syscon
 to infracfg
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-3-angelogioacchino.delregno@collabora.com>
 <16fb07d9-28d8-5c73-1eb5-ec13544d22e5@arm.com>
 <b003c37c-0f2d-31f6-6a74-4e1f0f4a1ccb@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <b003c37c-0f2d-31f6-6a74-4e1f0f4a1ccb@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
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

T24gMjAyMi0wNS0xOCAwOToyOSwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4g
SWwgMTcvMDUvMjIgMTY6MTIsIFJvYmluIE11cnBoeSBoYSBzY3JpdHRvOgo+PiBPbiAyMDIyLTA1
LTE3IDE0OjIxLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToKPj4+IFRoaXMgZHJp
dmVyIHdpbGwgZ2V0IHN1cHBvcnQgZm9yIG1vcmUgU29DcyBhbmQgdGhlIGxpc3Qgb2YgaW5mcmFj
ZmcKPj4+IGNvbXBhdGlibGVzIGlzIGV4cGVjdGVkIHRvIGdyb3c6IGluIG9yZGVyIHRvIHByZXZl
bnQgZ2V0dGluZyB0aGlzCj4+PiBzaXR1YXRpb24gb3V0IG9mIGNvbnRyb2wgYW5kIHNlZSBhIGxv
bmcgbGlzdCBvZiBjb21wYXRpYmxlIHN0cmluZ3MsCj4+PiBhZGQgc3VwcG9ydCB0byByZXRyaWV2
ZSBhIGhhbmRsZSB0byBpbmZyYWNmZydzIHJlZ21hcCB0aHJvdWdoIGEKPj4+IG5ldyAibWVkaWF0
ZWssaW5mcmFjZmciIHBoYW5kbGUuCj4+Pgo+Pj4gSW4gb3JkZXIgdG8ga2VlcCByZXRyb2NvbXBh
dGliaWxpdHkgd2l0aCBvbGRlciBkZXZpY2V0cmVlcywgdGhlIG9sZAo+Pj4gd2F5IGlzIGtlcHQg
aW4gcGxhY2UsIGJ1dCBhbHNvIGEgZGV2X3dhcm4oKSB3YXMgYWRkZWQgdG8gYWR2ZXJ0aXNlCj4+
PiB0aGlzIGNoYW5nZSBpbiBob3BlIHRoYXQgdGhlIHVzZXIgd2lsbCBzZWUgaXQgYW5kIGV2ZW50
dWFsbHkgdXBkYXRlCj4+PiB0aGUgZGV2aWNldHJlZSBpZiB0aGlzIGlzIHBvc3NpYmxlLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIAo+Pj4gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVy
cy9pb21tdS9tdGtfaW9tbXUuYyB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L210a19pb21tdS5jIGIv
ZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYwo+Pj4gaW5kZXggNzFiMmFjZTc0Y2Q2Li5jZmFhYTk4
ZDJiNTAgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L210a19pb21tdS5jCj4+PiArKysg
Yi9kcml2ZXJzL2lvbW11L210a19pb21tdS5jCj4+PiBAQCAtMTEzNCwyMiArMTEzNCwzNCBAQCBz
dGF0aWMgaW50IG10a19pb21tdV9wcm9iZShzdHJ1Y3QgCj4+PiBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4+PiDCoMKgwqDCoMKgIGRhdGEtPnByb3RlY3RfYmFzZSA9IEFMSUdOKHZpcnRfdG9fcGh5
cyhwcm90ZWN0KSwgCj4+PiBNVEtfUFJPVEVDVF9QQV9BTElHTik7Cj4+PiDCoMKgwqDCoMKgIGlm
IChNVEtfSU9NTVVfSEFTX0ZMQUcoZGF0YS0+cGxhdF9kYXRhLCBIQVNfNEdCX01PREUpKSB7Cj4+
PiAtwqDCoMKgwqDCoMKgwqAgc3dpdGNoIChkYXRhLT5wbGF0X2RhdGEtPm00dV9wbGF0KSB7Cj4+
PiAtwqDCoMKgwqDCoMKgwqAgY2FzZSBNNFVfTVQyNzEyOgo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcCA9ICJtZWRpYXRlayxtdDI3MTItaW5mcmFjZmciOwo+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYnJlYWs7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgY2FzZSBNNFVfTVQ4MTczOgo+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcCA9ICJtZWRpYXRlayxtdDgxNzMtaW5mcmFjZmciOwo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgZGVm
YXVsdDoKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHAgPSBOVUxMOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGluZnJhY2ZnID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShkZXYtPm9m
X25vZGUsIAo+Pj4gIm1lZGlhdGVrLGluZnJhY2ZnIik7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYg
KElTX0VSUihpbmZyYWNmZykpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJu
KGRldiwgIkNhbm5vdCBmaW5kIHBoYW5kbGUgdG8gbWVkaWF0ZWssaW5mcmFjZmc6Igo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiIFBsZWFzZSB1cGRhdGUg
eW91ciBkZXZpY2V0cmVlLlxuIik7Cj4+Cj4+IElzIHRoaXMgcmVhbGx5IGEgZGV2X3dhcm4tbGV2
ZWwgcHJvYmxlbT8gVGhlcmUncyBubyBmdW5jdGlvbmFsIGltcGFjdCwgCj4+IGdpdmVuIHRoYXQg
d2UgY2FuJ3Qgc3RvcCBzdXBwb3J0aW5nIHRoZSBvcmlnaW5hbCBiaW5kaW5nIGFueSB0aW1lIAo+
PiBzb29uLCBpZiBldmVyLCBzbyBJIHN1c3BlY3QgdGhpcyBpcyBtb3JlIGxpa2VseSB0byBqdXN0
IGFubm95IHVzZXJzIAo+PiBhbmQgQ0kgc3lzdGVtcyB0aGFuIGVmZmVjdCBhbnkgc2lnbmlmaWNh
bnQgY2hhbmdlLgo+Pgo+IAo+IFRoZSB1cHN0cmVhbSBkZXZpY2V0cmVlcyB3ZXJlIHVwZGF0ZWQg
dG8gdXNlIHRoZSBuZXcgaGFuZGxlIGFuZCB0aGlzIGlzIAo+IGEgd2F5IHRvCj4gd2FybiBhYm91
dCBoYXZpbmcgb3V0ZGF0ZWQgRFRzLi4uIGJlc2lkZXMsIEkgYmVsaWV2ZSB0aGF0IENJcyB3aWxs
IAo+IGFsd2F5cyBnZXQgdGhlCj4gZGV2aWNldHJlZSBmcm9tIHRoZSBzYW1lIHRyZWUgdGhhdCB0
aGUga2VybmVsIHdhcyBjb21waWxlZCBmcm9tIChoZW5jZSAKPiBubyBtZXNzYWdlCj4gd2lsbCBi
ZSB0aHJvd24pLgo+IAo+IEluIGFueSBjYXNlLCBpZiB5b3UgdGhpbmsgdGhhdCBhIGRldl9pbmZv
IHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGUsIEkgCj4gY2FuIGNoYW5nZQo+IHRoYXQgbm8gcHJv
YmxlbS4KCklmIHRoZXJlJ3Mgc29tZSBmdW5jdGlvbmFsIGltcGFjdCBmcm9tIHVzaW5nIHRoZSBv
bGQgYmluZGluZyB2cy4gdGhlIG5ldyAKb25lIHRoZW4gaXQncyByZWFzb25hYmxlIHRvIGluZm9y
bSB0aGUgdXNlciBvZiB0aGF0IChhcyB3ZSBkbyBpbiAKYXJtLXNtbXUsIGZvciBleGFtcGxlKS4K
Ckhvd2V2ZXIgaWYgeW91IGNoYW5nZSBhbiBlc3RhYmxpc2hlZCBiaW5kaW5nIGZvciBub24tZnVu
Y3Rpb25hbCByZWFzb25zLCAKdGhlbiB5b3UgZ2V0IHRvIHN1cHBvcnQgYm90aCBiaW5kaW5ncywg
YW5kIGl0J3Mgbm90IHRoZSBlbmQgdXNlcidzIApwcm9ibGVtIGF0IGFsbC4gVGhlcmUgc2VlbXMg
dG8gYmUgemVybyByZWFzb24gdG8gdXBkYXRlIGFuIGV4aXN0aW5nIERUQiAKZm9yIHRoaXMgZGlm
ZmVyZW5jZSBhbG9uZSwgc28gVEJIIEkgZG9uJ3QgdGhpbmsgaXQgZGVzZXJ2ZXMgYSBtZXNzYWdl
IGF0IAphbGwuCgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBMZWdhY3kgZGV2aWNldHJlZXMgd2lsbCBub3Qgc3BlY2lmeSBhIHBo
YW5kbGUgdG8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBtZWRpYXRlayxpbmZyYWNm
ZzogaW4gdGhhdCBjYXNlLCB3ZSB1c2UgdGhlIG9sZGVyCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICogd2F5IHRvIHJldHJpZXZlIGEgc3lzY29uIHRvIGluZnJhLgo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVGhpcyBp
cyBmb3IgcmV0cm9jb21wYXRpYmlsaXR5IHB1cnBvc2VzIG9ubHksIGhlbmNlCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogbm8gbW9yZSBjb21wYXRpYmxlcyBzaGFsbCBiZSBhZGRlZCB0
byB0aGlzLgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3dpdGNoIChkYXRhLT5wbGF0X2RhdGEtPm00dV9wbGF0KSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE00VV9NVDI3MTI6Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHAgPSAibWVkaWF0ZWssbXQyNzEyLWluZnJhY2ZnIjsKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjYXNlIE00VV9NVDgxNzM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHAgPSAibWVkaWF0ZWssbXQ4MTczLWluZnJhY2ZnIjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0Ogo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwID0gTlVMTDsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluZnJh
Y2ZnID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfY29tcGF0aWJsZShwKTsKPj4KPj4gV291bGQg
aXQgbm90IG1ha2Ugc2Vuc2UgdG8gcHVudCB0aGlzIG92ZXIgdG8gdGhlIHNhbWUgbWVjaGFuaXNt
IGFzIGZvciAKPj4gcGVyaWNmZywgc3VjaCB0aGF0IGl0IHNpbXBsaWZpZXMgZG93biB0byBzb21l
dGhpbmcgbGlrZToKPj4KPj4gwqDCoMKgwqDCoGlmIChJU19FUlIoaW5mcmFjZmcpICYmIHBsYXRf
ZGF0YS0+aW5mcmFjZmcpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoCBpbmZyYWNmZyA9IAo+PiBzeXNj
b25fcmVnbWFwX2xvb2t1cF9ieV9jb21wYXRpYmxlKHBsYXRfZGF0YS0+aW5mcmFjZmcpOwo+PiDC
oMKgwqDCoMKgwqDCoMKgIC4uLgo+PiDCoMKgwqDCoMKgfQo+Pgo+PiA/Cj4+Cj4+IFRCSCBpZiB3
ZSdyZSBzdGlsbCBnb2luZyB0byBoYXZlIGEgbG9hZCBvZiBwZXItU29DIGRhdGEgaW4gdGhlIGRy
aXZlciAKPj4gYW55d2F5IHRoZW4gSSBkb24ndCBzZWUgdGhhdCB3ZSByZWFsbHkgZ2FpbiBtdWNo
IGJ5IGRlbGVnYXRpbmcgb25lIAo+PiBhc3BlY3Qgb2YgaXQgdG8gRFQsIGJ1dCBtZWguIEkgd291
bGQgbm90ZSB0aGF0IHdpdGggdGhlIHBoYW5kbGUgCj4+IGFwcHJvYWNoLCB5b3Ugc3RpbGwgbmVl
ZCBzb21lICpvdGhlciogZmxhZyBpbiB0aGUgZHJpdmVyIHRvIGtub3cgCj4+IHdoZXRoZXIgYSBw
aGFuZGxlIGlzIGV4cGVjdGVkIHRvIGJlIHByZXNlbnQgb3Igbm90LCB3aGVyZWFzIGEgTlVMTCB2
cy4gCj4+IG5vbi1OVUxMIHN0cmluZyBpcyBhdCBsZWFzdCBuZWF0bHkgc2VsZi1kZXNjcmliaW5n
Lgo+Pgo+IAo+IFRoYXQgd291bGQgYmUgcG9zc2libGUgYnV0LCBhcyBZb25nIGFsc28gcG9pbnRl
ZCBvdXQsIHdlIHNob3VsZCB0cnkgdG8gCj4gcmVkdWNlIHRoZQo+IHBlci1Tb0MgZGF0YSBpbiB0
aGUgZHJpdmVyIGJ5IGNvbW1vbml6aW5nIGFzIG11Y2ggYXMgcG9zc2libGUsIGJlY2F1c2UgCj4g
dGhpcyBkcml2ZXIKPiBzdXBwb3J0cyBhIHZlcnkgbG9uZyBsaXN0IG9mIFNvQ3MgKGV2ZW4gdGhv
dWdoIHRoZXkncmUgbm90IGFsbCAKPiB1cHN0cmVhbWVkIHlldCksCj4gYW5kIHRoZSBsaXN0IGlz
IGdvaW5nIHRvIGdyb3cgZXZlbiBtb3JlIHdpdGggdGltZTogdGhpcyBpcyBhbHNvIHdoeSBJIAo+
IGhhdmUgY2hhbmdlZAo+IHRoZSBNVDgxOTUgcGVyaWNmZyByZWdtYXAgbG9va3VwIHdpdGggYSBw
aGFuZGxlIGxpa2UgSSd2ZSBkb25lIGZvciBpbmZyYS4KClRoYXQncyBmYWlyIGVub3VnaCwgYnV0
IGl0J3Mgbm90IHdoYXQgdGhlIGNvbW1pdCBtZXNzYWdlIHNheXMuIFRoZSAibG9uZyAKbGlzdCBv
ZiBjb21wYXRpYmxlIHN0cmluZ3MiIGNvbXBsYWludCBjb3VsZCBiZSBhZGRyZXNzZWQgYXQgZmFj
ZSB2YWx1ZSAKYnkgcmVmYWN0b3Jpbmcgd2l0aG91dCBjaGFuZ2luZyB0aGUgRFQgYmluZGluZyBh
dCBhbGwuCgpIb3dldmVyLCBJIGRpZG4ndCB0aGluayBJJ2QgaGF2ZSB0byBwb2ludCBvdXQgd2h5
IHRoYXQgYXJndW1lbnQgZG9lc24ndCAKYXBwbHkgdG8gZXhpc3RpbmcgU29DcyB3aGljaCB3ZSBo
YXZlIHRvIHN1cHBvcnQgd2l0aCB0aGUgb3JpZ2luYWwgCmJpbmRpbmcgdG9vOyB0YWtlIGFub3Ro
ZXIgbG9vayBhdCB0aGUgc3dpdGNoIHN0YXRlbWVudCBhYm92ZSBhbmQgaGF2ZSBhIAp0aGluay4u
LgoKSWYgd2UgaGF2ZSB0byBtYWludGFpbiBpbmZyYWNmZyBjb21wYXRpYmxlIGRhdGEgKnNvbWV3
aGVyZSogaW4gdGhlIApkcml2ZXIsIHdoaWNoIHdlIGRvLCB0aGVuIGl0IHNlZW1zIG1vcmUgbG9n
aWNhbCB0byBrZWVwIGl0IHdpdGggdGhlIHJlc3QgCm9mIHRoZSBkYXRhIHJhdGhlciB0aGFuIHNj
YXR0ZXJlZCB0aHJvdWdoIHRoZSBjb2RlLCB0aGF0J3MgdGhlIG1haW4gCnBvaW50IEkgd2FudGVk
IHRvIG1ha2UgaGVyZS4KCj4gVGhlcmUgd291bGQgYWxzbyBiZSBhbm90aGVyIHdheSwgd2hpY2gg
d291bGQgaW1wbHkgYWRkaW5nIGEgZ2VuZXJpYyAKPiBjb21wYXRpYmxlCj4gIm1lZGlhdGVrLGlu
ZnJhY2ZnIiB0byB0aGUgaW5mcmEgc3lzY29uIG5vZGUsIGJ1dCBJIHJlYWxseSBkb24ndCBsaWtl
IAo+IHRoYXQgZm9yCj4gbW9yZSB0aGFuIG9uZSByZWFzb24sIG9uZSBvZiB3aGljaCBpcyB0aGF0
IHRoaXMgcG9zZXMgYW4gaXNzdWUsIGZvciAKPiB3aGljaCBpdCdzCj4gbm90IGd1YXJhbnRlZWQg
dGhhdCB0aGUgcmVnaXN0ZXJzIGFyZSBpbiBpbmZyYWNmZyBhbmQgbm90IGluZnJhY2ZnX2FvIChl
dmVuCj4gdGhvdWdoIHRoZSBvZmZzZXRzIGFyZSB0aGUgc2FtZSksIHNvIHRoZW4gd2Ugd291bGQg
YmUgYmFjayB0byBncm91bmQgemVyby4KCk5vLCB3ZSBzdGlsbCBoYXZlIHRvIHN1cHBvcnQgdGhl
IGV4aXN0aW5nIGJpbmRpbmcgaW4gdGhlIGNvbnRleHQgb2YgdGhlIApleGlzdGluZyBiaW5kaW5n
LiBUaGVyZSAqYXJlKiBzb21lIHJlYXNvbmFibGUgYXJndW1lbnRzIGZvciBtb3ZpbmcgCmZ1dHVy
ZSBTb0NzIHRvIHRoZSBwaGFuZGxlIGJpbmRpbmcsIHRoZXkganVzdCBoYXZlbid0IGJlZW4gcHJl
c2VudGVkIGluIAp0aGVzZSBwYXRjaGVzIDspCgpUaGFua3MsClJvYmluLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9t
bXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
