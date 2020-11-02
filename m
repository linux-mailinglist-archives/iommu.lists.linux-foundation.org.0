Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F32A22E4
	for <lists.iommu@lfdr.de>; Mon,  2 Nov 2020 03:07:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A11B8687A;
	Mon,  2 Nov 2020 02:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P71e+QLoUsmK; Mon,  2 Nov 2020 02:07:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80F7F86871;
	Mon,  2 Nov 2020 02:07:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68554C0051;
	Mon,  2 Nov 2020 02:07:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5527BC0051
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 02:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 48D808743D
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 02:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaRfDSkQMiS8 for <iommu@lists.linux-foundation.org>;
 Mon,  2 Nov 2020 02:07:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6F07087437
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 02:07:23 +0000 (UTC)
IronPort-SDR: QixagpAMC7o/nVjm2D3xJ89Pyw3Qf72+YpucNNnoQT8JytYbZMpJdugL+0P9LLKNAYZWyFet7Y
 mHLng2m/Bnag==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="155810062"
X-IronPort-AV: E=Sophos;i="5.77,443,1596524400"; d="scan'208";a="155810062"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 18:07:22 -0800
IronPort-SDR: O/lSjeHppVwIa8kesMLcYMknp+CrstaTpLi/t6DayECS/VYRvc9ZB0E5Bb5pyK4/f+FhUlFaKp
 SMosrengpVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,443,1596524400"; d="scan'208";a="357184384"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2020 18:07:19 -0800
Subject: Re: [PATCH v4 0/7] Convert the intel iommu driver to the dma-iommu api
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Tom Murphy <murphyt7@tcd.ie>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@infradead.org>
References: <20200927063437.13988-1-baolu.lu@linux.intel.com>
 <e999e371-6d36-ffea-542f-a5f4b230b0ed@linux.intel.com>
 <c2af9a9d-1cae-b8f7-a0b3-880574060a23@linux.intel.com>
 <8bac9e91-36a0-c1d6-a887-4d60567ac75a@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <3f5694f3-62f9-cc2b-1c2b-f9e99a4788c1@linux.intel.com>
Date: Mon, 2 Nov 2020 10:00:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8bac9e91-36a0-c1d6-a887-4d60567ac75a@linux.intel.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, Intel-gfx@lists.freedesktop.org,
 Ashok Raj <ashok.raj@intel.com>, iommu@lists.linux-foundation.org
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

SGkgVHZydGtvLAoKT24gMTAvMTIvMjAgNDo0NCBQTSwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4g
Cj4gT24gMjkvMDkvMjAyMCAwMToxMSwgTHUgQmFvbHUgd3JvdGU6Cj4+IEhpIFR2cnRrbywKPj4K
Pj4gT24gOS8yOC8yMCA1OjQ0IFBNLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPj4+Cj4+PiBPbiAy
Ny8wOS8yMDIwIDA3OjM0LCBMdSBCYW9sdSB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IFRoZSBw
cmV2aW91cyBwb3N0IG9mIHRoaXMgc2VyaWVzIGNvdWxkIGJlIGZvdW5kIGhlcmUuCj4+Pj4KPj4+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yMDIwMDkxMjAzMjIwMC4xMTQ4
OS0xLWJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbS8gCj4+Pj4KPj4+Pgo+Pj4+IFRoaXMgdmVyc2lv
biBpbnRyb2R1Y2UgYSBuZXcgcGF0Y2ggWzQvN10gdG8gZml4IGFuIGlzc3VlIHJlcG9ydGVkIGhl
cmUuCj4+Pj4KPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS81MWExYmFl
Yy00OGQxLWMwYWMtMTgxYi0xZmJhOTJhYTQyOGRAbGludXguaW50ZWwuY29tLyAKPj4+Pgo+Pj4+
Cj4+Pj4gVGhlcmUgYXJlbid0IGFueSBvdGhlciBjaGFuZ2VzLgo+Pj4+Cj4+Pj4gUGxlYXNlIGhl
bHAgdG8gdGVzdCBhbmQgcmV2aWV3Lgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+IGJhb2x1
Cj4+Pj4KPj4+PiBMdSBCYW9sdSAoMyk6Cj4+Pj4gwqDCoCBpb21tdTogQWRkIHF1aXJrIGZvciBJ
bnRlbCBncmFwaGljIGRldmljZXMgaW4gbWFwX3NnCj4+Pgo+Pj4gU2luY2UgSSBkbyBoYXZlIHBh
dGNoZXMgdG8gZml4IGk5MTUgdG8gaGFuZGxlIHRoaXMsIGRvIHdlIHdhbnQgdG8gCj4+PiBjby1v
cmRpbmF0ZSB0aGUgdHdvIGFuZCBhdm9pZCBoYXZpbmcgdG8gYWRkIHRoaXMgcXVpcmsgYW5kIHRo
ZW4gbGF0ZXIgCj4+PiByZW1vdmUgaXQ/IE9yIHlvdSB3YW50IHRvIGdvIHRoZSBzdGFnZWQgYXBw
cm9hY2g/Cj4+Cj4+IEkgaGF2ZSBubyBwcmVmZXJlbmNlLiBJdCBkZXBlbmRzIG9uIHdoaWNoIHBh
dGNoIGdvZXMgZmlyc3QuIExldCB0aGUKPj4gbWFpbnRhaW5lcnMgaGVscCBoZXJlLgo+IAo+IEZZ
SSB3ZSBoYXZlIG1lcmdlZCB0aGUgcmVxdWlyZWQgaTkxNSBwYXRjaGVzIHRvIG91dCB0cmVlIGxh
c3Qgd2VlayBvciAKPiBzby4gSSAqdGhpbmsqIHRoaXMgbWVhbnMgdGhleSB3aWxsIGdvIGludG8g
NS4xMS4gU28gdGhlIGk5MTUgc3BlY2lmaWMgCj4gd29ya2Fyb3VuZCBwYXRjaCB3aWxsIG5vdCBi
ZSBuZWVkZWQgaW4gSW50ZWwgSU9NTVUuCgpEbyB5b3UgbWluZCB0ZWxsaW5nIG1lIHdoYXQncyB0
aGUgc3RhdHVzIG9mIHRoaXMgZml4IHBhdGNoPyBJIHRyaWVkIHRoaXMKc2VyaWVzIG9uIHY1LjEw
LXJjMSB3aXRoIHRoZSBncmFwaGljIHF1aXJrIHBhdGNoIGRyb3BwZWQuIEkgYW0gc3RpbGwKc2Vl
aW5nIGRtYSBmYXVsdHMgZnJvbSBncmFwaGljIGRldmljZS4KCkJlc3QgcmVnYXJkcywKYmFvbHUK
Cj4gCj4gUmVnYXJkcywKPiAKPiBUdnJ0a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lvbW11
