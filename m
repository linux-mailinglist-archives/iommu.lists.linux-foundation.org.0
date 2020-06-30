Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2220F9D3
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 18:51:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 394C420361;
	Tue, 30 Jun 2020 16:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUJ6rUA-tF8q; Tue, 30 Jun 2020 16:51:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2B5E320486;
	Tue, 30 Jun 2020 16:51:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10F71C016E;
	Tue, 30 Jun 2020 16:51:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C420FC016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 16:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B2C1987BAE
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 16:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgHegkJj4rFk for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 16:51:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 30D2B87904
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 16:51:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7189330E;
 Tue, 30 Jun 2020 09:51:33 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68BCD3F68F;
 Tue, 30 Jun 2020 09:51:30 -0700 (PDT)
Subject: Re: [PATCH 1/2] iommu: Add iommu_group_get/set_domain()
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20200627031532.28046-1-baolu.lu@linux.intel.com>
 <acc0a8fd-bd23-fc34-aecc-67796ab216e7@arm.com>
 <5dc1cece-6111-9b56-d04c-9553d592675b@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <48dd9f1e-c18b-77b7-650a-c35ecbb69f2b@arm.com>
Date: Tue, 30 Jun 2020 17:51:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <5dc1cece-6111-9b56-d04c-9553d592675b@linux.intel.com>
Content-Language: en-GB
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

T24gMjAyMC0wNi0zMCAwMjowMywgTHUgQmFvbHUgd3JvdGU6Cj4gSGkgUm9iaW4sCj4gCj4gT24g
Ni8yOS8yMCA3OjU2IFBNLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+IE9uIDIwMjAtMDYtMjcgMDQ6
MTUsIEx1IEJhb2x1IHdyb3RlOgo+Pj4gVGhlIGhhcmR3YXJlIGFzc2lzdGFudCB2ZmlvIG1lZGlh
dGVkIGRldmljZSBpcyBhIHVzZSBjYXNlIG9mIGlvbW11Cj4+PiBhdXgtZG9tYWluLiBUaGUgaW50
ZXJhY3Rpb25zIGJldHdlZW4gdmZpby9tZGV2IGFuZCBpb21tdSBkdXJpbmcgbWRldgo+Pj4gY3Jl
YXRpb24gYW5kIHBhc3N0aHIgYXJlOgo+Pj4KPj4+IC0gQ3JlYXRlIGEgZ3JvdXAgZm9yIG1kZXYg
d2l0aCBpb21tdV9ncm91cF9hbGxvYygpOwo+Pj4gLSBBZGQgdGhlIGRldmljZSB0byB0aGUgZ3Jv
dXAgd2l0aAo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBncm91cCA9IGlvbW11X2dyb3VwX2FsbG9jKCk7
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoZ3JvdXApKQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoZ3JvdXApOwo+Pj4KPj4+IMKgwqDC
oMKgwqDCoMKgwqAgcmV0ID0gaW9tbXVfZ3JvdXBfYWRkX2RldmljZShncm91cCwgJm1kZXYtPmRl
dik7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmICghcmV0KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGV2X2luZm8oJm1kZXYtPmRldiwgIk1ERVY6IGdyb3VwX2lkID0gJWRc
biIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpb21tdV9ncm91cF9pZChncm91cCkpOwo+Pj4gLSBBbGxvY2F0ZSBhbiBhdXgtZG9tYWluCj4+
PiDCoMKgwqDCoGlvbW11X2RvbWFpbl9hbGxvYygpCj4+PiAtIEF0dGFjaCB0aGUgYXV4LWRvbWFp
biB0byB0aGUgcGh5c2ljYWwgZGV2aWNlIGZyb20gd2hpY2ggdGhlIG1kZXYgaXMKPj4+IMKgwqAg
Y3JlYXRlZC4KPj4+IMKgwqDCoMKgaW9tbXVfYXV4X2F0dGFjaF9kZXZpY2UoKQo+Pj4KPj4+IElu
IHRoZSB3aG9sZSBwcm9jZXNzLCBhbiBpb21tdSBncm91cCB3YXMgYWxsb2NhdGVkIGZvciB0aGUg
bWRldiBhbmQgYW4KPj4+IGlvbW11IGRvbWFpbiB3YXMgYXR0YWNoZWQgdG8gdGhlIGdyb3VwLCBi
dXQgdGhlIGdyb3VwLT5kb21haW4gbGVhdmVzCj4+PiBOVUxMLiBBcyB0aGUgcmVzdWx0LCBpb21t
dV9nZXRfZG9tYWluX2Zvcl9kZXYoKSBkb2Vzbid0IHdvcmsgYW55bW9yZS4KPj4+Cj4+PiBUaGlz
IGFkZHMgaW9tbXVfZ3JvdXBfZ2V0L3NldF9kb21haW4oKSBzbyB0aGF0IGdyb3VwLT5kb21haW4g
Y291bGQgYmUKPj4+IG1hbmFnZWQgd2hlbmV2ZXIgYSBkb21haW4gaXMgYXR0YWNoZWQgb3IgZGV0
YWNoZWQgdGhyb3VnaCB0aGUgYXV4LWRvbWFpbgo+Pj4gYXBpJ3MuCj4+Cj4+IExldHRpbmcgZXh0
ZXJuYWwgY2FsbGVycyBwb2tlIGFyb3VuZCBkaXJlY3RseSBpbiB0aGUgaW50ZXJuYWxzIG9mIAo+
PiBpb21tdV9ncm91cCBkb2Vzbid0IGxvb2sgcmlnaHQgdG8gbWUuCj4gCj4gVW5mb3J0dW5hdGVs
eSwgaXQgc2VlbXMgdGhhdCB0aGUgdmlmbyBpb21tdSBhYnN0cmFjdGlvbiBpcyBkZWVwbHkgYm91
bmQKPiB0byB0aGUgSU9NTVUgc3Vic3lzdGVtLiBXZSBjYW4gZWFzaWx5IGZpbmQgb3RoZXIgZXhh
bXBsZXM6Cj4gCj4gaW9tbXVfZ3JvdXBfZ2V0L3NldF9pb21tdWRhdGEoKQo+IGlvbW11X2dyb3Vw
X2dldC9zZXRfbmFtZSgpCj4gLi4uCgpTdXJlLCBidXQgdGhvc2UgYXJlIHdheXMgZm9yIHVzZXJz
IG9mIGEgZ3JvdXAgdG8gYXR0YWNoIHVzZWZ1bCAKaW5mb3JtYXRpb24gb2YgdGhlaXIgb3duIHRv
IGl0LCB0aGF0IGRvZXNuJ3QgbWF0dGVyIHRvIHRoZSBJT01NVSAKc3Vic3lzdGVtIGl0c2VsZi4g
VGhlIGludGVyZmFjZSB5b3UndmUgcHJvcG9zZWQgZ2l2ZXMgY2FsbGVycyByaWNoIG5ldyAKb3Bw
b3J0dW5pdGllcyB0byBmdW5kYW1lbnRhbGx5IGJyZWFrIGNvcnJlY3Qgb3BlcmF0aW9uIG9mIHRo
ZSBBUEk6CgoJZG9tID0gaW9tbXVfZG9tYWluX2FsbG9jKCk7Cglpb21tdV9hdHRhY2hfZ3JvdXAo
ZG9tLCBncnApOwoJLi4uCglpb21tdV9ncm91cF9zZXRfZG9tYWluKGdycCwgTlVMTCk7CgkvLyBv
b3BzLCBsZWFrZWQgYW5kIGNhbid0IGV2ZXIgZGV0YWNoIHByb3Blcmx5IG5vdwoKb3IgcGVyaGFw
czoKCglncnAgPSBpb21tdV9ncm91cF9hbGxvYygpOwoJaW9tbXVfZ3JvdXBfYWRkX2RldmljZShn
cnAsIGRldik7Cglpb21tdV9ncm91cF9zZXRfZG9tYWluKGdycCwgZG9tKTsKCS4uLgoJaW9tbXVf
ZGV0YWNoX2dyb3VwKGRvbSwgZ3JwKTsKCS8vIG9vcHMsIElPTU1VIGRyaXZlciBtaWdodCBub3Qg
aGFuZGxlIHRoaXMKCj4+IElmIGEgcmVndWxhciBkZXZpY2UgaXMgYXR0YWNoZWQgdG8gb25lIG9y
IG1vcmUgYXV4IGRvbWFpbnMgZm9yIFBBU0lEIAo+PiB1c2UsIGlvbW11X2dldF9kb21haW5fZm9y
X2RldigpIGlzIHN0aWxsIGdvaW5nIHRvIHJldHVybiB0aGUgcHJpbWFyeSAKPj4gZG9tYWluLCBz
byB3aHkgc2hvdWxkIGl0IGJlIGV4cGVjdGVkIHRvIGJlaGF2ZSBkaWZmZXJlbnRseSBmb3IgbWVk
aWF0ZWQKPiAKPiBVbmxpa2UgdGhlIG5vcm1hbCBkZXZpY2UgYXR0YWNoLCB3ZSB3aWxsIGVuY291
bnRlciB0d28gZGV2aWNlcyB3aGVuIGl0Cj4gY29tZXMgdG8gYXV4LWRvbWFpbi4KPiAKPiAtIFBh
cmVudCBwaHlzaWNhbCBkZXZpY2UgLSB0aGlzIG1pZ2h0IGJlLCBmb3IgZXhhbXBsZSwgYSBQQ0ll
IGRldmljZQo+IHdpdGggUEFTSUQgZmVhdHVyZSBzdXBwb3J0LCBoZW5jZSBpdCBpcyBhYmxlIHRv
IHRhZyBhbiB1bmlxdWUgUEFTSUQKPiBmb3IgRE1BIHRyYW5zZmVycyBvcmlnaW5hdGVkIGZyb20g
aXRzIHN1YnNldC4gVGhlIGRldmljZSBkcml2ZXIgaGVuY2UKPiBpcyBhYmxlIHRvIHdyYXBwZXIg
dGhpcyBzdWJzZXQgaW50byBhbiBpc29sYXRlZDoKPiAKPiAtIE1lZGlhdGVkIGRldmljZSAtIGEg
ZmFrZSBkZXZpY2UgY3JlYXRlZCBieSB0aGUgZGV2aWNlIGRyaXZlciBtZW50aW9uZWQKPiBhYm92
ZS4KPiAKPiBZZXMuIEFsbCB5b3UgbWVudGlvbmVkIGFyZSByaWdodCBmb3IgdGhlIHBhcmVudCBk
ZXZpY2UuIEJ1dCBmb3IgbWVkaWF0ZWQKPiBkZXZpY2UsIGlvbW11X2dldF9kb21haW5fZm9yX2Rl
digpIGRvZXNuJ3Qgd29yayBldmVuIGl0IGhhcyBhbiB2YWxpZAo+IGlvbW11X2dyb3VwIGFuZCBp
b21tdV9kb21haW4uCj4gCj4gaW9tbXVfZ2V0X2RvbWFpbl9mb3JfZGV2KCkgaXMgYSBuZWNlc3Nh
cnkgaW50ZXJmYWNlIGZvciBkZXZpY2UgZHJpdmVycwo+IHdoaWNoIHdhbnQgdG8gc3VwcG9ydCBh
dXgtZG9tYWluLiBGb3IgZXhhbXBsZSwKCk9ubHkgaWYgdGhleSB3YW50IHRvIGZvbGxvdyB0aGlz
IHZlcnkgc3BlY2lmaWMgbm90aW9uIG9mIHVzaW5nIG1hZGUtdXAgCmRldmljZXMgYW5kIGdyb3Vw
cyB0byByZXByZXNlbnQgYXV4IGF0dGFjaG1lbnRzLiBFdmVuIGlmIGEgZHJpdmVyIAptYW5hZ2lu
ZyBpdHMgb3duIGF1eCBkb21haW5zIGVudGlyZWx5IHByaXZhdGVseSBkb2VzIGNyZWF0ZSBjaGls
ZCAKZGV2aWNlcyBmb3IgdGhlbSwgaXQncyBub3QgbGlrZSBpdCBjYW4ndCBrZWVwIGl0cyBkb21h
aW4gcG9pbnRlcnMgaW4gCmRydmRhdGEgaWYgaXQgd2FudHMgdG8gOykKCkxldCdzIG5vdCBjb25m
bGF0ZSB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiB2ZmlvX21kZXYgd2l0aCB0aGUgCmdl
bmVyYWwgY29uY2VwdHMgaW52b2x2ZWQgaGVyZS4KCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgaW9tbXVfZG9tYWluICpkb21haW47Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSBtZGV2X2RldihtZGV2KTsKPiAgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBh
c2lkOwo+IAo+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWluID0gaW9tbXVfZ2V0X2RvbWFpbl9m
b3JfZGV2KGRldik7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWRvbWFpbikKPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPiAKPiAgwqDCoMKg
wqDCoMKgwqDCoMKgIHBhc2lkID0gaW9tbXVfYXV4X2dldF9wYXNpZChkb21haW4sIGRldi0+cGFy
ZW50KTsKPiAgwqDCoMKgwqDCoCBpZiAocGFzaWQgPT0gSU9BU0lEX0lOVkFMSUQpCj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiAKPiAgwqDCoMKgwqDCoCAvKiBQcm9ncmFt
IHRoZSBkZXZpY2UgY29udGV4dCB3aXRoIHRoZSBQQVNJRCB2YWx1ZSAqLwo+ICDCoMKgwqDCoMKg
IC4uLi4KPiAKPiBXaXRob3V0IHRoaXMgZml4LCBpb21tdV9nZXRfZG9tYWluX2Zvcl9kZXYoKSBh
bHdheXMgcmV0dXJucyBOVUxMIGFuZCB0aGUKPiBkZXZpY2UgZHJpdmVyIGhhcyBubyBtZWFucyB0
byBzdXBwb3J0IGF1eC1kb21haW4uCgpTbyBlaXRoZXIgdGhlIElPTU1VIEFQSSBpdHNlbGYgaXMg
bWlzc2luZyB0aGUgYWJpbGl0eSB0byBkbyB0aGUgcmlnaHQgCnRoaW5nIGludGVybmFsbHksIG9y
IHRoZSBtZGV2IGxheWVyIGlzbid0IHVzaW5nIGl0IGFwcHJvcHJpYXRlbHkuIEVpdGhlciAKd2F5
LCBzaW1wbHkgcHVuY2hpbmcgaG9sZXMgaW4gdGhlIEFQSSBmb3IgbWRldiB0byBoYWNrIGFyb3Vu
ZCBpdHMgb3duIAptZXNzIGRvZXNuJ3Qgc2VlbSBsaWtlIHRoZSBiZXN0IHRoaW5nIHRvIGRvLgoK
VGhlIGluaXRpYWwgaW1wcmVzc2lvbiBJIGdvdCB3YXMgdGhhdCBpdCdzIGltcGxpY2l0bHkgYXNz
dW1lZCBoZXJlIHRoYXQgCnRoZSBtZGV2IGl0c2VsZiBpcyBhdHRhY2hlZCB0byBleGFjdGx5IG9u
ZSBhdXggZG9tYWluIGFuZCBub3RoaW5nIGVsc2UsIAphdCB3aGljaCBwb2ludCBJIHdvdWxkIHdv
bmRlciB3aHkgaXQncyB1c2luZyBhdXggYXQgYWxsLCBidXQgYXJlIHlvdSAKc2F5aW5nIHRoYXQg
aW4gZmFjdCBubyBhdHRhY2ggaGFwcGVucyB3aXRoIHRoZSBtZGV2IGdyb3VwIGVpdGhlciB3YXks
IApvbmx5IHRvIHRoZSBwYXJlbnQgZGV2aWNlPwoKSSdsbCBhZG1pdCBJJ20gbm90IGh1Z2VseSBm
YW1pbGlhciB3aXRoIGFueSBvZiB0aGlzLCBidXQgaXQgc2VlbXMgdG8gbWUgCnRoYXQgdGhlIGxv
Z2ljYWwgZmxvdyBzaG91bGQgYmU6CgoJLSBhbGxvY2F0ZSBkb21haW4KCS0gYXR0YWNoIGFzIGF1
eCB0byBwYXJlbnQKCS0gcmV0cmlldmUgYXV4IGRvbWFpbiBQQVNJRAoJLSBjcmVhdGUgbWRldiBj
aGlsZCBiYXNlZCBvbiBQQVNJRAoJLSBhdHRhY2ggbWRldiB0byBkb21haW4gKG5vcm1hbGx5KQoK
T2YgY291cnNlIHRoYXQgbWlnaHQgcmVxdWlyZSBnaXZpbmcgdGhlIElPTU1VIEFQSSBhIHByb3Bl
ciBmaXJzdC1jbGFzcyAKbm90aW9uIG9mIG1lZGlhdGVkIGRldmljZXMsIHN1Y2ggdGhhdCBpdCBr
bm93cyB0aGUgbWRldiByZXByZXNlbnRzIHRoZSAKUEFTSUQsIGFuZCBjYW4gcmVjb2duaXNlIHRo
ZSBtZGV2IGF0dGFjaCBpcyBlcXVpdmFsZW50IHRvIHRoZSBlYXJsaWVyIApwYXJlbnQgYXV4IGF0
dGFjaCBzbyBub3QganVzdCBibGluZGx5IGhhbmQgaXQgZG93biB0byBhbiBJT01NVSBkcml2ZXIg
CnRoYXQncyBuZXZlciBoZWFyZCBvZiB0aGlzIG5ldyBkZXZpY2UgYmVmb3JlLiBPciBwZXJoYXBz
IHRoZSBJT01NVSAKZHJpdmVycyBkbyB0aGVpciBvd24gYm9va2tlZXBpbmcgZm9yIHRoZSBtZGV2
IGJ1cywgc3VjaCB0aGF0IHRoZXkgZG8gCmhhbmRsZSB0aGUgYXR0YWNoIGNhbGwsIGFuZCBqdXN0
IHZhbGlkYXRlIGl0IGludGVybmFsbHkgYmFzZWQgb24gdGhlIAphc3NvY2lhdGVkIHBhcmVudCBk
ZXZpY2UgYW5kIFBBU0lELiBFaXRoZXIgd2F5LCB0aGUgaW5zaWRlIG1haW50YWlucyAKc2VsZi1j
b25zaXN0ZW5jeSBhbmQgZnJvbSB0aGUgb3V0c2lkZSBpdCBsb29rcyBsaWtlIHN0YW5kYXJkIEFQ
SSB1c2FnZSAKd2l0aG91dCBuYXN0eSBoYWNrcy4KCkknbSBwcmV0dHkgc3VyZSBJJ3ZlIGhlYXJk
IHN1Z2dlc3Rpb25zIG9mIHVzaW5nIG1lZGlhdGVkIGRldmljZXMgYmV5b25kIApWRklPIChlLmcu
IHdpdGhpbiB0aGUga2VybmVsIGl0c2VsZiksIHNvIGNoYW5jZXMgYXJlIHRoaXMgaXMgYSBkaXJl
Y3Rpb24gCnRoYXQgd2UnbGwgaGF2ZSB0byB0YWtlIGF0IHNvbWUgcG9pbnQgYW55d2F5LgoKQW5k
LCB0aGF0IHNhaWQsIGV2ZW4gaWYgcGVvcGxlIGRvIHdhbnQgYW4gaW1tZWRpYXRlIHF1aWNrIGZp
eCByZWdhcmRsZXNzIApvZiB0ZWNobmljYWwgZGVidCwgSSdkIHN0aWxsIGJlIGEgbG90IGhhcHBp
ZXIgdG8gc2VlIAppb21tdV9ncm91cF9zZXRfZG9tYWluKCkgbGlnaHRseSByZXNwdW4gYXMgaW9t
bXVfYXR0YWNoX21kZXYoKSA7KQoKUm9iaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pb21tdQ==
