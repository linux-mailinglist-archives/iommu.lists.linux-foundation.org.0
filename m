Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B0A2A996D
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 17:26:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C5721203ED;
	Fri,  6 Nov 2020 16:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFUQwyGcK6yj; Fri,  6 Nov 2020 16:26:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 175F92036C;
	Fri,  6 Nov 2020 16:26:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F35D6C0889;
	Fri,  6 Nov 2020 16:26:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CBB6C0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 16:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 86EF08697D
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 16:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plL4Dcv1EP6P for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 16:26:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD7FD86972
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 16:26:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A45F14BF;
 Fri,  6 Nov 2020 08:26:28 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 051B13F66E;
 Fri,  6 Nov 2020 08:26:25 -0800 (PST)
Subject: Re: [RFC PATCH 0/4] ACPI/IORT: Support for IORT RMR node
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "devel@acpica.org" <devel@acpica.org>
References: <20201027112646.44680-1-shameerali.kolothum.thodi@huawei.com>
 <f389e864-3d7a-3c96-8f51-c04f92759df1@arm.com>
 <36e3a0e58e334e6aa3c051000d742543@huawei.com>
 <ca4a8e2d-40d9-b08d-7ec9-6a50d37f9126@arm.com>
 <ad2f8ea7821f4b728ab32b61e4a6121e@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5ce01d8d-c2dc-8c13-0f48-b3b35254c810@arm.com>
Date: Fri, 6 Nov 2020 16:26:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ad2f8ea7821f4b728ab32b61e4a6121e@huawei.com>
Content-Language: en-GB
Cc: Linuxarm <linuxarm@huawei.com>,
 "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 Sami Mujawar <Sami.Mujawar@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>
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

T24gMDYvMTEvMjAyMCAxNjoxNywgU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSB3cm90ZToKPiAK
PiAKPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogU3RldmVuIFByaWNlIFtt
YWlsdG86c3RldmVuLnByaWNlQGFybS5jb21dCj4+IFNlbnQ6IDA2IE5vdmVtYmVyIDIwMjAgMTU6
MjIKPj4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgPHNoYW1lZXJhbGkua29sb3RodW0u
dGhvZGlAaHVhd2VpLmNvbT47Cj4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgbGludXgtYWNwaUB2Z2VyLmtlcm5lbC5vcmc7Cj4+IGlvbW11QGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnOyBkZXZlbEBhY3BpY2Eub3JnCj4+IENjOiBsb3JlbnpvLnBpZXJhbGlzaUBhcm0u
Y29tOyBqb3JvQDhieXRlcy5vcmc7IEpvbmF0aGFuIENhbWVyb24KPj4gPGpvbmF0aGFuLmNhbWVy
b25AaHVhd2VpLmNvbT47IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWkuY29tPjsKPj4gR3VvaGFu
anVuIChIYW5qdW4gR3VvKSA8Z3VvaGFuanVuQGh1YXdlaS5jb20+OyBTYW1pIE11amF3YXIKPj4g
PFNhbWkuTXVqYXdhckBhcm0uY29tPjsgcm9iaW4ubXVycGh5QGFybS5jb207IHdhbmdodWlxaWFu
Zwo+PiA8d2FuZ2h1aXFpYW5nQGh1YXdlaS5jb20+Cj4+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENI
IDAvNF0gQUNQSS9JT1JUOiBTdXBwb3J0IGZvciBJT1JUIFJNUiBub2RlCj4+Cj4+IE9uIDI4LzEw
LzIwMjAgMTg6MjQsIFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgd3JvdGU6Cj4+PiBIaSBTdGV2
ZSwKPj4+Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBTdGV2ZW4g
UHJpY2UgW21haWx0bzpzdGV2ZW4ucHJpY2VAYXJtLmNvbV0KPj4+PiBTZW50OiAyOCBPY3RvYmVy
IDIwMjAgMTY6NDQKPj4+PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFs
aS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPjsKPj4+PiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7IGxpbnV4LWFjcGlAdmdlci5rZXJuZWwub3JnOwo+Pj4+IGlvbW11QGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOyBkZXZlbEBhY3BpY2Eub3JnCj4+Pj4gQ2M6IGxvcmVu
em8ucGllcmFsaXNpQGFybS5jb207IGpvcm9AOGJ5dGVzLm9yZzsgSm9uYXRoYW4gQ2FtZXJvbgo+
Pj4+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBMaW51eGFybSA8bGludXhhcm1AaHVh
d2VpLmNvbT47Cj4+Pj4gR3VvaGFuanVuIChIYW5qdW4gR3VvKSA8Z3VvaGFuanVuQGh1YXdlaS5j
b20+Owo+PiByb2Jpbi5tdXJwaHlAYXJtLmNvbTsKPj4+PiB3YW5naHVpcWlhbmcgPHdhbmdodWlx
aWFuZ0BodWF3ZWkuY29tPjsgU2FtaSBNdWphd2FyCj4+Pj4gPFNhbWkuTXVqYXdhckBhcm0uY29t
Pgo+Pj4+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAvNF0gQUNQSS9JT1JUOiBTdXBwb3J0IGZv
ciBJT1JUIFJNUiBub2RlCj4+Pj4KPj4+PiBPbiAyNy8xMC8yMDIwIDExOjI2LCBTaGFtZWVyIEtv
bG90aHVtIHdyb3RlOgo+Pj4+PiBUaGUgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBJT1JUIFJNUiBu
b2RlcyBzcGVjaWZpZWQgaW4gSU9SVAo+Pj4+PiBSZXZpc2lvbiBFIC1BUk0gREVOIDAwNDlFWzBd
LiBSTVIgbm9kZXMgYXJlwqB1c2VkIHRvwqBkZXNjcmliZSBtZW1vcnkKPj4+Pj4gcmFuZ2VzIHRo
YXQgYXJlIHVzZWQgYnkgZW5kcG9pbnRzIGFuZCByZXF1aXJlIGEgdW5pdHkgbWFwcGluZwo+Pj4+
PiBpbiBTTU1VLgo+Pj4+Cj4+Pj4gSGkgU2hhbWVlciwKPj4+Pgo+Pj4+IEkndmUgYWxzbyBiZWVu
IHRha2luZyBhIGxvb2sgYXQgUk1SLCBhbmQgU2FtaSBpcyBoZWxwaW5nIG1lIGdldCBzZXQgdXAK
Pj4+PiBzbyB0aGF0IEkgY2FuIGRvIHNvbWUgdGVzdGluZy4gV2UncmUgaG9waW5nIHRvIGJlIGFi
bGUgdG8gdGVzdCBhbiBFRkkKPj4+PiBmcmFtZWJ1ZmZlciBvciBzcGxhc2ggc2NyZWVuIC0gd2hp
Y2ggaGFzIHRoZSBhZGRlZCBjb21wbGljYXRpb24gb2YgdGhlCj4+Pj4gdW5pdHkgbWFwcGluZyBi
ZWNvbWluZyByZWR1bmRhbnQgaWYgYSBuYXRpdmUgZGlzcGxheSBkcml2ZXIgdGFrZXMgb3Zlcgo+
Pj4+IHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIuCj4+Pj4KPj4+PiBJJ3ZlIGxvb2tlZCB0aHJvdWdo
IHlvdXIgc2VyaWVzIGFuZCB0aGUgY29kZSBsb29rcyBjb3JyZWN0IHRvIG1lLgo+Pj4KPj4+IFRo
YW5rcyBmb3IgdGFraW5nIGEgbG9vayBhbmQgdGhlIGRldGFpbHMuCj4+Pgo+Pj4+IEhvcGVmdWxs
eSBJJ2xsIGJlIGFibGUgdG8gZ2l2ZSBpdCBzb21lIHRlc3Rpbmcgc29vbi4KPj4+Cj4+PiBDb29s
LiBQbGVhc2UgdXBkYXRlIG9uY2UgeW91IGdldCBhIGNoYW5jZSBydW4gdGhlIHRlc3RzLgo+Pgo+
PiBIaSBTaGFtZWVyLAo+IAo+IEhpIFN0ZXZlLAo+IAo+PiBKdXN0IHRvIHVwZGF0ZSBvbiB0aGlz
LCBmb3IgdGhlIEVGSSBmcmFtZWJ1ZmZlciB1c2UgY2FzZSBJIGhpdCBleGFjdGx5Cj4+IHRoZSBp
c3N1ZSB0aGF0IFJvYmluIGhhcyBtZW50aW9uZWQgaW4gYW5vdGhlciB0aHJlYWQgLSB0aGUgUk1S
IGlzCj4+IGVmZmVjdGl2ZWx5IGlnbm9yZWQgYmVjYXVzZSB0aGUgZGlzcGxheSBjb250cm9sbGVy
IGlzbid0IGJlaW5nIGhhbmRsZWQKPj4gYnkgTGludXggKHNvIHRoZXJlJ3Mgbm8gZGV2aWNlIHRv
IGxpbmsgaXQgdG8pLgo+IAo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4gSGVyZSwgYnkgImlnbm9y
ZWQgInlvdSBtZWFudCBnZXRfcmVzdl9yZWdpb25zKCkKPiBpcyBub3QgY2FsbGVkIG9yIG5vdD8K
CmdldF9yZXN2X3JlZ2lvbnMoKSBpc24ndCBjYWxsZWQuCgo+ICAgVGhlIHNwbGFzaCBzY3JlZW4g
bWlnaHQKPj4gc2ltaWxhcmx5IGZsaWNrZXIgYXMgdGhlIFNNTVUgcmVzZXQgd2lsbCBpbml0aWFs
bHkgYmxvY2sgdGhlIHRyYWZmaWMKPj4gYmVmb3JlIHRoZSBSTVIgcmVnaW9uIGlzIGVuYWJsZWQu
Cj4gCj4gRG9lcyB0aGF0IG1lYW4geW91IHNvbWVob3cgbWFuYWdlZCB0byBtYWtlIHRoZSB1bml0
eQo+IG1hcHBpbmcgYnV0IHRoZXJlIHdhcyBmbGlja2VyIGR1cmluZyB0aGUgU01NVSByZXNldCB0
bwo+IHVuaXR5IG1hcHBpbmcgc2V0dXAgcGVyaW9kLiBTb3JyeSBJIGFtIHRyeWluZyB0byB1bmRl
cnN0YW5kCj4gdGhlIGV4YWN0IGJlaGF2aW9yIG9ic2VydmVkIGluIHRoaXMgY2FzZS4KCkkgaGF2
ZW4ndCB5ZXQgZ290IHRoaXMgY29tcGxldGVseSB3b3JraW5nIChvbiB0aGUgYm9hcmQgd2hpY2gg
SSdtIAp0ZXN0aW5nIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgZG9lc24ndCBoYXZlIGFueSBleGlz
dGluZyBBQ1BJIGJpbmRpbmdzKS4gCkhvd2V2ZXIgZnJvbSB3aGF0IEkgdW5kZXJzdGFuZCB0aGUg
U01NVSByZXNldCB3b3VsZCBibG9jayBhbGwgbWVtb3J5IAphY2Nlc3MgZm9yIHRoZSBkaXNwbGF5
IGNvbnRyb2xsZXIgYmVmb3JlIHRoZSBSTVIgcmVnaW9uIHdvdWxkIGJlIHNldHVwLiAKSSdtIGdv
aW5nIHRvIHRyeSB0byBnZXQgdGhlIGRpc3BsYXkgY29udHJvbGxlciB3b3JraW5nIHdpdGggQUNQ
SSBzbyBJIApjYW4gdGVzdCB0aGlzIHByb3Blcmx5LgoKU3RldmUKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
