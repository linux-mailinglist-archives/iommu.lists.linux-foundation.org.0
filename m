Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id F308D3DA5BB
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 16:10:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 822E783AA8;
	Thu, 29 Jul 2021 14:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swX9wX0sNdWs; Thu, 29 Jul 2021 14:10:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 92937829A9;
	Thu, 29 Jul 2021 14:10:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5750CC0022;
	Thu, 29 Jul 2021 14:10:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2115C000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 14:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838BD60624
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 14:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n811Q6za2T1O for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 14:10:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70B2E6061F
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 14:10:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="234784509"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="234784509"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 07:09:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="581353306"
Received: from shuangho-mobl1.amr.corp.intel.com (HELO [10.212.219.154])
 ([10.212.219.154])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 07:09:57 -0700
Subject: Re: [PATCH 03/13] x86/HV: Add new hvcall guest address host
 visibility support
To: Tianyu Lan <ltykernel@gmail.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 rientjes@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-4-ltykernel@gmail.com>
 <a2444c36-0103-8e1c-7005-d97f77f90e85@intel.com>
 <0d956a05-7d24-57a0-f4a9-dccc849b52fc@gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
 z5cecg==
Message-ID: <ec1d4cfd-bbbc-e27a-7589-e85d9f0438f4@intel.com>
Date: Thu, 29 Jul 2021 07:09:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0d956a05-7d24-57a0-f4a9-dccc849b52fc@gmail.com>
Content-Language: en-US
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 anparri@microsoft.com, vkuznets@redhat.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gNy8yOS8yMSA2OjAxIEFNLCBUaWFueXUgTGFuIHdyb3RlOgo+IE9uIDcvMjkvMjAyMSAxOjA2
IEFNLCBEYXZlIEhhbnNlbiB3cm90ZToKPj4gT24gNy8yOC8yMSA3OjUyIEFNLCBUaWFueXUgTGFu
IHdyb3RlOgo+Pj4gQEAgLTE5ODYsNyArMTk4OCw5IEBAIHN0YXRpYyBpbnQgX19zZXRfbWVtb3J5
X2VuY19kZWModW5zaWduZWQgbG9uZwo+Pj4gYWRkciwgaW50IG51bXBhZ2VzLCBib29sIGVuYykK
Pj4+IMKgwqDCoMKgwqAgaW50IHJldDsKPj4+IMKgIMKgwqDCoMKgwqAgLyogTm90aGluZyB0byBk
byBpZiBtZW1vcnkgZW5jcnlwdGlvbiBpcyBub3QgYWN0aXZlICovCj4+PiAtwqDCoMKgIGlmICgh
bWVtX2VuY3J5cHRfYWN0aXZlKCkpCj4+PiArwqDCoMKgIGlmIChodl9pc19pc29sYXRpb25fc3Vw
cG9ydGVkKCkpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGh2X3NldF9tZW1fZW5jKGFkZHIs
IG51bXBhZ2VzLCBlbmMpOwo+Pj4gK8KgwqDCoCBlbHNlIGlmICghbWVtX2VuY3J5cHRfYWN0aXZl
KCkpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Cj4+IE9uZSBtb3JlIHRoaW5n
LsKgIElmIHlvdSdyZSBnb2luZyB0byBiZSBwYXRjaGluZyBnZW5lcmljIGNvZGUsIHBsZWFzZQo+
PiBzdGFydCB1c2luZyBmZWF0dXJlIGNoZWNrcyB0aGF0IGNhbiBnZXQgb3B0aW1pemVkIGF3YXkg
YXQgcnVudGltZS4KPj4gaHZfaXNfaXNvbGF0aW9uX3N1cHBvcnRlZCgpIGRvZXNuJ3QgbG9vayBs
aWtlIHRoZSB3b3JsZCdzIGNoZWFwZXN0Cj4+IGNoZWNrLsKgIEl0IGNhbid0IGJlIGlubGluZWQg
YW5kIGNvc3RzIGF0IGxlYXN0IGEgZnVuY3Rpb24gY2FsbC4KPiAKPiBZZXMsIHlvdSBhcmUgcmln
aHQuIEhvdyBhYm91dCBhZGRpbmcgYSBzdGF0aWMgYnJhbmNoIGtleSBmb3IgdGhlIGNoZWNrCj4g
b2YgaXNvbGF0aW9uIFZNPyBUaGlzIG1heSByZWR1Y2UgdGhlIGNoZWNrIGNvc3QuCgpJIGRvbid0
IHRoaW5rIHlvdSBuZWVkIGEgc3RhdGljIGtleS4KClRoZXJlIGFyZSBiYXNpY2FsbHkgdGhyZWUg
Y2hvaWNlczoKMS4gVXNlIGFuIGV4aXN0aW5nIFg4Nl9GRUFUVVJFIGJpdC4gIEkgdGhpbmsgdGhl
cmUncyBhbHJlYWR5IG9uZSBmb3IKICAgd2hlbiB5b3UgYXJlIHJ1bm5pbmcgdW5kZXIgYSBoeXBl
cnZpc29yLiAgSXQncyBub3Qgc3VwZXIgcHJlY2lzZSwKICAgYnV0IGl0J3MgYmV0dGVyIHRoYW4g
d2hhdCB5b3UgaGF2ZS4KMi4gRGVmaW5lIGEgbmV3IFg4Nl9GRUFUVVJFIGJpdCBmb3Igd2hlbiB5
b3UgYXJlIHJ1bm5pbmcgdW5kZXIKICAgSHlwZXItVi4KMy4gRGVmaW5lIGEgbmV3IFg4Nl9GRUFU
VVJFIGJpdCBzcGVjaWZpY2FsbHkgZm9yIEh5cGVyLVYgaXNvbGF0aW9uIFZNCiAgIHN1cHBvcnQu
ICBUaGlzIHBhcnRpY3VsYXIgZmVhdHVyZSBtaWdodCBiZSBhIGxpdHRsZSB1bmNvbW1vbiB0bwog
ICBkZXNlcnZlIGl0cyBvd24gYml0LgoKSSdkIHByb2JhYmx5IGp1c3QgZG8gIzIuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlz
dAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
