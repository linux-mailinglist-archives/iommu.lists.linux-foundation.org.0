Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F04F2A3FC1
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 10:14:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4511F85FC6;
	Tue,  3 Nov 2020 09:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiHq34oYsgSZ; Tue,  3 Nov 2020 09:14:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7725085F8E;
	Tue,  3 Nov 2020 09:14:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 626F3C0889;
	Tue,  3 Nov 2020 09:14:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 698B6C0889
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 50F7D2051A
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uuderl312P0 for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 09:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by silver.osuosl.org (Postfix) with ESMTPS id 38F3520518
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:14:40 +0000 (UTC)
IronPort-SDR: MFYwsE0YfSKI25Y1GbOfyMTbqrpu/0FbVk+5M+s9l9BGzrZfrt/LM6tCuTtY8EHu3QSYD4H/Nf
 RdkkOaI4nVEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="169155704"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; d="scan'208";a="169155704"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 01:14:39 -0800
IronPort-SDR: eFTHNZBxqYN5dcGuDSmldVZPzDXE44+XDO/whjJgYBwHJ7nuOWNzglzewY25fZHYRAKFkkk21v
 lfzYIUGSFTkg==
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; d="scan'208";a="538418690"
Received: from vfarcas-mobl.ger.corp.intel.com (HELO [10.214.241.76])
 ([10.214.241.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 01:14:35 -0800
Subject: Re: [PATCH v4 0/7] Convert the intel iommu driver to the dma-iommu api
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Tom Murphy <murphyt7@tcd.ie>, David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@infradead.org>
References: <20200927063437.13988-1-baolu.lu@linux.intel.com>
 <e999e371-6d36-ffea-542f-a5f4b230b0ed@linux.intel.com>
 <c2af9a9d-1cae-b8f7-a0b3-880574060a23@linux.intel.com>
 <8bac9e91-36a0-c1d6-a887-4d60567ac75a@linux.intel.com>
 <3f5694f3-62f9-cc2b-1c2b-f9e99a4788c1@linux.intel.com>
 <1ce5b94a-38b3-548e-3b1a-a68390b93953@linux.intel.com>
 <82dab98e-0761-8946-c31c-92f19a0615b4@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <99a0d1eb-7fde-dff4-225f-92b68fbf7620@linux.intel.com>
Date: Tue, 3 Nov 2020 09:14:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <82dab98e-0761-8946-c31c-92f19a0615b4@linux.intel.com>
Content-Language: en-US
Cc: Intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>, iommu@lists.linux-foundation.org,
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

CgpPbiAwMy8xMS8yMDIwIDAyOjUzLCBMdSBCYW9sdSB3cm90ZToKPiBPbiAxMS8yLzIwIDc6NTIg
UE0sIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+Pgo+PiBPbiAwMi8xMS8yMDIwIDAyOjAwLCBMdSBC
YW9sdSB3cm90ZToKPj4+IEhpIFR2cnRrbywKPj4+IE9uIDEwLzEyLzIwIDQ6NDQgUE0sIFR2cnRr
byBVcnN1bGluIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjkvMDkvMjAyMCAwMToxMSwgTHUgQmFvbHUg
d3JvdGU6Cj4+Pj4+IEhpIFR2cnRrbywKPj4+Pj4KPj4+Pj4gT24gOS8yOC8yMCA1OjQ0IFBNLCBU
dnJ0a28gVXJzdWxpbiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBPbiAyNy8wOS8yMDIwIDA3OjM0LCBM
dSBCYW9sdSB3cm90ZToKPj4+Pj4+PiBIaSwKPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBwcmV2aW91cyBw
b3N0IG9mIHRoaXMgc2VyaWVzIGNvdWxkIGJlIGZvdW5kIGhlcmUuCj4+Pj4+Pj4KPj4+Pj4+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yMDIwMDkxMjAzMjIwMC4xMTQ4OS0x
LWJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbS8gCj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMg
dmVyc2lvbiBpbnRyb2R1Y2UgYSBuZXcgcGF0Y2ggWzQvN10gdG8gZml4IGFuIGlzc3VlIHJlcG9y
dGVkIAo+Pj4+Pj4+IGhlcmUuCj4+Pj4+Pj4KPj4+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1pb21tdS81MWExYmFlYy00OGQxLWMwYWMtMTgxYi0xZmJhOTJhYTQyOGRAbGludXgu
aW50ZWwuY29tLyAKPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlcmUgYXJlbid0IGFueSBvdGhl
ciBjaGFuZ2VzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gUGxlYXNlIGhlbHAgdG8gdGVzdCBhbmQgcmV2aWV3
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+Pj4+IGJhb2x1Cj4+Pj4+Pj4KPj4+
Pj4+PiBMdSBCYW9sdSAoMyk6Cj4+Pj4+Pj4gwqDCoCBpb21tdTogQWRkIHF1aXJrIGZvciBJbnRl
bCBncmFwaGljIGRldmljZXMgaW4gbWFwX3NnCj4+Pj4+Pgo+Pj4+Pj4gU2luY2UgSSBkbyBoYXZl
IHBhdGNoZXMgdG8gZml4IGk5MTUgdG8gaGFuZGxlIHRoaXMsIGRvIHdlIHdhbnQgdG8gCj4+Pj4+
PiBjby1vcmRpbmF0ZSB0aGUgdHdvIGFuZCBhdm9pZCBoYXZpbmcgdG8gYWRkIHRoaXMgcXVpcmsg
YW5kIHRoZW4gCj4+Pj4+PiBsYXRlciByZW1vdmUgaXQ/IE9yIHlvdSB3YW50IHRvIGdvIHRoZSBz
dGFnZWQgYXBwcm9hY2g/Cj4+Pj4+Cj4+Pj4+IEkgaGF2ZSBubyBwcmVmZXJlbmNlLiBJdCBkZXBl
bmRzIG9uIHdoaWNoIHBhdGNoIGdvZXMgZmlyc3QuIExldCB0aGUKPj4+Pj4gbWFpbnRhaW5lcnMg
aGVscCBoZXJlLgo+Pj4+Cj4+Pj4gRllJIHdlIGhhdmUgbWVyZ2VkIHRoZSByZXF1aXJlZCBpOTE1
IHBhdGNoZXMgdG8gb3V0IHRyZWUgbGFzdCB3ZWVrIAo+Pj4+IG9yIHNvLiBJICp0aGluayogdGhp
cyBtZWFucyB0aGV5IHdpbGwgZ28gaW50byA1LjExLiBTbyB0aGUgaTkxNSAKPj4+PiBzcGVjaWZp
YyB3b3JrYXJvdW5kIHBhdGNoIHdpbGwgbm90IGJlIG5lZWRlZCBpbiBJbnRlbCBJT01NVS4KPj4+
Cj4+PiBEbyB5b3UgbWluZCB0ZWxsaW5nIG1lIHdoYXQncyB0aGUgc3RhdHVzIG9mIHRoaXMgZml4
IHBhdGNoPyBJIHRyaWVkIHRoaXMKPj4+IHNlcmllcyBvbiB2NS4xMC1yYzEgd2l0aCB0aGUgZ3Jh
cGhpYyBxdWlyayBwYXRjaCBkcm9wcGVkLiBJIGFtIHN0aWxsCj4+PiBzZWVpbmcgZG1hIGZhdWx0
cyBmcm9tIGdyYXBoaWMgZGV2aWNlLgo+Pgo+PiBIbW0gYmFjayB0aGVuIEkgdGhvdWdodCBpOTE1
IGZpeGVzIGZvciB0aGlzIHdvdWxkIGxhbmQgaW4gNS4xMSBzbyBJIAo+PiB3aWxsIHN0aWNrIHdp
dGggdGhhdC4gOikgKFNlZSBteSBxdW90ZWQgdGV4dCBhIHBhcmFncmFwaCBhYm92ZSB5b3Vycy4p
Cj4gCj4gV2hhdCBzaXplIGFyZSB0aG9zZSBmaXhlcz8gSSBhbSBjb25zaWRlcmluZyBwdXNoaW5n
IHRoaXMgc2VyaWVzIGZvcgo+IHY1LjExLiBJcyBpdCBwb3NzaWJsZSB0byBnZXQgc29tZSBhY2tz
IGZvciB0aG9zZSBwYXRjaGVzIGFuZCBsZXQgdGhlbQo+IGdvIHRvIExpbnVzIHRocm91Z2ggaW9t
bXUgdHJlZT8KCkZvciA1LjEwIHlvdSBtZWFuPyBUaGV5IGZlZWwgYSBiaXQgdG9vIGxhcmdlIGZv
ciBjb21mb3J0IHRvIGdvIHZpYSBhIApub24taTkxNS9kcm0gdHJlZS4gVGhlc2UgYXJlIHRoZSB0
d28gcGF0Y2hlcyByZXF1aXJlZDoKCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtLWlu
dGVsL2NvbW1pdC8/aD1kcm0taW50ZWwtZ3QtbmV4dCZpZD04YTQ3M2RiYWRjY2ZjNjIwNjE1MGRl
M2RiMzIyM2M0MDc4NWRhMzQ4Cmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtLWludGVs
L2NvbW1pdC8/aD1kcm0taW50ZWwtZ3QtbmV4dCZpZD05MzQ5NDFlZDVhMzA3MGE3ODMzYzY4OGM5
YjFkNzE0ODRmYzAxYTY4CgpJJ2xsIGNvcHkgSm9vbmFzIGFzIG91ciBtYWludGFpbmVyIC0gaG93
IGRvZXMgdGhlIGlkZWEgb2YgdGFraW5nIHRoZSAKYWJvdmUgdHdvIHBhdGNoZXMgdGhyb3VnaCB0
aGUgaW9tbXUgdHJlZSBzb3VuZCB0byB5b3U/CgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdApp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
