Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CB136210512
	for <lists.iommu@lfdr.de>; Wed,  1 Jul 2020 09:32:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 815FA89097;
	Wed,  1 Jul 2020 07:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u33wbWsS7O-z; Wed,  1 Jul 2020 07:32:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 515728908C;
	Wed,  1 Jul 2020 07:32:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3152CC0733;
	Wed,  1 Jul 2020 07:32:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89756C0733
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 07:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6C38D20011
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 07:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWPZQ5Tm4V9T for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 07:32:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id D14441FE49
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 07:32:31 +0000 (UTC)
IronPort-SDR: n+MR4eFhv1l3Xc1C98KWS6WMpV1yPes9WKCo2lhp5YVLf5Zfku5AQHG29jpDyqQhez7hntDSvv
 0h9MB0nSZhqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="145577145"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="145577145"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 00:32:30 -0700
IronPort-SDR: rY7m5Sdzq9E4NKlQ9G3cljrbnk0qrUh/K0wzgG8CpFgIeiOlgJ2oo+NY9+vsI0ztmajo5WTPJJ
 tPhwgQOXsX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="277685135"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.30.5])
 ([10.255.30.5])
 by orsmga003.jf.intel.com with ESMTP; 01 Jul 2020 00:32:24 -0700
Subject: Re: [PATCH 1/2] iommu: Add iommu_group_get/set_domain()
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20200627031532.28046-1-baolu.lu@linux.intel.com>
 <acc0a8fd-bd23-fc34-aecc-67796ab216e7@arm.com>
 <5dc1cece-6111-9b56-d04c-9553d592675b@linux.intel.com>
 <48dd9f1e-c18b-77b7-650a-c35ecbb69f2b@arm.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <c38784ad-9dba-0840-3a61-e2c21e781f1e@linux.intel.com>
Date: Wed, 1 Jul 2020 15:32:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <48dd9f1e-c18b-77b7-650a-c35ecbb69f2b@arm.com>
Content-Language: en-US
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

SGkgUm9iaW4sCgpPbiAyMDIwLzcvMSAwOjUxLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gT24gMjAy
MC0wNi0zMCAwMjowMywgTHUgQmFvbHUgd3JvdGU6Cj4+IEhpIFJvYmluLAo+Pgo+PiBPbiA2LzI5
LzIwIDc6NTYgUE0sIFJvYmluIE11cnBoeSB3cm90ZToKPj4+IE9uIDIwMjAtMDYtMjcgMDQ6MTUs
IEx1IEJhb2x1IHdyb3RlOgo+Pj4+IFRoZSBoYXJkd2FyZSBhc3Npc3RhbnQgdmZpbyBtZWRpYXRl
ZCBkZXZpY2UgaXMgYSB1c2UgY2FzZSBvZiBpb21tdQo+Pj4+IGF1eC1kb21haW4uIFRoZSBpbnRl
cmFjdGlvbnMgYmV0d2VlbiB2ZmlvL21kZXYgYW5kIGlvbW11IGR1cmluZyBtZGV2Cj4+Pj4gY3Jl
YXRpb24gYW5kIHBhc3N0aHIgYXJlOgo+Pj4+Cj4+Pj4gLSBDcmVhdGUgYSBncm91cCBmb3IgbWRl
diB3aXRoIGlvbW11X2dyb3VwX2FsbG9jKCk7Cj4+Pj4gLSBBZGQgdGhlIGRldmljZSB0byB0aGUg
Z3JvdXAgd2l0aAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgZ3JvdXAgPSBpb21tdV9ncm91cF9hbGxv
YygpOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VSUihncm91cCkpCj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoZ3JvdXApOwo+Pj4+Cj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBpb21tdV9ncm91cF9hZGRfZGV2aWNlKGdyb3VwLCAm
bWRldi0+ZGV2KTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmICghcmV0KQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvKCZtZGV2LT5kZXYsICJNREVWOiBncm91
cF9pZCA9ICVkXG4iLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlvbW11X2dyb3VwX2lkKGdyb3VwKSk7Cj4+Pj4gLSBBbGxvY2F0ZSBhbiBh
dXgtZG9tYWluCj4+Pj4gwqDCoMKgwqBpb21tdV9kb21haW5fYWxsb2MoKQo+Pj4+IC0gQXR0YWNo
IHRoZSBhdXgtZG9tYWluIHRvIHRoZSBwaHlzaWNhbCBkZXZpY2UgZnJvbSB3aGljaCB0aGUgbWRl
diBpcwo+Pj4+IMKgwqAgY3JlYXRlZC4KPj4+PiDCoMKgwqDCoGlvbW11X2F1eF9hdHRhY2hfZGV2
aWNlKCkKPj4+Pgo+Pj4+IEluIHRoZSB3aG9sZSBwcm9jZXNzLCBhbiBpb21tdSBncm91cCB3YXMg
YWxsb2NhdGVkIGZvciB0aGUgbWRldiBhbmQgYW4KPj4+PiBpb21tdSBkb21haW4gd2FzIGF0dGFj
aGVkIHRvIHRoZSBncm91cCwgYnV0IHRoZSBncm91cC0+ZG9tYWluIGxlYXZlcwo+Pj4+IE5VTEwu
IEFzIHRoZSByZXN1bHQsIGlvbW11X2dldF9kb21haW5fZm9yX2RldigpIGRvZXNuJ3Qgd29yayBh
bnltb3JlLgo+Pj4+Cj4+Pj4gVGhpcyBhZGRzIGlvbW11X2dyb3VwX2dldC9zZXRfZG9tYWluKCkg
c28gdGhhdCBncm91cC0+ZG9tYWluIGNvdWxkIGJlCj4+Pj4gbWFuYWdlZCB3aGVuZXZlciBhIGRv
bWFpbiBpcyBhdHRhY2hlZCBvciBkZXRhY2hlZCB0aHJvdWdoIHRoZSAKPj4+PiBhdXgtZG9tYWlu
Cj4+Pj4gYXBpJ3MuCj4+Pgo+Pj4gTGV0dGluZyBleHRlcm5hbCBjYWxsZXJzIHBva2UgYXJvdW5k
IGRpcmVjdGx5IGluIHRoZSBpbnRlcm5hbHMgb2YgCj4+PiBpb21tdV9ncm91cCBkb2Vzbid0IGxv
b2sgcmlnaHQgdG8gbWUuCj4+Cj4+IFVuZm9ydHVuYXRlbHksIGl0IHNlZW1zIHRoYXQgdGhlIHZp
Zm8gaW9tbXUgYWJzdHJhY3Rpb24gaXMgZGVlcGx5IGJvdW5kCj4+IHRvIHRoZSBJT01NVSBzdWJz
eXN0ZW0uIFdlIGNhbiBlYXNpbHkgZmluZCBvdGhlciBleGFtcGxlczoKPj4KPj4gaW9tbXVfZ3Jv
dXBfZ2V0L3NldF9pb21tdWRhdGEoKQo+PiBpb21tdV9ncm91cF9nZXQvc2V0X25hbWUoKQo+PiAu
Li4KPiAKPiBTdXJlLCBidXQgdGhvc2UgYXJlIHdheXMgZm9yIHVzZXJzIG9mIGEgZ3JvdXAgdG8g
YXR0YWNoIHVzZWZ1bCAKPiBpbmZvcm1hdGlvbiBvZiB0aGVpciBvd24gdG8gaXQsIHRoYXQgZG9l
c24ndCBtYXR0ZXIgdG8gdGhlIElPTU1VIAo+IHN1YnN5c3RlbSBpdHNlbGYuIFRoZSBpbnRlcmZh
Y2UgeW91J3ZlIHByb3Bvc2VkIGdpdmVzIGNhbGxlcnMgcmljaCBuZXcgCj4gb3Bwb3J0dW5pdGll
cyB0byBmdW5kYW1lbnRhbGx5IGJyZWFrIGNvcnJlY3Qgb3BlcmF0aW9uIG9mIHRoZSBBUEk6Cj4g
Cj4gIMKgwqDCoMKgZG9tID0gaW9tbXVfZG9tYWluX2FsbG9jKCk7Cj4gIMKgwqDCoMKgaW9tbXVf
YXR0YWNoX2dyb3VwKGRvbSwgZ3JwKTsKPiAgwqDCoMKgwqAuLi4KPiAgwqDCoMKgwqBpb21tdV9n
cm91cF9zZXRfZG9tYWluKGdycCwgTlVMTCk7Cj4gIMKgwqDCoMKgLy8gb29wcywgbGVha2VkIGFu
ZCBjYW4ndCBldmVyIGRldGFjaCBwcm9wZXJseSBub3cKPiAKPiBvciBwZXJoYXBzOgo+IAo+ICDC
oMKgwqDCoGdycCA9IGlvbW11X2dyb3VwX2FsbG9jKCk7Cj4gIMKgwqDCoMKgaW9tbXVfZ3JvdXBf
YWRkX2RldmljZShncnAsIGRldik7Cj4gIMKgwqDCoMKgaW9tbXVfZ3JvdXBfc2V0X2RvbWFpbihn
cnAsIGRvbSk7Cj4gIMKgwqDCoMKgLi4uCj4gIMKgwqDCoMKgaW9tbXVfZGV0YWNoX2dyb3VwKGRv
bSwgZ3JwKTsKPiAgwqDCoMKgwqAvLyBvb3BzLCBJT01NVSBkcml2ZXIgbWlnaHQgbm90IGhhbmRs
ZSB0aGlzCj4gCj4+PiBJZiBhIHJlZ3VsYXIgZGV2aWNlIGlzIGF0dGFjaGVkIHRvIG9uZSBvciBt
b3JlIGF1eCBkb21haW5zIGZvciBQQVNJRCAKPj4+IHVzZSwgaW9tbXVfZ2V0X2RvbWFpbl9mb3Jf
ZGV2KCkgaXMgc3RpbGwgZ29pbmcgdG8gcmV0dXJuIHRoZSBwcmltYXJ5IAo+Pj4gZG9tYWluLCBz
byB3aHkgc2hvdWxkIGl0IGJlIGV4cGVjdGVkIHRvIGJlaGF2ZSBkaWZmZXJlbnRseSBmb3IgbWVk
aWF0ZWQKPj4KPj4gVW5saWtlIHRoZSBub3JtYWwgZGV2aWNlIGF0dGFjaCwgd2Ugd2lsbCBlbmNv
dW50ZXIgdHdvIGRldmljZXMgd2hlbiBpdAo+PiBjb21lcyB0byBhdXgtZG9tYWluLgo+Pgo+PiAt
IFBhcmVudCBwaHlzaWNhbCBkZXZpY2UgLSB0aGlzIG1pZ2h0IGJlLCBmb3IgZXhhbXBsZSwgYSBQ
Q0llIGRldmljZQo+PiB3aXRoIFBBU0lEIGZlYXR1cmUgc3VwcG9ydCwgaGVuY2UgaXQgaXMgYWJs
ZSB0byB0YWcgYW4gdW5pcXVlIFBBU0lECj4+IGZvciBETUEgdHJhbnNmZXJzIG9yaWdpbmF0ZWQg
ZnJvbSBpdHMgc3Vic2V0LiBUaGUgZGV2aWNlIGRyaXZlciBoZW5jZQo+PiBpcyBhYmxlIHRvIHdy
YXBwZXIgdGhpcyBzdWJzZXQgaW50byBhbiBpc29sYXRlZDoKPj4KPj4gLSBNZWRpYXRlZCBkZXZp
Y2UgLSBhIGZha2UgZGV2aWNlIGNyZWF0ZWQgYnkgdGhlIGRldmljZSBkcml2ZXIgbWVudGlvbmVk
Cj4+IGFib3ZlLgo+Pgo+PiBZZXMuIEFsbCB5b3UgbWVudGlvbmVkIGFyZSByaWdodCBmb3IgdGhl
IHBhcmVudCBkZXZpY2UuIEJ1dCBmb3IgbWVkaWF0ZWQKPj4gZGV2aWNlLCBpb21tdV9nZXRfZG9t
YWluX2Zvcl9kZXYoKSBkb2Vzbid0IHdvcmsgZXZlbiBpdCBoYXMgYW4gdmFsaWQKPj4gaW9tbXVf
Z3JvdXAgYW5kIGlvbW11X2RvbWFpbi4KPj4KPj4gaW9tbXVfZ2V0X2RvbWFpbl9mb3JfZGV2KCkg
aXMgYSBuZWNlc3NhcnkgaW50ZXJmYWNlIGZvciBkZXZpY2UgZHJpdmVycwo+PiB3aGljaCB3YW50
IHRvIHN1cHBvcnQgYXV4LWRvbWFpbi4gRm9yIGV4YW1wbGUsCj4gCj4gT25seSBpZiB0aGV5IHdh
bnQgdG8gZm9sbG93IHRoaXMgdmVyeSBzcGVjaWZpYyBub3Rpb24gb2YgdXNpbmcgbWFkZS11cCAK
PiBkZXZpY2VzIGFuZCBncm91cHMgdG8gcmVwcmVzZW50IGF1eCBhdHRhY2htZW50cy4gRXZlbiBp
ZiBhIGRyaXZlciAKPiBtYW5hZ2luZyBpdHMgb3duIGF1eCBkb21haW5zIGVudGlyZWx5IHByaXZh
dGVseSBkb2VzIGNyZWF0ZSBjaGlsZCAKPiBkZXZpY2VzIGZvciB0aGVtLCBpdCdzIG5vdCBsaWtl
IGl0IGNhbid0IGtlZXAgaXRzIGRvbWFpbiBwb2ludGVycyBpbiAKPiBkcnZkYXRhIGlmIGl0IHdh
bnRzIHRvIDspCj4gCj4gTGV0J3Mgbm90IGNvbmZsYXRlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0
aW9uIG9mIHZmaW9fbWRldiB3aXRoIHRoZSAKPiBnZW5lcmFsIGNvbmNlcHRzIGludm9sdmVkIGhl
cmUuCj4gCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFp
bjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gbWRldl9kZXYo
bWRldik7Cj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBhc2lkOwo+Pgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkb21haW4gPSBpb21tdV9nZXRfZG9tYWluX2Zvcl9kZXYoZGV2KTsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFkb21haW4pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGFzaWQgPSBpb21tdV9hdXhfZ2V0X3Bhc2lkKGRvbWFpbiwgZGV2LT5wYXJlbnQpOwo+PiDC
oMKgwqDCoMKgwqAgaWYgKHBhc2lkID09IElPQVNJRF9JTlZBTElEKQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4KPj4gwqDCoMKgwqDCoMKgIC8qIFByb2dyYW0gdGhl
IGRldmljZSBjb250ZXh0IHdpdGggdGhlIFBBU0lEIHZhbHVlICovCj4+IMKgwqDCoMKgwqDCoCAu
Li4uCj4+Cj4+IFdpdGhvdXQgdGhpcyBmaXgsIGlvbW11X2dldF9kb21haW5fZm9yX2RldigpIGFs
d2F5cyByZXR1cm5zIE5VTEwgYW5kIHRoZQo+PiBkZXZpY2UgZHJpdmVyIGhhcyBubyBtZWFucyB0
byBzdXBwb3J0IGF1eC1kb21haW4uCj4gCj4gU28gZWl0aGVyIHRoZSBJT01NVSBBUEkgaXRzZWxm
IGlzIG1pc3NpbmcgdGhlIGFiaWxpdHkgdG8gZG8gdGhlIHJpZ2h0IAo+IHRoaW5nIGludGVybmFs
bHksIG9yIHRoZSBtZGV2IGxheWVyIGlzbid0IHVzaW5nIGl0IGFwcHJvcHJpYXRlbHkuIEVpdGhl
ciAKPiB3YXksIHNpbXBseSBwdW5jaGluZyBob2xlcyBpbiB0aGUgQVBJIGZvciBtZGV2IHRvIGhh
Y2sgYXJvdW5kIGl0cyBvd24gCj4gbWVzcyBkb2Vzbid0IHNlZW0gbGlrZSB0aGUgYmVzdCB0aGlu
ZyB0byBkby4KPiAKPiBUaGUgaW5pdGlhbCBpbXByZXNzaW9uIEkgZ290IHdhcyB0aGF0IGl0J3Mg
aW1wbGljaXRseSBhc3N1bWVkIGhlcmUgdGhhdCAKPiB0aGUgbWRldiBpdHNlbGYgaXMgYXR0YWNo
ZWQgdG8gZXhhY3RseSBvbmUgYXV4IGRvbWFpbiBhbmQgbm90aGluZyBlbHNlLCAKPiBhdCB3aGlj
aCBwb2ludCBJIHdvdWxkIHdvbmRlciB3aHkgaXQncyB1c2luZyBhdXggYXQgYWxsLCBidXQgYXJl
IHlvdSAKPiBzYXlpbmcgdGhhdCBpbiBmYWN0IG5vIGF0dGFjaCBoYXBwZW5zIHdpdGggdGhlIG1k
ZXYgZ3JvdXAgZWl0aGVyIHdheSwgCj4gb25seSB0byB0aGUgcGFyZW50IGRldmljZT8KPiAKPiBJ
J2xsIGFkbWl0IEknbSBub3QgaHVnZWx5IGZhbWlsaWFyIHdpdGggYW55IG9mIHRoaXMsIGJ1dCBp
dCBzZWVtcyB0byBtZSAKPiB0aGF0IHRoZSBsb2dpY2FsIGZsb3cgc2hvdWxkIGJlOgo+IAo+ICDC
oMKgwqDCoC0gYWxsb2NhdGUgZG9tYWluCj4gIMKgwqDCoMKgLSBhdHRhY2ggYXMgYXV4IHRvIHBh
cmVudAo+ICDCoMKgwqDCoC0gcmV0cmlldmUgYXV4IGRvbWFpbiBQQVNJRAo+ICDCoMKgwqDCoC0g
Y3JlYXRlIG1kZXYgY2hpbGQgYmFzZWQgb24gUEFTSUQKPiAgwqDCoMKgwqAtIGF0dGFjaCBtZGV2
IHRvIGRvbWFpbiAobm9ybWFsbHkpCj4gCj4gT2YgY291cnNlIHRoYXQgbWlnaHQgcmVxdWlyZSBn
aXZpbmcgdGhlIElPTU1VIEFQSSBhIHByb3BlciBmaXJzdC1jbGFzcyAKPiBub3Rpb24gb2YgbWVk
aWF0ZWQgZGV2aWNlcywgc3VjaCB0aGF0IGl0IGtub3dzIHRoZSBtZGV2IHJlcHJlc2VudHMgdGhl
IAo+IFBBU0lELCBhbmQgY2FuIHJlY29nbmlzZSB0aGUgbWRldiBhdHRhY2ggaXMgZXF1aXZhbGVu
dCB0byB0aGUgZWFybGllciAKPiBwYXJlbnQgYXV4IGF0dGFjaCBzbyBub3QganVzdCBibGluZGx5
IGhhbmQgaXQgZG93biB0byBhbiBJT01NVSBkcml2ZXIgCj4gdGhhdCdzIG5ldmVyIGhlYXJkIG9m
IHRoaXMgbmV3IGRldmljZSBiZWZvcmUuIE9yIHBlcmhhcHMgdGhlIElPTU1VIAo+IGRyaXZlcnMg
ZG8gdGhlaXIgb3duIGJvb2trZWVwaW5nIGZvciB0aGUgbWRldiBidXMsIHN1Y2ggdGhhdCB0aGV5
IGRvIAo+IGhhbmRsZSB0aGUgYXR0YWNoIGNhbGwsIGFuZCBqdXN0IHZhbGlkYXRlIGl0IGludGVy
bmFsbHkgYmFzZWQgb24gdGhlIAo+IGFzc29jaWF0ZWQgcGFyZW50IGRldmljZSBhbmQgUEFTSUQu
IEVpdGhlciB3YXksIHRoZSBpbnNpZGUgbWFpbnRhaW5zIAo+IHNlbGYtY29uc2lzdGVuY3kgYW5k
IGZyb20gdGhlIG91dHNpZGUgaXQgbG9va3MgbGlrZSBzdGFuZGFyZCBBUEkgdXNhZ2UgCj4gd2l0
aG91dCBuYXN0eSBoYWNrcy4KPiAKPiBJJ20gcHJldHR5IHN1cmUgSSd2ZSBoZWFyZCBzdWdnZXN0
aW9ucyBvZiB1c2luZyBtZWRpYXRlZCBkZXZpY2VzIGJleW9uZCAKPiBWRklPIChlLmcuIHdpdGhp
biB0aGUga2VybmVsIGl0c2VsZiksIHNvIGNoYW5jZXMgYXJlIHRoaXMgaXMgYSBkaXJlY3Rpb24g
Cj4gdGhhdCB3ZSdsbCBoYXZlIHRvIHRha2UgYXQgc29tZSBwb2ludCBhbnl3YXkuCj4gCj4gQW5k
LCB0aGF0IHNhaWQsIGV2ZW4gaWYgcGVvcGxlIGRvIHdhbnQgYW4gaW1tZWRpYXRlIHF1aWNrIGZp
eCByZWdhcmRsZXNzIAo+IG9mIHRlY2huaWNhbCBkZWJ0LCBJJ2Qgc3RpbGwgYmUgYSBsb3QgaGFw
cGllciB0byBzZWUgCj4gaW9tbXVfZ3JvdXBfc2V0X2RvbWFpbigpIGxpZ2h0bHkgcmVzcHVuIGFz
IGlvbW11X2F0dGFjaF9tZGV2KCkgOykKCkdldCB5b3VyIHBvaW50IGFuZCBJIGFncmVlIHdpdGgg
eW91ciBjb25jZXJucy4KClRvIG1haW50YWluIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBtZGV2
J3MgaW9tbXVfZ3JvdXAgYW5kCmlvbW11X2RvbWFpbiwgaG93IGFib3V0IGV4dGVuZGluZyBiZWxv
dyBleGlzdGluZyBhdXhfYXR0YWNoIGFwaQoKaW50IGlvbW11X2F1eF9hdHRhY2hfZGV2aWNlKHN0
cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwKCQkJICAgIHN0cnVjdCBkZXZpY2UgKmRldikKCmJ5
IGFkZGluZyB0aGUgbWRldidzIGlvbW11X2dyb3VwPwoKaW50IGlvbW11X2F1eF9hdHRhY2hfZGV2
aWNlKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwKCQkJICAgIHN0cnVjdCBkZXZpY2UgKmRl
diwKCQkJICAgIHN0cnVjdCBpb21tdV9ncm91cCAqZ3JvdXApCgpBbmQsIGluIGlvbW11X2F1eF9h
dHRhY2hfZGV2aWNlKCksIHdlIHJlcXVpcmUsCiAgLSBAZ3JvdXAgb25seSBoYXMgYSBzaW5nbGUg
ZGV2aWNlOwogIC0gQGdyb3VwIGhhc24ndCBiZWVuIGF0dGFjaGVkIGJ5IGFueSBkZXZpY2VzOwog
IC0gU2V0IHRoZSBAZG9tYWluIHRvIEBncm91cAoKSnVzdCBsaWtlIHdoYXQgd2UndmUgZG9uZSBp
biBpb21tdV9hdHRhY2hfZGV2aWNlKCkuCgpBbnkgdGhvdWdodHM/CgpCZXN0IHJlZ2FyZHMsCmJh
b2x1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11
IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
