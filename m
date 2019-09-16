Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B20B4145
	for <lists.iommu@lfdr.de>; Mon, 16 Sep 2019 21:43:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48E7CCB0;
	Mon, 16 Sep 2019 19:43:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C92BD7F6
	for <iommu@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 19:43:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.smtpout.orange.fr (smtp11.smtpout.orange.fr
	[80.12.242.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 579977DB
	for <iommu@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 19:43:49 +0000 (UTC)
Received: from [192.168.1.41] ([90.126.97.183]) by mwinf5d90 with ME
	id 2Kjj2100R3xPcdm03Kjj1q; Mon, 16 Sep 2019 21:43:47 +0200
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Sep 2019 21:43:47 +0200
X-ME-IP: 90.126.97.183
Subject: Re: [PATCH] iommu/arm-smmu: Axe a useless test in
	'arm_smmu_master_alloc_smes()'
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, joro@8bytes.org
References: <20190915193401.27426-1-christophe.jaillet@wanadoo.fr>
	<de9ee628-9efb-3078-590c-6852be61c7d2@arm.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <5babe7b3-07ba-cb07-82b0-4105d8e8b4fc@wanadoo.fr>
Date: Mon, 16 Sep 2019 21:43:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <de9ee628-9efb-3078-590c-6852be61c7d2@arm.com>
Content-Language: fr
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

TGUgMTYvMDkvMjAxOSDDoCAxMjo0NiwgUm9iaW4gTXVycGh5IGEgw6ljcml0wqA6Cj4gT24gMTUv
MDkvMjAxOSAyMDozNCwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+PiAnb21tdV9ncm91cF9n
ZXRfZm9yX2RldigpJyBuZXZlciByZXR1cm5zIE5VTEwsIHNvIHRoaXMgdGVzdCBjYW4gYmUgCj4+
IHJlbW92ZWQuCj4KPiBOaXQ6IHR5cG8gaW4gdGhlIGZ1bmN0aW9uIG5hbWUuCj4KPiBPdGhlcndp
c2UsIHRoZXJlIGRlZmluaXRlbHkgdXNlZCB0byBiZSBzb21lIHBhdGggd2hlcmUgYSBOVUxMIHJl
dHVybiAKPiBjb3VsZCBsZWFrIG91dCwgc28gSSB3b3VsZCBoYXZlIGhhZCB0aGF0IGluIG1pbmQg
YXQgdGhlIHRpbWUgSSB3cm90ZSAKPiB0aGlzLCBidXQgYXBwYXJlbnRseSBJIG5ldmVyIG5vdGlj
ZWQgdGhhdCB0aGF0IGhhZCBhbHJlYWR5IGJlZW4gCj4gY2xlYW5lZCB1cCBieSB0aGUgdGltZSB0
aGlzIGdvdCBtZXJnZWQuCj4KSGksCgpNYXliZSBmaXhlZCBieSA3MmRjYWM2MzM0NzUgKCJpb21t
dTogV2FybiBvbmNlIHdoZW4gZGV2aWNlX2dyb3VwIApjYWxsYmFjayByZXR1cm5zIE5VTEwiKQoK
CkNKCgo+IFJldmlld2VkLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+
Cj4gVGhhbmtzLAo+IFJvYmluLgo+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgSkFJTExF
VCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2lv
bW11L2FybS1zbW11LmMgfCAyIC0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9p
b21tdS9hcm0tc21tdS5jCj4+IGluZGV4IGMzZWYwY2M4Zjc2NC4uNmZhZThjZGJlOTg1IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMKPj4gKysrIGIvZHJpdmVycy9pb21t
dS9hcm0tc21tdS5jCj4+IEBAIC0xMDM4LDggKzEwMzgsNiBAQCBzdGF0aWMgaW50IGFybV9zbW11
X21hc3Rlcl9hbGxvY19zbWVzKHN0cnVjdCAKPj4gZGV2aWNlICpkZXYpCj4+IMKgwqDCoMKgwqAg
fQo+PiDCoCDCoMKgwqDCoMKgIGdyb3VwID0gaW9tbXVfZ3JvdXBfZ2V0X2Zvcl9kZXYoZGV2KTsK
Pj4gLcKgwqDCoCBpZiAoIWdyb3VwKQo+PiAtwqDCoMKgwqDCoMKgwqAgZ3JvdXAgPSBFUlJfUFRS
KC1FTk9NRU0pOwo+PiDCoMKgwqDCoMKgIGlmIChJU19FUlIoZ3JvdXApKSB7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXQgPSBQVFJfRVJSKGdyb3VwKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gb3V0X2VycjsKPj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lv
bW11
