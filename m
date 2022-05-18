Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E052B4A0
	for <lists.iommu@lfdr.de>; Wed, 18 May 2022 10:29:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2816F83F08;
	Wed, 18 May 2022 08:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VE4XYSJtmExq; Wed, 18 May 2022 08:29:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0FC11813FB;
	Wed, 18 May 2022 08:29:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1C78C002D;
	Wed, 18 May 2022 08:29:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7D62C002D
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 08:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0E4F611C8
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 08:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dvt_eeSM1_42 for <iommu@lists.linux-foundation.org>;
 Wed, 18 May 2022 08:29:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEB3C60784
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 08:29:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3EE671F44C48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652862568;
 bh=B5iXBTSLQ4uTMVDMAikh/PyBC8/1DmHnDiYnDQpXUGc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VcZSgyDFkXVQ7ZBn6tniLuaZ9UMwP2ol1ef2Kzy5s8z7Xo9QrYRbECkueg5HvXsu7
 Kj0VuXcW9sczbDy0CexTkc3zMJf3rKpQzlGST0kZr8cbOuqQ9rUy3ht1H7G9Q2rmnU
 UOlyrtxgsMkLwV4A0gJdMmkKPmLvofWMD6kNgk6rpx+DVqph87f5Qb8dUdTBUjZkzH
 WDAW1JqlhB3X/IxoSD3TV8WpPVN6JuYGyV4MfFvyWUqZFsIZCMF4nyHI0hwskPq+g7
 Od19IMjW/qJd5+RBTtB5vaoC921CK71aF1PFQozoeBmiE9QRtEd6h7f4XRjg944Mvv
 qqJcGEHj8exew==
Message-ID: <b003c37c-0f2d-31f6-6a74-4e1f0f4a1ccb@collabora.com>
Date: Wed, 18 May 2022 10:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/8] iommu: mtk_iommu: Lookup phandle to retrieve syscon
 to infracfg
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, yong.wu@mediatek.com
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-3-angelogioacchino.delregno@collabora.com>
 <16fb07d9-28d8-5c73-1eb5-ec13544d22e5@arm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <16fb07d9-28d8-5c73-1eb5-ec13544d22e5@arm.com>
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

SWwgMTcvMDUvMjIgMTY6MTIsIFJvYmluIE11cnBoeSBoYSBzY3JpdHRvOgo+IE9uIDIwMjItMDUt
MTcgMTQ6MjEsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOgo+PiBUaGlzIGRyaXZl
ciB3aWxsIGdldCBzdXBwb3J0IGZvciBtb3JlIFNvQ3MgYW5kIHRoZSBsaXN0IG9mIGluZnJhY2Zn
Cj4+IGNvbXBhdGlibGVzIGlzIGV4cGVjdGVkIHRvIGdyb3c6IGluIG9yZGVyIHRvIHByZXZlbnQg
Z2V0dGluZyB0aGlzCj4+IHNpdHVhdGlvbiBvdXQgb2YgY29udHJvbCBhbmQgc2VlIGEgbG9uZyBs
aXN0IG9mIGNvbXBhdGlibGUgc3RyaW5ncywKPj4gYWRkIHN1cHBvcnQgdG8gcmV0cmlldmUgYSBo
YW5kbGUgdG8gaW5mcmFjZmcncyByZWdtYXAgdGhyb3VnaCBhCj4+IG5ldyAibWVkaWF0ZWssaW5m
cmFjZmciIHBoYW5kbGUuCj4+Cj4+IEluIG9yZGVyIHRvIGtlZXAgcmV0cm9jb21wYXRpYmlsaXR5
IHdpdGggb2xkZXIgZGV2aWNldHJlZXMsIHRoZSBvbGQKPj4gd2F5IGlzIGtlcHQgaW4gcGxhY2Us
IGJ1dCBhbHNvIGEgZGV2X3dhcm4oKSB3YXMgYWRkZWQgdG8gYWR2ZXJ0aXNlCj4+IHRoaXMgY2hh
bmdlIGluIGhvcGUgdGhhdCB0aGUgdXNlciB3aWxsIHNlZSBpdCBhbmQgZXZlbnR1YWxseSB1cGRh
dGUKPj4gdGhlIGRldmljZXRyZWUgaWYgdGhpcyBpcyBwb3NzaWJsZS4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMg
fCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11
LmMKPj4gaW5kZXggNzFiMmFjZTc0Y2Q2Li5jZmFhYTk4ZDJiNTAgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvaW9tbXUvbXRrX2lvbW11LmMKPj4gKysrIGIvZHJpdmVycy9pb21tdS9tdGtfaW9tbXUu
Ywo+PiBAQCAtMTEzNCwyMiArMTEzNCwzNCBAQCBzdGF0aWMgaW50IG10a19pb21tdV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiDCoMKgwqDCoMKgIGRhdGEtPnByb3RlY3Rf
YmFzZSA9IEFMSUdOKHZpcnRfdG9fcGh5cyhwcm90ZWN0KSwgTVRLX1BST1RFQ1RfUEFfQUxJR04p
Owo+PiDCoMKgwqDCoMKgIGlmIChNVEtfSU9NTVVfSEFTX0ZMQUcoZGF0YS0+cGxhdF9kYXRhLCBI
QVNfNEdCX01PREUpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKGRhdGEtPnBsYXRfZGF0
YS0+bTR1X3BsYXQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGNhc2UgTTRVX01UMjcxMjoKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcCA9ICJtZWRpYXRlayxtdDI3MTItaW5mcmFjZmciOwo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gLcKgwqDCoMKgwqDCoMKgIGNhc2UgTTRV
X01UODE3MzoKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcCA9ICJtZWRpYXRlayxtdDgxNzMt
aW5mcmFjZmciOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gLcKgwqDCoMKg
wqDCoMKgIGRlZmF1bHQ6Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHAgPSBOVUxMOwo+PiAr
wqDCoMKgwqDCoMKgwqAgaW5mcmFjZmcgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxl
KGRldi0+b2Zfbm9kZSwgCj4+ICJtZWRpYXRlayxpbmZyYWNmZyIpOwo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKElTX0VSUihpbmZyYWNmZykpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2
X3dhcm4oZGV2LCAiQ2Fubm90IGZpbmQgcGhhbmRsZSB0byBtZWRpYXRlayxpbmZyYWNmZzoiCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiBQbGVhc2UgdXBk
YXRlIHlvdXIgZGV2aWNldHJlZS5cbiIpOwo+IAo+IElzIHRoaXMgcmVhbGx5IGEgZGV2X3dhcm4t
bGV2ZWwgcHJvYmxlbT8gVGhlcmUncyBubyBmdW5jdGlvbmFsIGltcGFjdCwgZ2l2ZW4gdGhhdCAK
PiB3ZSBjYW4ndCBzdG9wIHN1cHBvcnRpbmcgdGhlIG9yaWdpbmFsIGJpbmRpbmcgYW55IHRpbWUg
c29vbiwgaWYgZXZlciwgc28gSSBzdXNwZWN0IAo+IHRoaXMgaXMgbW9yZSBsaWtlbHkgdG8ganVz
dCBhbm5veSB1c2VycyBhbmQgQ0kgc3lzdGVtcyB0aGFuIGVmZmVjdCBhbnkgc2lnbmlmaWNhbnQg
Cj4gY2hhbmdlLgo+IAoKVGhlIHVwc3RyZWFtIGRldmljZXRyZWVzIHdlcmUgdXBkYXRlZCB0byB1
c2UgdGhlIG5ldyBoYW5kbGUgYW5kIHRoaXMgaXMgYSB3YXkgdG8Kd2FybiBhYm91dCBoYXZpbmcg
b3V0ZGF0ZWQgRFRzLi4uIGJlc2lkZXMsIEkgYmVsaWV2ZSB0aGF0IENJcyB3aWxsIGFsd2F5cyBn
ZXQgdGhlCmRldmljZXRyZWUgZnJvbSB0aGUgc2FtZSB0cmVlIHRoYXQgdGhlIGtlcm5lbCB3YXMg
Y29tcGlsZWQgZnJvbSAoaGVuY2Ugbm8gbWVzc2FnZQp3aWxsIGJlIHRocm93bikuCgpJbiBhbnkg
Y2FzZSwgaWYgeW91IHRoaW5rIHRoYXQgYSBkZXZfaW5mbyB3b3VsZCBiZSBtb3JlIGFwcHJvcHJp
YXRlLCBJIGNhbiBjaGFuZ2UKdGhhdCBubyBwcm9ibGVtLgoKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIExlZ2FjeSBkZXZpY2V0cmVl
cyB3aWxsIG5vdCBzcGVjaWZ5IGEgcGhhbmRsZSB0bwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogbWVkaWF0ZWssaW5mcmFjZmc6IGluIHRoYXQgY2FzZSwgd2UgdXNlIHRoZSBvbGRlcgo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogd2F5IHRvIHJldHJpZXZlIGEgc3lzY29uIHRv
IGluZnJhLgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICoKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIFRoaXMgaXMgZm9yIHJldHJvY29tcGF0aWJpbGl0eSBwdXJwb3NlcyBvbmx5
LCBoZW5jZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbm8gbW9yZSBjb21wYXRpYmxl
cyBzaGFsbCBiZSBhZGRlZCB0byB0aGlzLgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICov
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN3aXRjaCAoZGF0YS0+cGxhdF9kYXRhLT5tNHVf
cGxhdCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE00VV9NVDI3MTI6Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcCA9ICJtZWRpYXRlayxtdDI3MTItaW5mcmFj
ZmciOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjYXNlIE00VV9NVDgxNzM6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcCA9ICJtZWRpYXRlayxtdDgxNzMtaW5mcmFjZmciOwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
ZWZhdWx0Ogo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHAgPSBOVUxMOwo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aW5mcmFjZmcgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9jb21wYXRpYmxlKHApOwo+IAo+IFdv
dWxkIGl0IG5vdCBtYWtlIHNlbnNlIHRvIHB1bnQgdGhpcyBvdmVyIHRvIHRoZSBzYW1lIG1lY2hh
bmlzbSBhcyBmb3IgcGVyaWNmZywgCj4gc3VjaCB0aGF0IGl0IHNpbXBsaWZpZXMgZG93biB0byBz
b21ldGhpbmcgbGlrZToKPiAKPiAgwqDCoMKgwqBpZiAoSVNfRVJSKGluZnJhY2ZnKSAmJiBwbGF0
X2RhdGEtPmluZnJhY2ZnKSB7Cj4gIMKgwqDCoMKgwqDCoMKgIGluZnJhY2ZnID0gc3lzY29uX3Jl
Z21hcF9sb29rdXBfYnlfY29tcGF0aWJsZShwbGF0X2RhdGEtPmluZnJhY2ZnKTsKPiAgwqDCoMKg
wqDCoMKgwqAgLi4uCj4gIMKgwqDCoMKgfQo+IAo+ID8KPiAKPiBUQkggaWYgd2UncmUgc3RpbGwg
Z29pbmcgdG8gaGF2ZSBhIGxvYWQgb2YgcGVyLVNvQyBkYXRhIGluIHRoZSBkcml2ZXIgYW55d2F5
IHRoZW4gSSAKPiBkb24ndCBzZWUgdGhhdCB3ZSByZWFsbHkgZ2FpbiBtdWNoIGJ5IGRlbGVnYXRp
bmcgb25lIGFzcGVjdCBvZiBpdCB0byBEVCwgYnV0IG1laC4gSSAKPiB3b3VsZCBub3RlIHRoYXQg
d2l0aCB0aGUgcGhhbmRsZSBhcHByb2FjaCwgeW91IHN0aWxsIG5lZWQgc29tZSAqb3RoZXIqIGZs
YWcgaW4gdGhlIAo+IGRyaXZlciB0byBrbm93IHdoZXRoZXIgYSBwaGFuZGxlIGlzIGV4cGVjdGVk
IHRvIGJlIHByZXNlbnQgb3Igbm90LCB3aGVyZWFzIGEgTlVMTCAKPiB2cy4gbm9uLU5VTEwgc3Ry
aW5nIGlzIGF0IGxlYXN0IG5lYXRseSBzZWxmLWRlc2NyaWJpbmcuCj4gCgpUaGF0IHdvdWxkIGJl
IHBvc3NpYmxlIGJ1dCwgYXMgWW9uZyBhbHNvIHBvaW50ZWQgb3V0LCB3ZSBzaG91bGQgdHJ5IHRv
IHJlZHVjZSB0aGUKcGVyLVNvQyBkYXRhIGluIHRoZSBkcml2ZXIgYnkgY29tbW9uaXppbmcgYXMg
bXVjaCBhcyBwb3NzaWJsZSwgYmVjYXVzZSB0aGlzIGRyaXZlcgpzdXBwb3J0cyBhIHZlcnkgbG9u
ZyBsaXN0IG9mIFNvQ3MgKGV2ZW4gdGhvdWdoIHRoZXkncmUgbm90IGFsbCB1cHN0cmVhbWVkIHll
dCksCmFuZCB0aGUgbGlzdCBpcyBnb2luZyB0byBncm93IGV2ZW4gbW9yZSB3aXRoIHRpbWU6IHRo
aXMgaXMgYWxzbyB3aHkgSSBoYXZlIGNoYW5nZWQKdGhlIE1UODE5NSBwZXJpY2ZnIHJlZ21hcCBs
b29rdXAgd2l0aCBhIHBoYW5kbGUgbGlrZSBJJ3ZlIGRvbmUgZm9yIGluZnJhLgoKVGhlcmUgd291
bGQgYWxzbyBiZSBhbm90aGVyIHdheSwgd2hpY2ggd291bGQgaW1wbHkgYWRkaW5nIGEgZ2VuZXJp
YyBjb21wYXRpYmxlCiJtZWRpYXRlayxpbmZyYWNmZyIgdG8gdGhlIGluZnJhIHN5c2NvbiBub2Rl
LCBidXQgSSByZWFsbHkgZG9uJ3QgbGlrZSB0aGF0IGZvcgptb3JlIHRoYW4gb25lIHJlYXNvbiwg
b25lIG9mIHdoaWNoIGlzIHRoYXQgdGhpcyBwb3NlcyBhbiBpc3N1ZSwgZm9yIHdoaWNoIGl0J3MK
bm90IGd1YXJhbnRlZWQgdGhhdCB0aGUgcmVnaXN0ZXJzIGFyZSBpbiBpbmZyYWNmZyBhbmQgbm90
IGluZnJhY2ZnX2FvIChldmVuCnRob3VnaCB0aGUgb2Zmc2V0cyBhcmUgdGhlIHNhbWUpLCBzbyB0
aGVuIHdlIHdvdWxkIGJlIGJhY2sgdG8gZ3JvdW5kIHplcm8uCgpSZWdhcmRzLApBbmdlbG8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxp
bmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
