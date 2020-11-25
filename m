Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0182C3655
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 02:54:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 438D2864F4;
	Wed, 25 Nov 2020 01:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVQLZjwUh2qc; Wed, 25 Nov 2020 01:54:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1DCBE86582;
	Wed, 25 Nov 2020 01:54:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF81AC0052;
	Wed, 25 Nov 2020 01:54:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44F0EC0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 01:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2B3B786A3B
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 01:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HsbeaMNp4tCV for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 01:54:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 86AA486A37
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 01:54:43 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CgkTL0NZBzkfXG;
 Wed, 25 Nov 2020 09:54:14 +0800 (CST)
Received: from [10.174.178.174] (10.174.178.174) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 09:54:35 +0800
Subject: Re: [PATCH] iommu: fix return error code in iommu_probe_device()
To: Will Deacon <will@kernel.org>
References: <20201117025238.3425422-1-yangyingliang@huawei.com>
 <835ab066-b6b8-a211-4941-c01781031de8@linux.intel.com>
 <454f5e3e-c380-e8a5-9283-3f7578eb601e@huawei.com>
 <20201117224102.GD524@willie-the-truck>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <78bee047-ab33-4d81-6f77-af4c5b6e8aaa@huawei.com>
Date: Wed, 25 Nov 2020 09:54:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20201117224102.GD524@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Ck9uIDIwMjAvMTEvMTggNjo0MSwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gT24gVHVlLCBOb3YgMTcs
IDIwMjAgYXQgMDc6MTE6MjhQTSArMDgwMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+IE9uIDIw
MjAvMTEvMTcgMTc6NDAsIEx1IEJhb2x1IHdyb3RlOgo+Pj4gT24gMjAyMC8xMS8xNyAxMDo1Miwg
WWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+Pj4gSWYgaW9tbXVfZ3JvdXBfZ2V0KCkgZmFpbGVkLCBp
dCBuZWVkIHJldHVybiBlcnJvciBjb2RlCj4+Pj4gaW4gaW9tbXVfcHJvYmVfZGV2aWNlKCkuCj4+
Pj4KPj4+PiBGaXhlczogY2YxOTM4ODhiZmJkICgiaW9tbXU6IE1vdmUgbmV3IHByb2JlX2Rldmlj
ZSBwYXRoLi4uIikKPj4+PiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5j
b20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVh
d2VpLmNvbT4KPj4+PiAtLS0KPj4+PiAgwqAgZHJpdmVycy9pb21tdS9pb21tdS5jIHwgNCArKyst
Cj4+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2lvbW11LmMgYi9kcml2ZXJzL2lv
bW11L2lvbW11LmMKPj4+PiBpbmRleCBiNTM0NDZiYjhjNmIuLjZmNGEzMmRmOTBmNiAxMDA2NDQK
Pj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvbW11LmMKPj4+PiArKysgYi9kcml2ZXJzL2lvbW11
L2lvbW11LmMKPj4+PiBAQCAtMjUzLDggKzI1MywxMCBAQCBpbnQgaW9tbXVfcHJvYmVfZGV2aWNl
KHN0cnVjdCBkZXZpY2UgKmRldikKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX291
dDsKPj4+PiAgwqAgwqDCoMKgwqDCoCBncm91cCA9IGlvbW11X2dyb3VwX2dldChkZXYpOwo+Pj4+
IC3CoMKgwqAgaWYgKCFncm91cCkKPj4+PiArwqDCoMKgIGlmICghZ3JvdXApIHsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0ID0gLUVOT0RFVjsKPj4+IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gd2h5
IHlvdSB1c2UgLUVOT0RFViBoZXJlPwo+PiBCZWZvcmUgNzk2NTkxOTBlZTk3ICgiaW9tbXU6IERv
bid0IHRha2UgZ3JvdXAgcmVmZXJlbmNlIGluCj4+IGlvbW11X2FsbG9jX2RlZmF1bHRfZG9tYWlu
KCkiKSwgaW4KPj4KPj4gaW9tbXVfYWxsb2NfZGVmYXVsdF9kb21haW4oKSwgaWYgZ3JvdXAgaXMg
TlVMTCwgaXQgd2lsbCByZXR1cm4gLUVOT0RFVi4KPiBIbW0uIFdoaWxlIEkgdGhpbmsgdGhlIHBh
dGNoIGlzIG9rLCBJJ20gbm90IHN1cmUgaXQgcXVhbGlmaWVzIGFzIGEgZml4Lgo+IEhhcyBpb21t
dV9wcm9iZV9kZXZpY2UoKSBldmVyIHByb3BhZ2F0ZWQgdGhpcyBlcnJvcj8gVGhlIGNvbW1pdCB5
b3UKPiBpZGVudGlmeSBpbiB0aGUgJ0ZpeGVzOicgdGFnIGRvZXNuJ3Qgc2VlbSB0byBjaGFuZ2Ug
dGhpcyBhZmFpY3QuCgpJIHRoaW5rIGFmdGVyIHRoaXMgY29tbWl0IDQzOTk0NWU3NGE0YiAoImlv
bW11OiBNb3ZlIGRlZmF1bHQgZG9tYWluIAphbGxvY2F0aW9uIHRvIGlvbW11X3Byb2JlX2Rldmlj
ZSgpIiksCgppb21tdV9wcm9iZV9kZXZpY2UoKSB3b24ndCByZXR1cm4gZXJyb3IgY29kZSBpZiBn
cm91cCBpcyBOVUxMLiBJIGNhbiBhZGQgCnRoaXMgZml4IHRhZyBpbiB2Mi4KCgo+Cj4gV2lsbAo+
IC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
