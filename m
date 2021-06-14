Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 408523A6990
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 17:05:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C12D44013B;
	Mon, 14 Jun 2021 15:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hh7xPco8EFMJ; Mon, 14 Jun 2021 15:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DCB5F40100;
	Mon, 14 Jun 2021 15:05:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABC86C000B;
	Mon, 14 Jun 2021 15:05:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C11DC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D4764013B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4oQy22BcmQH for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 15:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47C6640100
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:05:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6547B1FB;
 Mon, 14 Jun 2021 08:05:22 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DECD13F70D;
 Mon, 14 Jun 2021 08:05:20 -0700 (PDT)
Subject: Re: [PATCH v12 3/5] iommu/vt-d: Add support for IOMMU default DMA
 mode build options
To: John Garry <john.garry@huawei.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-4-git-send-email-john.garry@huawei.com>
 <4f2cec34-bad9-e1bf-85c1-04d1a0c1aecf@linux.intel.com>
 <6055cd0d-a1d3-a73a-6831-3837021f3c9c@huawei.com>
 <0a04f964-80f4-7b2a-9740-eae4596e4e09@arm.com>
 <453a4606-099c-3d06-13fd-dc29c24230f5@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a37fa781-8372-5014-c96e-0dde43217778@arm.com>
Date: Mon, 14 Jun 2021 16:05:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <453a4606-099c-3d06-13fd-dc29c24230f5@huawei.com>
Content-Language: en-GB
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>
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

T24gMjAyMS0wNi0xNCAxNToxOSwgSm9obiBHYXJyeSB3cm90ZToKPiBPbiAxNC8wNi8yMDIxIDE1
OjExLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+IE9uIDIwMjEtMDYtMTQgMDg6NTMsIEpvaG4gR2Fy
cnkgd3JvdGU6Cj4+PiBPbiAxMi8wNi8yMDIxIDAzOjIyLCBMdSBCYW9sdSB3cm90ZToKPj4+PiBP
biAyMDIxLzYvMTEgMjA6MjAsIEpvaG4gR2Fycnkgd3JvdGU6Cj4+Pj4+IEBAIC00NTMsOCArNDUy
LDcgQEAgc3RhdGljIGludCBfX2luaXQgaW50ZWxfaW9tbXVfc2V0dXAoY2hhciAqc3RyKQo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX3dhcm4oImludGVsX2lvbW11PWZvcmNl
ZGFjIGRlcHJlY2F0ZWQ7IHVzZQo+Pj4+PiBpb21tdS5mb3JjZWRhYyBpbnN0ZWFkXG4iKTsKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpb21tdV9kbWFfZm9yY2VkYWMgPSB0cnVl
Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKCFzdHJuY21wKHN0ciwgInN0
cmljdCIsIDYpKSB7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2luZm8oIkRpc2Fi
bGUgYmF0Y2hlZCBJT1RMQiBmbHVzaFxuIik7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGludGVsX2lvbW11X3N0cmljdCA9IDE7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlv
bW11X3NldF9kbWFfc3RyaWN0KHRydWUpOwo+Pj4+IEkgd291bGQgbGlrZSB0byBkZXByZWNhdGUg
dGhpcyBjb21tYW5kIGxpbmUgYW5kIGFzayB1c2VycyB0byB1c2UKPj4+PiBpb21tdS5zdHJpY3Qg
aW5zdGVhZC4KPj4+IG9rLCBidXQgdGhlbiBJIHNob3VsZCBwcm9iYWJseSBtYWtlIHRoZSBBTUQg
ZHJpdmVyIGFsc28gb2ZmaWNpYWxseQo+Pj4gc3VwcG9ydCB0aGlzLgo+PiBPb3BzLCBJIHNob3Vs
ZCBoYXZlIGRvY3VtZW50ZWQgdGhhdCAiaW9tbXUuc3RyaWN0IiBhbHJlYWR5IGFwcGxpZXMgdG8K
Pj4geDg2IGFzIHdlbGwuIFRoZSBpbnRlcmFjdGlvbiB3aXRoIHRoZSBkcml2ZXItc3BlY2lmaWMg
cGFyYW1ldGVycyBpcyBhCj4+IGJpdCB3ZWlyZCBhbmQgdW5pbnR1aXRpdmUsIGJ1dCBpdCB3YXMg
ZG9uZSBrbm93aW5nbHkuIExldCBtZSBxdWlja2x5Cj4+IHNwaW4gYSBrZXJuZWwtcGFyYW1ldGVy
cy50eHQgZml4IGZvciB0aGF0Li4uCj4gCj4gU28gSSBhbHJlYWR5IGhhZCBhIHBlbmRpbmcgcGF0
Y2ggaGVyZSBmb3IgdGhlIHNhbWUgdG8gYmUgaW5jbHVkZWQgaW4gCj4gdGhpcyBzZXJpZXM6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL2hpc2lsaWNvbi9rZXJuZWwtZGV2L2NvbW1pdC8yMzc1YTJkODg4
ZDc4ZGU5ZWI3ZDkxZDZmMmM1ODkxMzk1MzAwYTk2IAo+IAo+IAo+IElmIHlvdSB3YW50IHRvIGRv
IGl0LCB0aGVuIG9rLiBJIG1pZ2h0IGhhdmUgdG8gcmVvcmRlciB0aGUgc2VyaWVzIHRob3VnaC4u
LgoKWWVhaCwgc29ycnkgZm9yIHRoZSBjb21wbGljYXRpb24uIFlvdXIgc3Vic2VxdWVudCBkZXBy
ZWNhdGlvbiBvZiB0aGUgeDg2IApwYXJhbWV0ZXJzIGRvZXNuJ3QgbmVlZCB0byBjb25mbGljdCwg
YnV0IHdlIHNob3VsZCBwcm9iYWJseSBhbHNvIHVwZGF0ZSAKdGhhdCB0aGUgZGVmYXVsdCB2YWx1
ZSBub3cgZGVwZW5kcyBvbiB0aGUga2VybmVsIGNvbmZpZywgd2hpY2ggd2lsbCA6KAoKVGhhbmtz
LApSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
