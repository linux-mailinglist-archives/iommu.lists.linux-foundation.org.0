Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E67B207F7
	for <lists.iommu@lfdr.de>; Thu, 16 May 2019 15:23:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B2FBDDD8;
	Thu, 16 May 2019 13:23:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D8B815AA
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 13:23:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0FAF35E4
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 13:23:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ECC68666E;
	Thu, 16 May 2019 13:23:24 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAA145D968;
	Thu, 16 May 2019 13:23:18 +0000 (UTC)
Subject: Re: [PATCH v3 6/7] iommu: Introduce IOMMU_RESV_DIRECT_RELAXABLE
	reserved memory regions
To: Robin Murphy <robin.murphy@arm.com>, eric.auger.pro@gmail.com,
	joro@8bytes.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, dwmw2@infradead.org,
	lorenzo.pieralisi@arm.com, will.deacon@arm.com, hanjun.guo@linaro.org, 
	sudeep.holla@arm.com
References: <20190516100817.12076-1-eric.auger@redhat.com>
	<20190516100817.12076-7-eric.auger@redhat.com>
	<ad8a99fa-b98a-14d3-12be-74df0e6eb8f8@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <57db1955-9d19-7c0b-eca3-37cc0d7d745b@redhat.com>
Date: Thu, 16 May 2019 15:23:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <ad8a99fa-b98a-14d3-12be-74df0e6eb8f8@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 16 May 2019 13:23:24 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

SGkgUm9iaW4sCk9uIDUvMTYvMTkgMjo0NiBQTSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDE2
LzA1LzIwMTkgMTE6MDgsIEVyaWMgQXVnZXIgd3JvdGU6Cj4+IEludHJvZHVjZSBhIG5ldyB0eXBl
IGZvciByZXNlcnZlZCByZWdpb24uIFRoaXMgY29ycmVzcG9uZHMKPj4gdG8gZGlyZWN0bHkgbWFw
cGVkIHJlZ2lvbnMgd2hpY2ggYXJlIGtub3duIHRvIGJlIHJlbGF4YWJsZQo+PiBpbiBzb21lIHNw
ZWNpZmljIGNvbmRpdGlvbnMsIHN1Y2ggYXMgZGV2aWNlIGFzc2lnbm1lbnQgdXNlCj4+IGNhc2Uu
IFdlbGwga25vd24gZXhhbXBsZXMgYXJlIHRob3NlIHVzZWQgYnkgVVNCIGNvbnRyb2xsZXJzCj4+
IHByb3ZpZGluZyBQUy8yIGtleWJvYXJkIGVtdWxhdGlvbiBmb3IgcHJlLWJvb3QgQklPUyBhbmQK
Pj4gZWFybHkgQk9PVCBvciBSTVJScyBhc3NvY2lhdGVkIHRvIElHRCB3b3JraW5nIGluIGxlZ2Fj
eSBtb2RlLgo+Pgo+PiBTaW5jZSBjb21taXQgYzg3NWQyYzFiODA4ICgiaW9tbXUvdnQtZDogRXhj
bHVkZSBkZXZpY2VzIHVzaW5nIFJNUlJzCj4+IGZyb20gSU9NTVUgQVBJIGRvbWFpbnMiKSBhbmQg
Y29tbWl0IDE4NDM2YWZkYzExYSAoImlvbW11L3Z0LWQ6IEFsbG93Cj4+IFJNUlIgb24gZ3JhcGhp
Y3MgZGV2aWNlcyB0b28iKSwgdGhvc2UgcmVnaW9ucyBhcmUgY3VycmVudGx5Cj4+IGNvbnNpZGVy
ZWQgInNhZmUiIHdpdGggcmVzcGVjdCB0byBkZXZpY2UgYXNzaWdubWVudCB1c2UgY2FzZQo+PiB3
aGljaCByZXF1aXJlcyBhIG5vbiBkaXJlY3QgbWFwcGluZyBhdCBJT01NVSBwaHlzaWNhbCBsZXZl
bAo+PiAoUkFNIEdQQSAtPiBIUEEgbWFwcGluZykuCj4+Cj4+IFRob3NlIFJNUlJzIGN1cnJlbnRs
eSBleGlzdCBhbmQgc29tZXRpbWVzIHRoZSBkZXZpY2UgaXMKPj4gYXR0ZW1wdGluZyB0byBhY2Nl
c3MgaXQgYnV0IHRoaXMgaGFzIG5vdCBiZWVuIGNvbnNpZGVyZWQKPj4gYW4gaXNzdWUgdW50aWwg
bm93Lgo+Pgo+PiBIb3dldmVyIGF0IHRoZSBtb21lbnQsIGlvbW11X2dldF9ncm91cF9yZXN2X3Jl
Z2lvbnMoKSBpcwo+PiBub3QgYWJsZSB0byBtYWtlIGFueSBkaWZmZXJlbmNlIGJldHdlZW4gZGly
ZWN0bHkgbWFwcGVkCj4+IHJlZ2lvbnM6IHRob3NlIHdoaWNoIG11c3QgYmUgYWJzb2x1dGVseSBl
bmZvcmNlZCBhbmQgdGhvc2UKPj4gbGlrZSBhYm92ZSBvbmVzIHdoaWNoIGFyZSBrbm93biBhcyBy
ZWxheGFibGUuCj4+Cj4+IFRoaXMgaXMgYSBibG9ja2VyIGZvciByZXBvcnRpbmcgc2V2ZXJlIGNv
bmZsaWN0cyBiZXR3ZWVuCj4+IG5vbiByZWxheGFibGUgUk1SUnMgKGxpa2UgTVNJIGRvb3JiZWxs
cykgYW5kIGd1ZXN0IEdQQSBzcGFjZS4KPj4KPj4gV2l0aCB0aGlzIG5ldyByZXNlcnZlZCByZWdp
b24gdHlwZSB3ZSB3aWxsIGJlIGFibGUgdG8gdXNlCj4+IGlvbW11X2dldF9ncm91cF9yZXN2X3Jl
Z2lvbnMoKSB0byBlbnVtZXJhdGUgdGhlIElPVkEgc3BhY2UKPj4gdGhhdCBpcyB1c2FibGUgdGhy
b3VnaCB0aGUgSU9NTVUgQVBJIHdpdGhvdXQgaW50cm9kdWNpbmcKPj4gcmVncmVzc2lvbnMgd2l0
aCByZXNwZWN0IHRvIGV4aXN0aW5nIGRldmljZSBhc3NpZ25tZW50Cj4+IHVzZSBjYXNlcyAoVVNC
IGFuZCBJR0QpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJl
ZGhhdC5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBOb3RlOiBBdCB0aGUgbW9tZW50IHRoZSBzeXNmcyBB
QkkgaXMgbm90IGNoYW5nZWQuIEhvd2V2ZXIgSSB3b25kZXIKPj4gd2hldGhlciBpdCB3b3VsZG4n
dCBiZSBwcmVmZXJhYmxlIHRvIHJlcG9ydCB0aGUgZGlyZWN0IHJlZ2lvbiBhcwo+PiAiZGlyZWN0
X3JlbGF4ZWQiIHRoZXJlLiBBdCB0aGUgbW9tZW50LCBpbiBjYXNlIHRoZSBzYW1lIGRpcmVjdAo+
PiByZWdpb24gaXMgdXNlZCBieSAyIGRldmljZXMsIG9uZSBVU0IvR0ZYIGFuZCBhbm90aGVyIG5v
dCBiZWxvbmdpbmcKPj4gdG8gdGhlIHByZXZpb3VzIGNhdGVnb3JpZXMsIHRoZSBkaXJlY3QgcmVn
aW9uIHdpbGwgYmUgb3V0cHV0IHR3aWNlCj4+IHdpdGggImRpcmVjdCIgdHlwZS4KPiAKPiBIbW0s
IHRoYXQgc291bmRzIGEgYml0IG9mZiAtIGlmIHdlIGhhdmUgb3ZlcmxhcHBpbmcgcmVnaW9ucyB3
aXRoaW4gdGhlCj4gc2FtZSBkb21haW4sIHRoZW4gd2UgbmVlZCB0byBkbyBzb21lIGFkZGl0aW9u
YWwgcHJlLXByb2Nlc3NpbmcgdG8gYWRqdXN0Cj4gdGhlbSBhbnl3YXksIHNpbmNlIGFueSBwYXJ0
IG9mIGEgcmVsYXhhYmxlIHJlZ2lvbiB3aGljaCBvdmVybGFwcyBhCj4gbm9uLXJlbGF4YWJsZSBy
ZWdpb24gY2Fubm90IGFjdHVhbGx5IGJlIHJlbGF4ZWQsIGFuZCBzbyByZWFsbHkgc2hvdWxkCj4g
bmV2ZXIgYmUgZGVzY3JpYmVkIGFzIHN1Y2guCkluIGlvbW11X2luc2VydF9yZXN2X3JlZ2lvbigp
LCB3ZSBhcmUgb3ZlcmxhcHBpbmcgcmVnaW9ucyBvZiB0aGUgc2FtZQp0eXBlLiBTbyBpb21tdV9n
ZXRfZ3JvdXBfcmVzdl9yZWdpb25zKCkgc2hvdWxkIHJldHVybiBib3RoIHRoZSByZWxheGFibGUK
cmVnaW9uIGFuZCBub24gcmVsYXhhYmxlIG9uZS4gSSBzaG91bGQgdGVzdCB0aGlzIGFnYWluIHVz
aW5nIGEgaGFja2VkCmtlcm5lbCB0aG91Z2guCj4gCj4+IFRoaXMgd291bGQgdW5ibG9jayBTaGFt
ZWVyJ3Mgc2VyaWVzOgo+PiBbUEFUQ0ggdjYgMC83XSB2ZmlvL3R5cGUxOiBBZGQgc3VwcG9ydCBm
b3IgdmFsaWQgaW92YSBsaXN0IG1hbmFnZW1lbnQKPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMDQyNTMwOS8KPj4KPj4gd2hpY2ggZmFpbGVkIHRvIGdldCBwdWxsZWQgZm9y
IDQuMTggbWVyZ2Ugd2luZG93IGR1ZSB0byBJR0QKPj4gZGV2aWNlIGFzc2lnbm1lbnQgcmVncmVz
c2lvbi4KPj4KPj4gdjIgLT4gdjM6Cj4+IC0gZml4IGRpcmVjdCB0eXBlIGNoZWNrCj4+IC0tLQo+
PiDCoCBkcml2ZXJzL2lvbW11L2lvbW11LmMgfCAxMiArKysrKysrLS0tLS0KPj4gwqAgaW5jbHVk
ZS9saW51eC9pb21tdS5oIHzCoCA2ICsrKysrKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lv
bW11L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L2lvbW11LmMKPj4gaW5kZXggYWU0ZWE1YzBlNmY5
Li4yOGMzZDYzNTE4MzIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYwo+PiAr
KysgYi9kcml2ZXJzL2lvbW11L2lvbW11LmMKPj4gQEAgLTczLDEwICs3MywxMSBAQCBzdHJ1Y3Qg
aW9tbXVfZ3JvdXBfYXR0cmlidXRlIHsKPj4gwqAgfTsKPj4gwqAgwqAgc3RhdGljIGNvbnN0IGNo
YXIgKiBjb25zdCBpb21tdV9ncm91cF9yZXN2X3R5cGVfc3RyaW5nW10gPSB7Cj4+IC3CoMKgwqAg
W0lPTU1VX1JFU1ZfRElSRUNUXcKgwqDCoCA9ICJkaXJlY3QiLAo+PiAtwqDCoMKgIFtJT01NVV9S
RVNWX1JFU0VSVkVEXcKgwqDCoCA9ICJyZXNlcnZlZCIsCj4+IC3CoMKgwqAgW0lPTU1VX1JFU1Zf
TVNJXcKgwqDCoCA9ICJtc2kiLAo+PiAtwqDCoMKgIFtJT01NVV9SRVNWX1NXX01TSV3CoMKgwqAg
PSAibXNpIiwKPj4gK8KgwqDCoCBbSU9NTVVfUkVTVl9ESVJFQ1RdwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA9ICJkaXJlY3QiLAo+PiArwqDCoMKgIFtJT01NVV9SRVNWX0RJUkVDVF9SRUxBWEFCTEVd
wqDCoMKgwqDCoMKgwqAgPSAiZGlyZWN0IiwKPiAKPiBXYXNuJ3QgcGFydCBvZiB0aGUgaWRlYSB0
aGF0IHdlIG1pZ2h0IG5vdCBuZWVkIHRvIGV4cG9zZSB0aGVzZSB0bwo+IHVzZXJzcGFjZSBhdCBh
bGwgaWYgdGhleSdyZSBvbmx5IHJlbGV2YW50IHRvIGRlZmF1bHQgZG9tYWlucywgYW5kIG5vdCB0
bwo+IFZGSU8gZG9tYWlucyBvciBhbnl0aGluZyBlbHNlIHVzZXJzcGFjZSBjYW4gZ2V0IGludm9s
dmVkIHdpdGg/CkZ1ciBzdXJlLCB0b2RheSwgdGhvc2UgcmVnaW9ucyBhcmUgZXhwb3NlZCBhcyAi
ZGlyZWN0Ii4gSXNuJ3QgdGhpcwppbmZvcm1hdGlvbiByZWxldmFudCB0byB0aGUgdXNlcnNwYWNl
IGFzIGl0IHdvdWxkIHJhdGhlciBub3QgdXNlIHRob3NlCmRpcmVjdCByZWdpb25zLiBXZSBldmVu
dHVhbGx5IGNob3NlIHRvIGltcGxlbWVudCB0aGUgY2hlY2sgaW5zaWRlIHRoZQpWRklPIGRyaXZl
ciBidXQgSSB1bmRlcnN0b29kIHdlIHdhbnRlZCB0aGlzIGluZm8gdG8gYmUgdmlzaWJsZS4gVGhl
biBpdAppcyBhcmd1YWJsZSB3aGV0aGVyIHdlIHNob3VsZCBleHBvc2UgdGhlIG5ldyByZWxheGFi
bGUgdHlwZSwgYXQgdGhlIHBhaW4Kb2YgbWFraW5nIHRoZSBVQUJJIGV2b2x2ZS4KCj4gCj4+ICvC
oMKgwqAgW0lPTU1VX1JFU1ZfUkVTRVJWRURdwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICJyZXNl
cnZlZCIsCj4+ICvCoMKgwqAgW0lPTU1VX1JFU1ZfTVNJXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PSAibXNpIiwKPj4gK8KgwqDCoCBbSU9NTVVfUkVTVl9TV19NU0ldwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA9ICJtc2kiLAo+PiDCoCB9Owo+PiDCoCDCoCAjZGVmaW5lIElPTU1VX0dST1VQX0FUVFIo
X25hbWUsIF9tb2RlLCBfc2hvdywgX3N0b3JlKcKgwqDCoMKgwqDCoMKgIFwKPj4gQEAgLTU3Myw3
ICs1NzQsOCBAQCBzdGF0aWMgaW50Cj4+IGlvbW11X2dyb3VwX2NyZWF0ZV9kaXJlY3RfbWFwcGlu
Z3Moc3RydWN0IGlvbW11X2dyb3VwICpncm91cCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXJ0
ID0gQUxJR04oZW50cnktPnN0YXJ0LCBwZ19zaXplKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVu
ZMKgwqAgPSBBTElHTihlbnRyeS0+c3RhcnQgKyBlbnRyeS0+bGVuZ3RoLCBwZ19zaXplKTsKPj4g
wqAgLcKgwqDCoMKgwqDCoMKgIGlmIChlbnRyeS0+dHlwZSAhPSBJT01NVV9SRVNWX0RJUkVDVCkK
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChlbnRyeS0+dHlwZSAhPSBJT01NVV9SRVNWX0RJUkVDVCAm
Jgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyeS0+dHlwZSAhPSBJT01NVV9SRVNWX0RJ
UkVDVF9SRUxBWEFCTEUpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+
PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChhZGRyID0gc3RhcnQ7IGFkZHIgPCBlbmQ7IGFk
ZHIgKz0gcGdfc2l6ZSkgewo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb21tdS5oIGIv
aW5jbHVkZS9saW51eC9pb21tdS5oCj4+IGluZGV4IGJhOTE2NjY5OThmYi4uMTRhNTIxZjg1ZjE0
IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2lvbW11LmgKPj4gKysrIGIvaW5jbHVkZS9s
aW51eC9pb21tdS5oCj4+IEBAIC0xMzUsNiArMTM1LDEyIEBAIGVudW0gaW9tbXVfYXR0ciB7Cj4+
IMKgIGVudW0gaW9tbXVfcmVzdl90eXBlIHsKPj4gwqDCoMKgwqDCoCAvKiBNZW1vcnkgcmVnaW9u
cyB3aGljaCBtdXN0IGJlIG1hcHBlZCAxOjEgYXQgYWxsIHRpbWVzICovCj4+IMKgwqDCoMKgwqAg
SU9NTVVfUkVTVl9ESVJFQ1QsCj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogTWVtb3J5IHJl
Z2lvbnMgd2hpY2ggYXJlIGFkdmVydGlzZWQgdG8gYmUgMToxIGJ1dCBhcmUKPj4gK8KgwqDCoMKg
ICogY29tbW9ubHkgY29uc2lkZXJlZCByZWxheGFibGUgaW4gc29tZSBjb25kaXRpb25zLAo+PiAr
wqDCoMKgwqAgKiBmb3IgaW5zdGFuY2UgaW4gZGV2aWNlIGFzc2lnbm1lbnQgdXNlIGNhc2UgKFVT
QiwgR3JhcGhpY3MpCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIElPTU1VX1JFU1ZfRElSRUNU
X1JFTEFYQUJMRSwKPiAKPiBXaGF0IGRvIHlvdSB0aGluayBvZiBzL1JFTEFYQUJMRS9CT09ULyA/
IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGVzZQo+IHJlZ2lvbnMgYXJlIG9ubHkgY29uc2lk
ZXJlZCByZWxldmFudCB1bnRpbCBMaW51eCBoYXMgdGFrZW4gZnVsbCBjb250cm9sCj4gb2YgdGhl
IGVuZHBvaW50LCBhbmQgaGF2aW5nIGEgc2xpZ2h0bHkgbW9yZSB3ZWxsLWRlZmluZWQgc2NvcGUg
dGhhbgo+ICJzb21lIGNvbmRpdGlvbnMiIG1pZ2h0IGJlIG5pY2UuClRoYXQncyBub3QgbXkgY3Vy
cmVudCB1bmRlcnN0YW5kaW5nLiBJIHRoaW5rIHRob3NlIFJNUlJzIG1heSBiZSB1c2VkCnBvc3Qt
Ym9vdCAoZXNwZWNpYWxseSB0aGUgSUdEIHN0b2xlbiBtZW1vcnkgY292ZXJlZCBieSBSTVJSKS4g
SQp1bmRlcnN0YW5kIHRoaXMgZGVwZW5kcyBvbiB0aGUgdmlkZW8gbW9kZSBvciBGVyBpbiB1c2Ug
YnkgdGhlIElHRC4gQnV0IEkKYW0gZGVmaW5pdGl2ZWx5IG5vdCBhbiBleHBlcnQgaGVyZS4KPiAK
PiBUaGVyZSdzIGFuIG9wZW4gcXVlc3Rpb24gb2YgaG93IHRvIGhhbmRsZSB0aGluZ3MgbGlrZSBz
aW1wbGUtZmIgYW5kIEVGSQo+IGZyYW1lYnVmZmVyIGhhbmRvdmVyIG9uIEFybSBhbmQgb3RoZXIg
cGxhdGZvcm1zLCBzbyBJJ2QgcmVhbGx5IGxpa2UgdG8KPiBiZSBhYmxlIHRvIHNsb3QgdGhhdCBy
aWdodCBpbnRvIHRoaXMgY2FzZSBhcyB3ZWxsIChob3cgd2UgZGVzY3JpYmUgdGhlCj4gcmVsZXZh
bnQgY29ubmVjdGlvbnMgaW4gRFQvQUNQSSBpcyBhbm90aGVyIG1hdHRlciwgYnV0IGhleSwgb25l
IHN0ZXAgYXQKPiBhIHRpbWUuLi4pCj4gCj4gT3RoZXJ3aXNlIHRob3VnaCwgSSB0b28gYW0gcGxl
YXNlZCB0byBzZWUgdGhpcywgdGhhbmtzISBJIGRpZCBzdGFydAo+IGhhdmluZyBhIGdvIG15c2Vs
ZiBhZnRlciB0YWxraW5nIHRvIEFsZXggYXQgS1ZNIEZvcnVtLCBidXQgSSBnb3QgYm9nZ2VkCj4g
ZG93biBpbiB0aGUgaW50ZWwtaW9tbXUgcGFydHMgYW5kIGluZXZpdGFibHkgZGlzdHJhY3RlZCAt
IHBhdGNoICM3IGxvb2tzCj4gYmVhdXRpZnVsbHkgc2ltcGxlciB0aGFuIEknZCBjb252aW5jZWQg
bXlzZWxmIHdhcyBwb3NzaWJsZSA6RApUaGFuayB5b3UgUm9iaW4uIExldCdzIHNlZSBpZiB3ZSBj
YW4gY29udmVyZ2UgLi4uCgpUaGFua3MKCkVyaWMKPiAKPiBSb2Jpbi4KPiAKPj4gwqDCoMKgwqDC
oCAvKiBBcmJpdHJhcnkgIm5ldmVyIG1hcCB0aGlzIG9yIGdpdmUgaXQgdG8gYSBkZXZpY2UiIGFk
ZHJlc3MKPj4gcmFuZ2VzICovCj4+IMKgwqDCoMKgwqAgSU9NTVVfUkVTVl9SRVNFUlZFRCwKPj4g
wqDCoMKgwqDCoCAvKiBIYXJkd2FyZSBNU0kgcmVnaW9uICh1bnRyYW5zbGF0ZWQpICovCj4+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxp
bmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
