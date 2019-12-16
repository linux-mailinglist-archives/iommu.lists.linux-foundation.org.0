Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 558161219B5
	for <lists.iommu@lfdr.de>; Mon, 16 Dec 2019 20:11:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D526A881E9;
	Mon, 16 Dec 2019 19:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrkV9PSAH7Zl; Mon, 16 Dec 2019 19:11:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5BD74881D0;
	Mon, 16 Dec 2019 19:11:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E57CC077D;
	Mon, 16 Dec 2019 19:11:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40289C077D
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 19:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 29B35868C0
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 19:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TE-nkQODR-DW for <iommu@lists.linux-foundation.org>;
 Mon, 16 Dec 2019 19:11:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 43EF3868A8
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 19:11:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 11:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="212129807"
Received: from chenyian-desk1.amr.corp.intel.com (HELO [10.3.52.63])
 ([10.3.52.63])
 by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2019 11:11:37 -0800
Subject: Re: [PATCH 0/3] iommu/vt-d bad RMRR workarounds
To: Lu Baolu <baolu.lu@linux.intel.com>, Barret Rhoden <brho@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Sohil Mehta <sohil.mehta@intel.com>
References: <20191211194606.87940-1-brho@google.com>
 <35f49464-0ce5-9998-12a0-624d9683ea18@linux.intel.com>
 <8a530d5c-22e1-3c2f-98df-45028cc6c771@google.com>
 <02d69d9a-9c45-d9e7-4c1a-cb5e50590c47@linux.intel.com>
From: "Chen, Yian" <yian.chen@intel.com>
Message-ID: <c9e97080-eae3-efbd-0ba8-c4794f442c6b@intel.com>
Date: Mon, 16 Dec 2019 11:11:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <02d69d9a-9c45-d9e7-4c1a-cb5e50590c47@linux.intel.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, x86@kernel.org,
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

CgpPbiAxMi8xMy8yMDE5IDU6NTIgUE0sIEx1IEJhb2x1IHdyb3RlOgo+Cj4gT24gMTIvMTMvMTkg
MTA6MzEgUE0sIEJhcnJldCBSaG9kZW4gd3JvdGU6Cj4+IE9uIDEyLzExLzE5IDk6NDMgUE0sIEx1
IEJhb2x1IHdyb3RlOgo+Pj4gVGhlIFZULWQgc3BlYyBkZWZpbmVzIHRoZSBCSU9TIGNvbnNpZGVy
YXRpb25zIGFib3V0IFJNUlIgaW4gc2VjdGlvbiAKPj4+IDguNDoKPj4+Cj4+PiAiCj4+PiBCSU9T
IG11c3QgcmVwb3J0IHRoZSBSTVJSIHJlcG9ydGVkIG1lbW9yeSBhZGRyZXNzZXMgYXMgcmVzZXJ2
ZWQgKG9yIGFzCj4+PiBFRkkgcnVudGltZSkgaW4gdGhlIHN5c3RlbSBtZW1vcnkgbWFwIHJldHVy
bmVkIHRocm91Z2ggbWV0aG9kcyBzdWNoIGFzCj4+PiBJTlQxNSwgRUZJIEdldE1lbW9yeU1hcCBl
dGMuCj4+PiAiCj4+Pgo+Pj4gU28gd2Ugc2hvdWxkIHRyZWF0IGl0IGFzIGZpcm13YXJlIGJ1ZyBp
ZiB0aGUgUk1SUiByYW5nZSBpcyBub3QgCj4+PiBtYXBwZWQgYXMKPj4+IFJFU0VSVkVEIGluIHRo
ZSBzeXN0ZW0gbWVtb3J5IG1hcCB0YWJsZS4KPj4+Cj4+PiBBcyBmb3IgaG93IHNob3VsZCB0aGUg
ZHJpdmVyIGhhbmRsZSB0aGlzIGNhc2UsIGlnbm9yaW5nIGJ1Z2d5IFJNUlIgd2l0aAo+Pj4gYSB3
YXJuaW5nIG1lc3NhZ2UgbWlnaHQgYmUgYSBwb3NzaWJsZSBjaG9pY2UuCj4+Cj4+IEFncmVlZCwg
ZmlybXdhcmUgc2hvdWxkIG5vdCBiZSBkb2luZyB0aGlzLsKgIE15IGZpcnN0IHBhdGNoIGp1c3Qg
c2tpcHMgCj4+IHRob3NlIGVudHJpZXMsIGluc3RlYWQgb2YgYWJvcnRpbmcgRE1BUiBwcm9jZXNz
aW5nLCBhbmQga2VlcHMgdGhlIAo+PiB3YXJuaW5nLgo+Pgo+Cj4gSGkgWWlhbiwKPgo+IERvZXMg
dGhpcyB3b3JrIGZvciB5b3U/Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gYmFvbHUKPgo+CkkgbWFkZSBh
IGNvbW1lbnQgaW4gdGhlIHRoZSBwYXRjaCBlbWFpbCAiW1BBVENIIDEvM10gaW9tbXUvdnQtZDog
c2tpcCAKUk1SUiBlbnRyaWVzIHRoYXQgZmFpbCB0aGUgc2FuaXR5IGNoZWNrICIKdGhhbmtzLApZ
aWFuCgo+PiBTbyBsb25nIGFzIHRoZSBtYWNoaW5lIHN0aWxsIGJvb3RzIGluIGEgc2FmZSBtYW5u
ZXIsIEknbSByZWFzb25hYmx5IAo+PiBoYXBweS4KPj4KPj4gVGhhbmtzLAo+Pgo+PiBCYXJyZXQK
Pj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlv
bW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
