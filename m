Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5F3460AB
	for <lists.iommu@lfdr.de>; Tue, 23 Mar 2021 14:59:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDAE0404B2;
	Tue, 23 Mar 2021 13:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcTS-adVISEo; Tue, 23 Mar 2021 13:59:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96DAD40499;
	Tue, 23 Mar 2021 13:59:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 689CBC0001;
	Tue, 23 Mar 2021 13:59:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E40BC0001
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 13:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CC12402C3
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 13:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4bCNlskCqcm for <iommu@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 13:59:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6C4F400AE
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 13:59:17 +0000 (UTC)
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4F4Xqz3cftz682Vk;
 Tue, 23 Mar 2021 21:52:47 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 14:59:14 +0100
Received: from [10.47.11.95] (10.47.11.95) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 23 Mar
 2021 13:59:13 +0000
Subject: Re: [PATCH 3/3] iova: Correct comment for free_cpu_cached_iovas()
To: Robin Murphy <robin.murphy@arm.com>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, <joro@8bytes.org>, <will@kernel.org>
References: <1614600741-15696-1-git-send-email-john.garry@huawei.com>
 <1614600741-15696-4-git-send-email-john.garry@huawei.com>
 <87b4af01-2352-e963-824f-1cea1a6ee718@arm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <cb4547e8-bab4-bea5-e9c2-18884e3e5e12@huawei.com>
Date: Tue, 23 Mar 2021 13:56:58 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87b4af01-2352-e963-824f-1cea1a6ee718@arm.com>
Content-Language: en-US
X-Originating-IP: [10.47.11.95]
X-ClientProxiedBy: lhreml747-chm.china.huawei.com (10.201.108.197) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com
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

T24gMjMvMDMvMjAyMSAxMzowNSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjEtMDMtMDEg
MTI6MTIsIEpvaG4gR2Fycnkgd3JvdGU6Cj4+IEZ1bmN0aW9uIGZyZWVfY3B1X2NhY2hlZF9pb3Zh
cygpIGlzIG5vdCBvbmx5IGNhbGxlZCB3aGVuIGEgQ1BVIGlzCj4+IGhvdHBsdWdnZWQsIHNvIHJl
bW92ZSB0aGF0IHBhcnQgb2YgdGhlIGNvZGUgY29tbWVudC4KPiAKPiBGV0lXIEkgcmVhZCBpdCBh
cyBjbGFyaWZ5aW5nIHdoeSB0aGlzIGlzIGJyb2tlbiBvdXQgaW50byBhIHNlcGFyYXRlIAo+IGZ1
bmN0aW9uIHZzLiBhIG1vbm9saXRoaWMgImZyZWUgYWxsIGNhY2hlZCBJT1ZBcyIgcm91dGluZSB0
aGF0IGhhbmRsZXMgCj4gYm90aCB0aGUgcGVyLWNwdSBhbmQgZ2xvYmFsIGNhY2hlcyAKCj4gaXQg
bmV2ZXIgc2FpZCAiKm9ubHkqIHVzZWQuLi4iCgpJdCBzZWVtcyB0byBiZSBpbXBseWluZyB0aGF0
LgoKSXQncyBvbmx5IGEgY29kZSBjb21tZW50LCBzbyBJIGRvbid0IGNhcmUgdG9vIG11Y2ggZWl0
aGVyIHdheSBhbmQgY2FuIApkcm9wIHRoaXMgY2hhbmdlLgoKPiAKPiBBcyBzdWNoIEknZCBoZXNp
dGF0ZSB0byBjYWxsIGl0IGluY29ycmVjdCwgYnV0IGl0J3MgY2VydGFpbmx5IGFyZ3VhYmxlIAo+
IHdoZXRoZXIgaXQgbmVlZHMgdG8gYmUgc3RhdGVkIG9yIG5vdCwgZXNwZWNpYWxseSBvbmNlIHRo
ZSBob3RwbHVnIAo+IGNhbGxzaXRlIGlzIG5vdyBvYnZpb3VzIGluIHRoZSBzYW1lIGZpbGUgLSBv
biB3aGljaCBub3RlIHRoZSBmdW5jdGlvbiAKPiBpdHNlbGYgYWxzbyBzaG91bGRuJ3QgbmVlZCB0
byBiZSBwdWJsaWMgYW55IG1vcmUsIG5vPwo+IAoKUmlnaHQsIEkgYWN0dWFsbHkgbWlzc2VkIGRl
bGV0aW5nIGlvbW11X2RtYV9mcmVlX2NwdV9jYWNoZWRfaW92YXMoKSwgc28gCmNhbiBmaXggdGhh
dCBub3cuCgpDaGVlcnMsCkpvaG4KCj4gUm9iaW4uCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4g
R2FycnkgPGpvaG4uZ2FycnlAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaW9tbXUv
aW92YS5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW92YS5jIGIvZHJpdmVy
cy9pb21tdS9pb3ZhLmMKPj4gaW5kZXggYzc4MzEyNTYwNDI1Li40NjViM2IwZWVlYjAgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvaW92YS5jCj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaW92
YS5jCj4+IEBAIC05OTYsNyArOTk2LDcgQEAgc3RhdGljIHZvaWQgZnJlZV9pb3ZhX3JjYWNoZXMo
c3RydWN0IGlvdmFfZG9tYWluIAo+PiAqaW92YWQpCj4+IMKgIH0KPj4gwqAgLyoKPj4gLSAqIGZy
ZWUgYWxsIHRoZSBJT1ZBIHJhbmdlcyBjYWNoZWQgYnkgYSBjcHUgKHVzZWQgd2hlbiBjcHUgaXMg
dW5wbHVnZ2VkKQo+PiArICogZnJlZSBhbGwgdGhlIElPVkEgcmFuZ2VzIGNhY2hlZCBieSBhIGNw
dQo+PiDCoMKgICovCj4+IMKgIHZvaWQgZnJlZV9jcHVfY2FjaGVkX2lvdmFzKHVuc2lnbmVkIGlu
dCBjcHUsIHN0cnVjdCBpb3ZhX2RvbWFpbiAqaW92YWQpCj4+IMKgIHsKPj4KPiAuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxp
c3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
