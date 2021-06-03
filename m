Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 516513997E9
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 04:10:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0698C40511;
	Thu,  3 Jun 2021 02:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PajoUo9dp77e; Thu,  3 Jun 2021 02:10:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED5504058B;
	Thu,  3 Jun 2021 02:10:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D19BC0011;
	Thu,  3 Jun 2021 02:10:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D41FC0001;
 Thu,  3 Jun 2021 01:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57F29608A1;
 Thu,  3 Jun 2021 01:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGtd2ky1FTCa; Thu,  3 Jun 2021 01:56:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE34260692;
 Thu,  3 Jun 2021 01:56:34 +0000 (UTC)
IronPort-SDR: UdFsKqfpgZfim5oXUtmO+BE+bC9mrAyHOkdhXV0OKpOBJNaqhJ0ZzwTBzNiF6EPh+e8yHDLaac
 k4fhB8yNZBMA==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="183622526"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="183622526"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 18:56:33 -0700
IronPort-SDR: C5MKCIFgSivqj4s0xMPWU5bJ61YOvmOkiOYqHbOXSTq5KqhrzVWVu5om4euFeO0TYD42KUMP+C
 3oyspki/GTFg==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="550518879"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.87.193])
 ([10.209.87.193])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 18:56:28 -0700
Subject: Re: Virtio hardening for TDX
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20210603004133.4079390-1-ak@linux.intel.com>
 <63d01084-68d2-a8d5-931d-541a22b5f231@redhat.com>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <33504152-624a-45cc-51b3-10ce7aa2428f@linux.intel.com>
Date: Wed, 2 Jun 2021 18:56:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <63d01084-68d2-a8d5-931d-541a22b5f231@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 03 Jun 2021 02:10:48 +0000
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 jpoimboe@redhat.com, robin.murphy@arm.com, hch@lst.de
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

Cj4gTm90ZSB0aGF0IGl0J3MgcHJvYmFibHkgbmVlZGVkIGJ5IG90aGVyIGNhc2VzIGFzIHdlbGw6
Cj4KPiAxKSBPdGhlciBlbmNyeXB0ZWQgVk0gdGVjaG5vbG9neQo+IDIpIFZEVVNFWzFdCj4gMykg
U21hcnQgTklDcwoKUmlnaHQuIEkgZG9uJ3Qgc2VlIGFueSByZWFzb24gd2h5IHRoZXNlIHNob3Vs
ZG4ndCB3b3JrLiBZb3UgbWF5IGp1c3QgCm5lZWQgdG8gYWRkIHRoZSBlbmFibGUgZm9yIHRoZSBs
b2NrZG93biwgYnV0IHlvdSBjYW4gcmV1c2UgdGhlIGJhc2ljIAppbmZyYXN0cnVjdHVyZS4KCj4K
PiBXZSBoYXZlIGFscmVhZHkgaGFkIGRpc2N1c3Npb25zIGFuZCBzb21lIHBhdGNoZXMgaGF2ZSBi
ZWVuIAo+IHBvc3RlZFsyXVszXVs0XS4KClRoYW5rcy4KClllcyBbMl0gaXMgaW5kZWVkIGFuIGFs
dGVybmF0aXZlLiBXZSBjb25zaWRlcmVkIHRoaXMgYXQgc29tZSBwb2ludCwgYnV0IApzaW5jZSB3
ZSBkb24ndCBjYXJlIGFib3V0IERPUyBpbiBvdXIgY2FzZSBpdCBzZWVtZWQgc2ltcGxlciB0byBq
dXN0IApoYXJkZW4gdGhlIGV4aXN0aW5nIGNvZGUuwqAgQnV0IHllcyBpZiBpdCdzIHRoZXJlIGl0
J3MgdXNlZnVsIGZvciBURFggdG9vLgoKRldJVyBJIHdvdWxkIGFyZ3VlIHRoYXQgdGhlIGRlc2Ny
aXB0b3IgYm91bmRhcnkgY2hlY2tpbmcgc2hvdWxkIGJlIGFkZGVkIAppbiBhbnkgY2FzZSwgc2Vj
dXJpdHkgY2FzZSBvciBzZXBhcmF0ZWQgbWV0YWRhdGEgb3Igbm90LCBiZWNhdXNlIGl0IGNhbiAK
Y2F0Y2ggYnVncyBhbmQgaXMgdmVyeSBjaGVhcC4gQ2hlY2tpbmcgYm91bmRhcmllcyBpcyBnb29k
IHByYWN0aWNlLgoKWzRdIHdvdWxkIGJlIGFuIGluZGVwZW5kZW50IGlzc3VlLCB0aGF0J3Mgc29t
ZXRoaW5nIHdlIGRpZG4ndCBjYXRjaC4KCkFsc28gdGhlIHN3aW90bGIgaGFyZGVuaW5nIGltcGxl
bWVudGVkIGluIHRoaXMgcGF0Y2hraXQgZG9lc24ndCBzZWVtIHRvIApiZSBpbiBhbnkgb2YgdGhl
IG90aGVyIHBhdGNoZXMuCgpTbyBJIHdvdWxkIHNheSBteSBwYXRjaGVzIGFyZSBtb3N0bHkgb3J0
aG9nb25hbCB0byB0aGVzZSBwYXRjaGVzIGJlbG93IAphbmQgbm90IGNvbmZsaWN0aW5nLCBldmVu
IHRob3VnaCB0aGV5IGFkZHJlc3MgYSBzaW1pbGFyIHByb2JsZW0gc3BhY2UuCgotQW5kaQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxp
bmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
