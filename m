Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AAE3D0D32
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 13:12:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BA7405A1;
	Wed, 21 Jul 2021 11:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVd1J5nx3exZ; Wed, 21 Jul 2021 11:12:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5B3F440306;
	Wed, 21 Jul 2021 11:12:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30A7FC000E;
	Wed, 21 Jul 2021 11:12:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C10C0C000E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 11:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9933C40493
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 11:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crcS4MJaOiix for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 11:12:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76E4F40306
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 11:12:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90CCD31B;
 Wed, 21 Jul 2021 04:12:18 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E03D3F694;
 Wed, 21 Jul 2021 04:12:16 -0700 (PDT)
Subject: Re: [PATCH 4/5] iommu/vt-d: Disallow SVA if devices don't support
 64-bit address
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Sanjay Kumar <sanjay.k.kumar@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Liu Yi L <yi.l.liu@intel.com>
References: <20210720013856.4143880-1-baolu.lu@linux.intel.com>
 <20210720013856.4143880-5-baolu.lu@linux.intel.com>
 <22302277-0470-db41-7a19-41b5f73bd2c5@arm.com>
 <4d3a2546-da21-605d-26a9-1f6f52123056@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5662caea-a974-e511-9509-010606fda251@arm.com>
Date: Wed, 21 Jul 2021 12:12:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4d3a2546-da21-605d-26a9-1f6f52123056@linux.intel.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

T24gMjAyMS0wNy0yMSAwMjo1MCwgTHUgQmFvbHUgd3JvdGU6Cj4gSGkgUm9iaW4sCj4gCj4gVGhh
bmtzIGEgbG90IGZvciByZXZpZXdpbmcgbXkgcGF0Y2ghCj4gCj4gT24gNy8yMC8yMSA1OjI3IFBN
LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+IE9uIDIwMjEtMDctMjAgMDI6MzgsIEx1IEJhb2x1IHdy
b3RlOgo+Pj4gV2hlbiB0aGUgZGV2aWNlIGFuZCBDUFUgc2hhcmUgYW4gYWRkcmVzcyBzcGFjZSAo
c3VjaCBhcyBTVkEpLCB0aGUgZGV2aWNlCj4+PiBtdXN0IHN1cHBvcnQgdGhlIHNhbWUgYWRkcmVz
c2luZyBjYXBhYmlsaXR5IGFzIHRoZSBDUFUuIFRoZSBDUFUgZG9lcyBub3QKPj4+IGNvbnNpZGVy
IHRoZSBhZGRyZXNzaW5nIGFiaWxpdHkgb2YgYW55IGRldmljZSB3aGVuIG1hbmFnaW5nIHRoZSBw
YWdlIAo+Pj4gdGFibGUKPj4+IG9mIGEgcHJvY2Vzcywgc28gdGhlIGRldmljZSBtdXN0IGhhdmUg
ZW5vdWdoIGFkZHJlc3NpbmcgYWJpbGl0eSB0byBiaW5kCj4+PiB0aGUgcGFnZSB0YWJsZSBvZiB0
aGUgcHJvY2Vzcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMdSBCYW9sdSA8YmFvbHUubHVAbGlu
dXguaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMg
fCAzICsrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L2lu
dGVsL2lvbW11LmMKPj4+IGluZGV4IGY0NWM4MGNlMjM4MS4uZjNjY2ExZGQzODRkIDEwMDY0NAo+
Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9pbnRlbC9pb21tdS5jCj4+PiArKysgYi9kcml2ZXJzL2lv
bW11L2ludGVsL2lvbW11LmMKPj4+IEBAIC01MzcyLDYgKzUzNzIsOSBAQCBzdGF0aWMgaW50IGlu
dGVsX2lvbW11X2VuYWJsZV9zdmEoc3RydWN0IGRldmljZSAKPj4+ICpkZXYpCj4+PiDCoMKgwqDC
oMKgIGlmICghKGlvbW11LT5mbGFncyAmIFZURF9GTEFHX1NWTV9DQVBBQkxFKSkKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPj4+ICvCoMKgwqAgaWYgKCFkZXYtPmRtYV9t
YXNrIHx8ICpkZXYtPmRtYV9tYXNrICE9IERNQV9CSVRfTUFTSyg2NCkpCj4+Cj4+IENhcmVmdWwg
LSBWRklPIGRvZXNuJ3Qgc2V0IERNQSBtYXNrcyAoc2luY2UgaXQgZG9lc24ndCB1c2UgdGhlIERN
QSBBUEkpLAo+IAo+IFNWQSBkb2Vzbid0IHdvcmsgdGhyb3VnaCB0aGUgVkZJTyBmcmFtZXdvcmsu
CgpEaWQgYW55b25lIHNheSBpdCBkb2VzPyBNeSBwb2ludCBpcyB0aGF0LCBhcyBmYXIgYXMgSSB1
bmRlcnN0YW5kLCB0aGUgClNWQSBVQVBJIGlzIHZlcnkgbXVjaCBpbnRlbmRlZCB0byB3b3JrICp3
aXRoKiBWRklPLCBhbmQgZXZlbiBpZiB0aGUgCmZpbmVyIGRldGFpbHMgYXJlIHN0aWxsIG1pcmVk
IGluIHRoZSAvZGV2L2lvYXNpZCBkaXNjdXNzaW9uIHRvZGF5IHdlIApzaG91bGQgZGVmaW5pdGVs
eSBleHBlY3QgdG8gc2VlIFZGSU8tbGlrZSB1c2UtY2FzZXMgYXQgc29tZSBwb2ludC4gSSAKY2Vy
dGFpbmx5IGRvbid0IHNlZSB3aHkgYW55IG9mIHRoZSBndWVzdCBTVkEgc3R1ZmYgZXhpc3RzIGFs
cmVhZHkgaWYgbm90IApmb3IgVkZJTy1hc3NpZ25lZCBkZXZpY2VzPwoKPj4gc28gdGhpcyBhcHBl
YXJzIHRvIGJlIHJlbHlpbmcgb24gYW5vdGhlciBkcml2ZXIgaGF2aW5nIGJvdW5kIHByZXZpb3Vz
bHksCj4gCj4gWWVzLiBZb3UgYXJlIHJpZ2h0Lgo+IAo+PiBvdGhlcndpc2UgdGhlIG1hc2sgd291
bGQgc3RpbGwgYmUgdGhlIGRlZmF1bHQgMzItYml0IG9uZSBmcm9tIAo+PiBwY2lfc2V0dXBfZGV2
aWNlKCkuIEknbSBub3Qgc3VyZSB0aGF0J3MgYW4gZW50aXJlbHkgcm9idXN0IGFzc3VtcHRpb24u
Cj4gCj4gQ3VycmVudGx5IFNWQSBpbXBsZW1lbnRhdGlvbiBhbHdheXMgcmVxdWlyZXMgYSBuYXRp
dmUga2VybmVsIGRyaXZlci4gVGhlCj4gYXNzdW1wdGlvbiBpcyB0aGF0IHRoZSBkcml2ZXJzIHNo
b3VsZCBjaGVjayBhbmQgc2V0IDY0LWJpdCBhZGRyZXNzaW5nCj4gY2FwYWJpbGl0eSBiZWZvcmUg
Y2FsbGluZyBpb21tdV9zdmFfeHh4KCkgQVBJcy4KCi4uLmFuZCBnaXZlbiB0aGF0IHRoYXQgaXMg
bm90IGEgZG9jdW1lbnRlZCByZXF1aXJlbWVudCwgYW5kIGNlcnRhaW5seSAKbm90IGEgdGVjaG5p
Y2FsIG9uZSAoZXZlbiBhIHNlbGYtY29udGFpbmVkIGtlcm5lbCBkcml2ZXIgY291bGQgY2hvb3Nl
IHRvIApvbmx5IHVzZSBTVkEgY29udGV4dHMgYW5kIG5vdCB0b3VjaCB0aGUgRE1BIEFQSSksIGl0
J3MgYW4gaW5oZXJlbnRseSAKZnJhZ2lsZSBhc3N1bXB0aW9uIHdoaWNoIEknbSBjb25maWRlbnQg
KndpbGwqIGJlIGJyb2tlbiBldmVudHVhbGx5IDopCgpSb2Jpbi4KCj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FTk9ERVY7Cj4+PiArCj4+PiDCoMKgwqDCoMKgIGlmIChpbnRlbF9pb21tdV9l
bmFibGVfcGFzaWQoaW9tbXUsIGRldikpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
Tk9ERVY7Cj4+Pgo+IAo+IEJlc3QgcmVnYXJkcywKPiBiYW9sdQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vaW9tbXU=
