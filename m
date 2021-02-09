Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB7A314BD5
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 10:39:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2EBA78621D;
	Tue,  9 Feb 2021 09:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SY7OyTbPgoTs; Tue,  9 Feb 2021 09:18:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1A9B485B11;
	Tue,  9 Feb 2021 09:18:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02EF8C013A;
	Tue,  9 Feb 2021 09:18:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D58C4C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C992A870D1
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLBesQP9rpUQ for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 09:18:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC2CA870C7
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:18:06 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DZchc0Dr5z165bR;
 Tue,  9 Feb 2021 17:16:32 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.87) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Tue, 9 Feb 2021
 17:17:46 +0800
Subject: Re: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory pin
To: Andy Lutomirski <luto@amacapital.net>
References: <1612685884-19514-2-git-send-email-wangzhou1@hisilicon.com>
 <ED58431F-5972-47D1-BF50-93A20AD86C46@amacapital.net>
From: Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <2e6cf99f-beb6-9bef-1316-5e58fb0aa86e@hisilicon.com>
Date: Tue, 9 Feb 2021 17:17:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <ED58431F-5972-47D1-BF50-93A20AD86C46@amacapital.net>
X-Originating-IP: [10.40.188.87]
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, kevin.tian@intel.com,
 Sihang Chen <chensihang1@hisilicon.com>, jgg@ziepe.ca,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 gregkh@linuxfoundation.org, zhangfei.gao@linaro.org,
 Andrew Morton <akpm@linux-foundation.org>, liguozhu@hisilicon.com,
 linux-arm-kernel@lists.infradead.org
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

T24gMjAyMS8yLzggNjowMiwgQW5keSBMdXRvbWlyc2tpIHdyb3RlOgo+IAo+IAo+PiBPbiBGZWIg
NywgMjAyMSwgYXQgMTI6MzEgQU0sIFpob3UgV2FuZyA8d2FuZ3pob3UxQGhpc2lsaWNvbi5jb20+
IHdyb3RlOgo+Pgo+PiDvu79TVkEoc2hhcmUgdmlydHVhbCBhZGRyZXNzKSBvZmZlcnMgYSB3YXkg
Zm9yIGRldmljZSB0byBzaGFyZSBwcm9jZXNzIHZpcnR1YWwKPj4gYWRkcmVzcyBzcGFjZSBzYWZl
bHksIHdoaWNoIG1ha2VzIG1vcmUgY29udmVuaWVudCBmb3IgdXNlciBzcGFjZSBkZXZpY2UKPj4g
ZHJpdmVyIGNvZGluZy4gSG93ZXZlciwgSU8gcGFnZSBmYXVsdHMgbWF5IGhhcHBlbiB3aGVuIGRv
aW5nIERNQQo+PiBvcGVyYXRpb25zLiBBcyB0aGUgbGF0ZW5jeSBvZiBJTyBwYWdlIGZhdWx0IGlz
IHJlbGF0aXZlbHkgYmlnLCBETUEKPj4gcGVyZm9ybWFuY2Ugd2lsbCBiZSBhZmZlY3RlZCBzZXZl
cmVseSB3aGVuIHRoZXJlIGFyZSBJTyBwYWdlIGZhdWx0cy4KPj4gRnJvbSBhIGxvbmcgdGVybSB2
aWV3LCBETUEgcGVyZm9ybWFuY2Ugd2lsbCBiZSBub3Qgc3RhYmxlLgo+Pgo+PiBJbiBoaWdoLXBl
cmZvcm1hbmNlIEkvTyBjYXNlcywgYWNjZWxlcmF0b3JzIG1pZ2h0IHdhbnQgdG8gcGVyZm9ybQo+
PiBJL08gb24gYSBtZW1vcnkgd2l0aG91dCBJTyBwYWdlIGZhdWx0cyB3aGljaCBjYW4gcmVzdWx0
IGluIGRyYW1hdGljYWxseQo+PiBpbmNyZWFzZWQgbGF0ZW5jeS4gQ3VycmVudCBtZW1vcnkgcmVs
YXRlZCBBUElzIGNvdWxkIG5vdCBhY2hpZXZlIHRoaXMKPj4gcmVxdWlyZW1lbnQsIGUuZy4gbWxv
Y2sgY2FuIG9ubHkgYXZvaWQgbWVtb3J5IHRvIHN3YXAgdG8gYmFja3VwIGRldmljZSwKPj4gcGFn
ZSBtaWdyYXRpb24gY2FuIHN0aWxsIHRyaWdnZXIgSU8gcGFnZSBmYXVsdC4KPj4KPj4gVmFyaW91
cyBkcml2ZXJzIHdvcmtpbmcgdW5kZXIgdHJhZGl0aW9uYWwgbm9uLVNWQSBtb2RlIGFyZSB1c2lu
Zwo+PiB0aGVpciBvd24gc3BlY2lmaWMgaW9jdGwgdG8gZG8gcGluLiBTdWNoIGlvY3RsIGNhbiBi
ZSBzZWVuIGluIHY0bDIsCj4+IGdwdSwgaW5maW5pYmFuZCwgbWVkaWEsIHZmaW8sIGV0Yy4gRHJp
dmVycyBhcmUgdXN1YWxseSBkb2luZyBkbWEKPj4gbWFwcGluZyB3aGlsZSBkb2luZyBwaW4uCj4+
Cj4+IEJ1dCwgaW4gU1ZBIG1vZGUsIHBpbiBjb3VsZCBiZSBhIGNvbW1vbiBuZWVkIHdoaWNoIGlz
bid0IG5lY2Vzc2FyaWx5Cj4+IGJvdW5kIHdpdGggYW55IGRyaXZlcnMsIGFuZCBuZWl0aGVyIGlz
IGRtYSBtYXBwaW5nIG5lZWRlZCBieSBkcml2ZXJzCj4+IHNpbmNlIGRldmljZXMgYXJlIHVzaW5n
IHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2YgQ1BVLiBUaHVzLCBJdCBpcyBiZXR0ZXIKPj4gdG8gaW50
cm9kdWNlIGEgbmV3IGNvbW1vbiBzeXNjYWxsIGZvciBpdC4KPj4KPj4gVGhpcyBwYXRjaCBsZXZl
cmFnZXMgdGhlIGRlc2lnbiBvZiB1c2VyZmF1bHRmZCBhbmQgYWRkcyBtZW1waW5mZCBmb3IgcGlu
Cj4+IHRvIGF2b2lkIG1lc3NpbmcgdXAgbW1fc3RydWN0LiBBIGZkIHdpbGwgYmUgZ290IGJ5IG1l
bXBpbmZkLCB0aGVuIHVzZXIKPj4gc3BhY2UgY2FuIGRvIHBpbi91bnBpbiBwYWdlcyBieSBpb2N0
bHMgb2YgdGhpcyBmZCwgYWxsIHBpbm5lZCBwYWdlcyB1bmRlcgo+PiBvbmUgZmlsZSB3aWxsIGJl
IHVucGlubmVkIGluIGZpbGUgcmVsZWFzZSBwcm9jZXNzLiBMaWtlIHBpbiBwYWdlIGNhc2VzIGlu
Cj4+IG90aGVyIHBsYWNlcywgY2FuX2RvX21sb2NrIGlzIHVzZWQgdG8gY2hlY2sgcGVybWlzc2lv
biBhbmQgaW5wdXQKPj4gcGFyYW1ldGVycy4KPiAKPiAKPiBDYW4geW91IGRvY3VtZW50IHdoYXQg
dGhlIHN5c2NhbGwgZG9lcz8KCldpbGwgYWRkIHJlbGF0ZWQgZG9jdW1lbnQgaW4gRG9jdW1lbnRh
dGlvbi92bS4KCj4gCj4gVXNlcmZhdWx0ZmQgaXMgYW4gZmQgYmVjYXVzZSBvbmUgcHJvZ3JhbSBj
b250cm9scyBhbm90aGVyLiAgSXMgbWVtcGluZmQgbGlrZSB0aGlzPwoKV2UgdXNlIG1lbXBpbmZk
IGxpa2U6IChzZWUgcGF0Y2ggMi8yKQoKZmQgPSBtZW1waW5mZCgpOwp2YSA9IG1hbGxvYyhzaXpl
KTsKc3RydWN0IG1lbV9waW5fYWRkcmVzcyBhZGRyOwphZGRyLnZhID0gdmE7CmFkZHIuc2l6ZSA9
IHNpemU7CmlvY3RsKGZkLCBNRU1fQ01EX1BJTiwgJmFkZHIpOwppb2N0bChmZCwgTUVNX0NNRF9V
TlBJTiwgJmFkZHIpOwpjbG9zZShmZCk7CgpCZXN0LApaaG91Cgo+IC4KPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdApp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
