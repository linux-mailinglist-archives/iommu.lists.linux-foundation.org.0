Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D1E1F51F7
	for <lists.iommu@lfdr.de>; Wed, 10 Jun 2020 12:12:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 206E2870AA;
	Wed, 10 Jun 2020 10:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBPYBjt4FgWq; Wed, 10 Jun 2020 10:12:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82EFF871A7;
	Wed, 10 Jun 2020 10:12:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68C04C0894;
	Wed, 10 Jun 2020 10:12:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5249C016F
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 10:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C2DCD87CA9
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 10:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jK3Xrkfe-0w5 for <iommu@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 10:12:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id C93F686C4A
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 10:12:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C8511FB;
 Wed, 10 Jun 2020 03:12:49 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7F7A3F7BB;
 Wed, 10 Jun 2020 03:12:47 -0700 (PDT)
Subject: Re: [PATCH] iommu/iova: Don't BUG on invalid PFNs
To: guptap@codeaurora.org
References: <acbd2d092b42738a03a21b417ce64e27f8c91c86.1591103298.git.robin.murphy@arm.com>
 <79df62c92cf61f2b5f717c28d620a283@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ae261494-4d38-11b1-37c2-0ab6a671a7d8@arm.com>
Date: Wed, 10 Jun 2020 11:12:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <79df62c92cf61f2b5f717c28d620a283@codeaurora.org>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

T24gMjAyMC0wNi0xMCAxMDoyNywgZ3VwdGFwQGNvZGVhdXJvcmEub3JnIHdyb3RlOgo+IE9uIDIw
MjAtMDYtMDIgMTg6MzgsIFJvYmluIE11cnBoeSB3cm90ZToKPj4gVW5saWtlIHRoZSBvdGhlciBp
bnN0YW5jZXMgd2hpY2ggcmVwcmVzZW50IGEgY29tcGxldGUgbG9zcyBvZgo+PiBjb25zaXN0ZW5j
eSB3aXRoaW4gdGhlIHJjYWNoZSBtZWNoYW5pc20gaXRzZWxmLCBvciBhIGZ1bmRhbWVudGFsCj4+
IGFuZCBvYnZpb3VzIG1pc2NvbmZpZ3VyYXRpb24gYnkgYW4gSU9NTVUgZHJpdmVyLCB0aGUgQlVH
X09OKCkgaW4KPj4gaW92YV9tYWdhemluZV9mcmVlX3BmbnMoKSBjYW4gYmUgcHJvdm9rZWQgYXQg
bW9yZSBvciBsZXNzIGFueSB0aW1lCj4+IGluIGEgInNwb29reSBhY3Rpb24tYXQtYS1kaXN0YW5j
ZSIgbWFubmVyIGJ5IGFueSBvbGQgZGV2aWNlIGRyaXZlcgo+PiBwYXNzaW5nIG5vbnNlbnNlIHRv
IGRtYV91bm1hcF8qKCkgd2hpY2ggdGhlbiBwcm9wYWdhdGVzIHRocm91Z2ggdG8KPj4gcXVldWVf
aW92YSgpLgo+Pgo+PiBOb3Qgb25seSBpcyB0aGlzIHdlbGwgb3V0c2lkZSB0aGUgSU9WQSBsYXll
cidzIGNvbnRyb2wsIGl0J3MgYWxzbwo+PiBub3doZXJlIG5lYXIgZmF0YWwgZW5vdWdoIHRvIGp1
c3RpZnkgcGFuaWNraW5nIGFueXdheSAtIGFsbCB0aGF0Cj4+IHJlYWxseSBhY2hpZXZlcyBpcyB0
byBtYWtlIGRlYnVnZ2luZyB0aGUgb2ZmZW5kaW5nIGRyaXZlciBtb3JlCj4+IGRpZmZpY3VsdC4g
TGV0J3Mgc2ltcGx5IFdBUk4gYW5kIG90aGVyd2lzZSBpZ25vcmUgYm9ndXMgUEZOcy4KPj4KPj4g
UmVwb3J0ZWQtYnk6IFByYWthc2ggR3VwdGEgPGd1cHRhcEBjb2RlYXVyb3JhLm9yZz4KPj4gU2ln
bmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPj4gLS0tCj4+
IMKgZHJpdmVycy9pb21tdS9pb3ZhLmMgfCA0ICsrKy0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4gCj4gQ29weWluZyBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCgpQZXIgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMu
cnN0LCBJJ20gbm90IGNvbnZpbmNlZCAKdGhpcyBtZWV0cyB0aGUgY3JpdGVyaWEgZm9yIHN0YWJs
ZSwgd2hpY2ggaXMgd2h5IEkgZGVsaWJlcmF0ZWx5IGxlZnQgCnRoYXQgb3V0LiBUaGlzIGNoYW5n
ZSBpc24ndCBmaXhpbmcgYW55IGJ1ZyBpbiBpdHNlbGYsIGl0IGlzIG1lcmVseSAKcmVsYXhpbmcg
YSBiZWhhdmlvdXIgdGhhdCBvbmx5IGNvbWVzIGludG8gcGxheSBpZiBhIHNlcmlvdXMgYW5kIApl
ZmZlY3RpdmVseSB1bnJlY292ZXJhYmxlIGJ1ZyBoYXMgYWxyZWFkeSBvY2N1cnJlZCBlbHNld2hl
cmUuCgpJZiBKb2VyZyBmZWVscyBsaWtlIHNlbmRpbmcgaXQgdG8gc3RhYmxlIGFueXdheSB0aGVu
IGZhaXIgZW5vdWdoLCBidXQgCkZZSSB0aGVyZSBpcyBubyByZWxldmFudCAiRml4ZXMiIHRhZy4K
Cj4gWW91IGNhbiBhZGQKPiBSZXZpZXdlZC1ieTogUHJha2FzaCBHdXB0YSA8Z3VwdGFwQGNvZGVh
dXJvcmEub3JnPgoKVGhhbmtzLApSb2Jpbi4KCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11
L2lvdmEuYyBiL2RyaXZlcnMvaW9tbXUvaW92YS5jCj4+IGluZGV4IDBlNmE5NTM2ZWNhNi4uNjEy
Y2JmNjY4YWRmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvdmEuYwo+PiArKysgYi9k
cml2ZXJzL2lvbW11L2lvdmEuYwo+PiBAQCAtODExLDcgKzgxMSw5IEBAIGlvdmFfbWFnYXppbmVf
ZnJlZV9wZm5zKHN0cnVjdCBpb3ZhX21hZ2F6aW5lICptYWcsCj4+IHN0cnVjdCBpb3ZhX2RvbWFp
biAqaW92YWQpCj4+IMKgwqDCoMKgIGZvciAoaSA9IDAgOyBpIDwgbWFnLT5zaXplOyArK2kpIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW92YSAqaW92YSA9IHByaXZhdGVfZmluZF9pb3Zh
KGlvdmFkLCBtYWctPnBmbnNbaV0pOwo+Pgo+PiAtwqDCoMKgwqDCoMKgwqAgQlVHX09OKCFpb3Zh
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChXQVJOX09OKCFpb3ZhKSkKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29udGludWU7Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqDCoCBwcml2YXRlX2Zy
ZWVfaW92YShpb3ZhZCwgaW92YSk7Cj4+IMKgwqDCoMKgIH0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lvbW11
