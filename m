Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E786E24FA3F
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 11:54:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 935562052B;
	Mon, 24 Aug 2020 09:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipJbJ67e0PBH; Mon, 24 Aug 2020 09:54:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 28934204F7;
	Mon, 24 Aug 2020 09:54:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F7B7C0051;
	Mon, 24 Aug 2020 09:54:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D506DC0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 09:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D1BA686ECC
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 09:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYavIRrXZ70B for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 09:54:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id ED9B486DCC
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 09:54:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CDE01063;
 Mon, 24 Aug 2020 02:54:50 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B4333F66B;
 Mon, 24 Aug 2020 02:54:49 -0700 (PDT)
Subject: Re: Where are iommu region setup in dma_alloc_from_dev_coherent()
 track?
To: =?UTF-8?B?0KHQtdGA0LPQtdC5INCf0YvQv9GC0LXQsg==?= <spyptev@gmail.com>,
 iommu@lists.linux-foundation.org
References: <55a26221-96cc-5789-f5b0-8572be8358fb@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a2ca7a45-6db7-064a-f140-921faba69363@arm.com>
Date: Mon, 24 Aug 2020 10:54:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <55a26221-96cc-5789-f5b0-8572be8358fb@gmail.com>
Content-Language: en-GB
Cc: Christoph Hellwig <hch@infradead.org>
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

T24gMjAyMC0wOC0yNCAwODowMSwg0KHQtdGA0LPQtdC5INCf0YvQv9GC0LXQsiB3cm90ZToKPiBI
aSEKPiAKPiBJIHRyeSB0byBwb3J0IG91ciAzRCBzY2FubmVyIGRyaXZlciB0byBrZXJuZWwgdjQu
OSBhbmQgSSBoYXZlIGEgdHJvdWJsZS4gCj4gSSBjYW4gbm90IGZpbmQgYSBjb3JyZWN0IHdheSB0
byBhbGxvY2F0ZSBETUEgbWVtb3J5IHdpdGggY29ycmVjdCBpb21tdSAKPiBzZXR1cC4gQ291bGQg
eW91IGhlbHAgbWU/Cj4gCj4gSFc6IFRlZ3JhIFgxIGFuZCBUZWdyYSBYMiAoYXJtNjQpLCBvdXIg
UENJZSBidXMgbWFzdGVyIGRldmljZSB1c2VzIGFib3V0IAo+IDIwME0gb2Ygc3lzdGVtIG1lbW9y
eSB0byBzZW5kIGRhdGEgZnJvbSBzZW5zb3JzLiBUaGUgbWVtb3J5IGlzIG9yZ2FuaXplZCAKPiBp
biBjaXJjdWxhciBidWZmZXIgKDggZnJhbWVzKSBhbmQgb25lIGluZm8gcGFnZSAob25seSA4IGJ5
dGVzIGFyZSB1c2VkIAo+IG5vdykuCj4gT2xkIGRyaXZlciB3b3JrcyBhdCBrZXJuZWwgdjMuMTAg
YW5kIHNvbWUgbWVtb3J5IGFjY2VzcyBydWxlcyBhcmUgbmV3IGluIAo+IHY0LjksIHN1Y2ggYXMg
aW9tbXUuCj4gCj4gSSB0cnkgdG8gdXNlIHJlc2VydmVkIG1lbW9yeSByZWdpb24gYXR0YWNoZWQg
dG8gdGhlIGRldmljZSBpbiBkZXZpY2UgCj4gdHJlZSBhbmQgZG1hX2FsbG9jX2NvaGVyZW50KCkg
dG8gYWxsb2NhdGUgdGhlIGJ1ZmZlci4gKFRoZW4gSSBhbSBnb2luZyAKPiB0byBmaW5kIGNvcnJl
Y3QgZmxhZ3MgdG8gdHVybiBvZmYgY29oZXJlbmN5IGFuZCB0byBzeW5jIGRhdGEgdG8gQ1BVIAo+
IG1hbnVhbGx5IHdoZW4gZnVsbCBmcmFtZSBpcyBhcnJpdmVkLikKPiAKPiBVbmZvcnR1bmF0ZWx5
LCBpb21tdSBkb2VzIG5vdCBzZXQgdGhlIGFyZWEuCj4gCj4gSSd2ZSB0cmllZCB0byBmaW5kIHdo
eS4gSSBzZWUgaW9tbXUgY2FsbHMgaW4gZ2VuZXJhbCBkbWEgbWVtb3J5IAo+IGFsbG9jYXRpb24g
d2hlcmUgYXJjaC1kZXBlbmRlbnQgZG1hX29wcyBhcmUgdXNlZCAoYW5kIGl0IHNldHMgaW9tbXUg
Cj4gYXJlYSwgSSBjYW4gc2VlIGl0IGluIC9zeXMva2VybmVsL2RlYnVnKSwgYnV0IEkgY2FuIG5v
dCBmaW5kIHRoZSBjYWxscyAKPiBpbiBwZXItZGV2aWNlIGFsbG9jYXRpb24gdHJhY2suIFNvIEkg
ZG8gbm90IHNlZSBpZiBteSBjb2RlIGlzIG5vdCAKPiB3b3JraW5nIGJlY2F1c2Ugb2YgbXkgYnVn
cyBvciBJIHVzZSB3cm9uZyBjb25jZXB0IG9yIGl0IGlzIGJ1ZyBpbiBrZXJuZWwuCj4gCj4gSXMg
dGhlcmUgaW9tbXUgc2V0dXAgaW4gcGVyLWRldmljZSByZXNlcnZlZCBtZW1vcnkgYWxsb2NhdG9y
IChvciBtYXkgYmUgCj4gZWFybGllciBpbiBtZW1vcnkgcmVzZXJ2YXRpb24pPyBJZiBubywgd2h5
PyBJcyBpdCBhIGZlYXR1cmUgb3IgYSBidWc/CgpUaGVyZSBpcyBub3QuIEl0J3Mgbm90IGEgYnVn
LCBqdXN0IHRoYXQgdGhlcmUncyBubyBzdXBwb3J0IGZvciB0aGlzIApjb21iaW5hdGlvbiBiZWNh
dXNlIGl0IGRvZXNuJ3QgcmVhbGx5IG1ha2Ugc2Vuc2UuIFRoZSBleHBlY3RhdGlvbiBpcyAKdGhh
dCBhbiBJT01NVSBjYW4gYWRkcmVzcyBhbGwgc3lzdGVtIG1lbW9yeSBhdCBwYWdlIGdyYW51bGFy
aXR5LCAKdGhlcmVmb3JlIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgcmVzZXJ2ZWQgcmVnaW9ucyBiZWNh
dXNlIHRoZXJlIGFyZSBubyAKY29uc3RyYWludHMgb24gdGhlICpwaHlzaWNhbCogYWRkcmVzcyBz
cGFjZS4gVGhlIElPTU1VLWJhc2VkIERNQSBvcHMgY2FuIAphbGxvY2F0ZSAyMDBNQiB3b3J0aCBv
ZiBwYWdlcyBmcm9tIGFsbCBvdmVyIHRoZSBwbGFjZSBhbmQgc3RpbGwgcHJlc2VudCAKdGhlbSB0
byB0aGUgZGV2aWNlIChhbmQgZHJpdmVyKSBhcyBvbmUgbGFyZ2UgY29udGlndW91cyBidWZmZXIu
CgpSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
