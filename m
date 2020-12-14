Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B82D9808
	for <lists.iommu@lfdr.de>; Mon, 14 Dec 2020 13:33:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 45A35866E2;
	Mon, 14 Dec 2020 12:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXNWGXWw3-AJ; Mon, 14 Dec 2020 12:33:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 01DB0866C8;
	Mon, 14 Dec 2020 12:33:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED136C013B;
	Mon, 14 Dec 2020 12:33:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77B4CC013B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 12:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 63D7186E41
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 12:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUDuokwyjir4 for <iommu@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 12:33:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 421CC86C95
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 12:33:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B8C9D6E;
 Mon, 14 Dec 2020 04:33:48 -0800 (PST)
Received: from [10.57.33.60] (unknown [10.57.33.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B4FF3F66B;
 Mon, 14 Dec 2020 04:33:46 -0800 (PST)
Subject: Re: [RFC PATCH v2 0/8] ACPI/IORT: Support for IORT RMR node
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Steven Price <steven.price@arm.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "devel@acpica.org" <devel@acpica.org>
References: <20201119121150.3316-1-shameerali.kolothum.thodi@huawei.com>
 <e9837ba5-deeb-c64c-2261-d0ab82eebfac@arm.com>
 <67cb563d19114f609348dc9f8b4307e9@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8f92d0b3-360b-5d47-10a7-83d09e75d993@arm.com>
Date: Mon, 14 Dec 2020 12:33:45 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <67cb563d19114f609348dc9f8b4307e9@huawei.com>
Content-Language: en-GB
Cc: "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, "Sami.Mujawar@arm.com" <Sami.Mujawar@arm.com>,
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

T24gMjAyMC0xMi0xNCAxMDo1NSwgU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSB3cm90ZToKPiBI
aSBTdGV2ZSwKPiAKPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogU3RldmVu
IFByaWNlIFttYWlsdG86c3RldmVuLnByaWNlQGFybS5jb21dCj4+IFNlbnQ6IDEwIERlY2VtYmVy
IDIwMjAgMTA6MjYKPj4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgPHNoYW1lZXJhbGku
a29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT47Cj4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXgtYWNwaUB2Z2VyLmtlcm5lbC5vcmc7Cj4+IGlvbW11QGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnOyBkZXZlbEBhY3BpY2Eub3JnCj4+IENjOiBMaW51eGFybSA8bGlu
dXhhcm1AaHVhd2VpLmNvbT47IGxvcmVuem8ucGllcmFsaXNpQGFybS5jb207Cj4+IGpvcm9AOGJ5
dGVzLm9yZzsgcm9iaW4ubXVycGh5QGFybS5jb207IHdhbmdodWlxaWFuZwo+PiA8d2FuZ2h1aXFp
YW5nQGh1YXdlaS5jb20+OyBHdW9oYW5qdW4gKEhhbmp1biBHdW8pCj4+IDxndW9oYW5qdW5AaHVh
d2VpLmNvbT47IEpvbmF0aGFuIENhbWVyb24KPj4gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNv
bT47IFNhbWkuTXVqYXdhckBhcm0uY29tCj4+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYyIDAv
OF0gQUNQSS9JT1JUOiBTdXBwb3J0IGZvciBJT1JUIFJNUiBub2RlCj4+Cj4+IE9uIDE5LzExLzIw
MjAgMTI6MTEsIFNoYW1lZXIgS29sb3RodW0gd3JvdGU6Cj4+PiBSRkMgdjEgLS0+IHYyOgo+Pj4g
ICDCoC0gQWRkZWQgYSBnZW5lcmljIGludGVyZmFjZSBmb3IgSU9NTVUgZHJpdmVycyB0byByZXRy
aWV2ZSBhbGwgdGhlCj4+PiAgIMKgIMKgUk1SIGluZm8gYXNzb2NpYXRlZCB3aXRoIGEgZ2l2ZW4g
SU9NTVUuCj4+PiAgIMKgLSBTTU1VdjMgZHJpdmVyIGdldHMgdGhlIFJNUiBsaXN0IGR1cmluZyBw
cm9iZSgpIGFuZCBpbnN0YWxscwo+Pj4gICDCoMKgIGJ5cGFzcyBTVEVzIGZvciBhbGwgdGhlIFNJ
RHMgaW4gdGhlIFJNUiBsaXN0LiBUaGlzIGlzIHRvIGtlZXAKPj4+ICAgIMKgIHRoZSBvbmdvaW5n
IHRyYWZmaWMgYWxpdmUoaWYgYW55KSBkdXJpbmcgU01NVXYzIHJlc2V0LiBUaGlzIGlzCj4+PiAg
ICAgIGJhc2VkIG9uIHRoZSBzdWdnZXN0aW9ucyByZWNlaXZlZCBmb3IgdjEgdG8gdGFrZSBjYXJl
IG9mIHRoZQo+Pj4gICAgICBFRkkgZnJhbWVidWZmZXIgdXNlIGNhc2UuIE9ubHkgc2FuaXR5IHRl
c3RlZCBmb3Igbm93Lgo+Pgo+PiBIaSBTaGFtZWVyLAo+Pgo+PiBTb3JyeSBmb3Igbm90IGxvb2tp
bmcgYXQgdGhpcyBiZWZvcmUuCj4+Cj4+IERvIHlvdSBoYXZlIGFueSBwbGFucyB0byBpbXBsZW1l
bnQgc3VwcG9ydCBpbiB0aGUgU01NVXYyIGRyaXZlcj8gVGhlCj4+IHBsYXRmb3JtIEkndmUgYmVl
biB0ZXN0aW5nIHRoZSBFRkkgZnJhbWVidWZmZXIgc3VwcG9ydCBvbiBoYXMgdGhlCj4+IGRpc3Bs
YXkgY29udHJvbGxlciBiZWhpbmQgU01NVXYyLCBzbyBhcyBpdCBzdGFuZHMgdGhpcyBzZXJpZXMg
ZG9lc24ndAo+PiB3b3JrLiBJIGRpZCBoYWNrIHNvbWV0aGluZyB1cCBmb3IgU01NVXYyIHNvIEkg
d2FzIGFibGUgdG8gdGVzdCB0aGUgZmlyc3QKPj4gNCBwYXRjaGVzLgo+IAo+IFRoYW5rcyBmb3Ig
dGFraW5nIGEgbG9vay4gU3VyZSwgSSBjYW4gbG9vayBpbnRvIGFkZGluZyB0aGUgc3VwcG9ydCBm
b3IgU01NVXYyLgo+IAo+Pgo+Pj4gICDCoC0gRHVyaW5nIHRoZSBwcm9iZS9hdHRhY2ggZGV2aWNl
LCBTTU1VdjMgZHJpdmVyIHJlc2VydmVzIGFueQo+Pj4gICDCoCDCoFJNUiByZWdpb24gYXNzb2Np
YXRlZCB3aXRoIHRoZSBkZXZpY2Ugc3VjaCB0aGF0IHRoZXJlIGlzIGEgdW5pdHkKPj4+ICAgwqAg
wqBtYXBwaW5nIGZvciB0aGVtIGluIFNNTVUuCj4+Cj4+IEZvciB0aGUgRUZJIGZyYW1lYnVmZmVy
IHVzZSBjYXNlIHRoZXJlIGlzIG5vIGRldmljZSB0byBhdHRhY2ggc28gSQo+PiBiZWxpZXZlIHdl
IGFyZSBsZWZ0IHdpdGgganVzdCB0aGUgc3RyZWFtIElEIGluIGJ5cGFzcyBtb2RlIC0gd2hpY2gg
aXMKPj4gZGVmaW5pdGVseSBhbiBpbXByb3ZlbWVudCAodGhlIGRpc3BsYXkgd29ya3MhKQo+IAo+
IENvb2wuIFRoYXTigJlzIGdvb2QgdG8ga25vdy4KPiAKPiAgIGJ1dCBub3QgYWN0dWFsbHkgYSB1
bml0eQo+PiBtYXBwaW5nIG9mIHRoZSBSTVIgcmFuZ2UuIEknbSBub3Qgc3VyZSB3aGV0aGVyIGl0
J3Mgd29ydGggZml4aW5nIHRoaXMgb3IKPj4gbm90LCBidXQgSSBqdXN0IHdhbnRlZCB0byBwb2lu
dCBvdXQgdGhlcmUncyBzdGlsbCBhIG5lZWQgZm9yIGEgZHJpdmVyCj4+IGZvciB0aGUgZGV2aWNl
IGJlZm9yZSB0aGUgYnlwYXNzIG1vZGUgaXMgcmVwbGFjZWQgd2l0aCB0aGUgdW5pdHkgbWFwcGlu
Zy4KPiAKPiBJIGFtIG5vdCBzdXJlIGVpdGhlci4gTXkgaWRlYSB3YXMgd2Ugd2lsbCBoYXZlIGJ5
cGFzcyBTVEUgc2V0dXAgZm9yIGFsbCBkZXZpY2VzCj4gd2l0aCBSTVIgaW5pdGlhbGx5IGFuZCB3
aGVuIHRoZSBjb3JyZXNwb25kaW5nIGRyaXZlciB0YWtlcyBvdmVyKGlmIHRoYXQgaGFwcGVucykK
PiB3ZSB3aWxsIGhhdmUgdGhlIHVuaXR5IG1hcHBpbmcgc2V0dXAgcHJvcGVybHkgZm9yIHRoZSBS
TVIgcmVnaW9ucy4gQW5kIGZvciBjYXNlcwo+IGxpa2UgdGhlIGFib3ZlLCBpdCB3aWxsIHJlbWFp
biBpbiB0aGUgYnlwYXNzIG1vZGUuCj4gCj4gRG8geW91IHNlZSBhbnkgcHJvYmxlbShzZWN1cml0
eT8pIGlmIHRoZSBkZXYgc3RyZWFtcyByZW1haW4gaW4gYnlwYXNzIG1vZGUgZm9yCj4gdGhpcyBk
ZXY/IE9yIGlzIGl0IHBvc3NpYmxlIHRvIGhhdmUgYSBzdHViIGRyaXZlciBmb3IgdGhpcyBkZXYs
IHNvIHRoYXQgd2Ugd2lsbCBoYXZlCj4gdGhlIHByb2JlL2F0dGFjaCBpbnZva2VkIGFuZCBldmVy
eXRoaW5nIHdpbGwgZmFsbCBpbiBwbGFjZT8KClRoZSBkb3duc2lkZSBpcyB0aGF0IGlmIGEgZHJp
dmVyIG5ldmVyIGJpbmRzIHRvIHRoYXQgZGV2aWNlLCBpdCByZW1haW5zIApieXBhc3NlZC4gSWYg
c29tZSBvdGhlciBleHRlcm5hbGx5LWNvbnRyb2xsZWQgbWFsaWNpb3VzIGRldmljZSBjb3VsZCAK
bWFuYWdlIHRvIHNwb29mIHRoYXQgZGV2aWNlJ3MgcmVxdWVzdGVyIElELCB0aGF0IGNvdWxkIHBv
dGVudGlhbGx5IGJlIApleHBsb2l0ZWQuCgo+IFRCSCwgSSBoYXZlbid0IGxvb2tlZCBpbnRvIGNy
ZWF0aW5nIGEgdGVtcCBkb21haW4gZm9yIHRoZXNlIHR5cGVzIG9mIHRoZSBkZXZpY2VzCj4gYW5k
IGFsc28gbm90IHN1cmUgaG93IHdlIGJlbmVmaXQgZnJvbSB0aGF0IGNvbXBhcmVkIHRvIHRoZSBT
VEUgYnlwYXNzIG1vZGUuCgpUaGF0IHNhaWQsIHNldHRpbmcgdXAgdGVtcG9yYXJ5IHRyYW5zbGF0
aW9uIGNvbnRleHRzIHRoYXQgZW5zdXJlIGFueSAKYWNjZXNzIGNhbiAqb25seSogYmUgdG8gUk1S
IHJlZ2lvbnMgdW50aWwgYSBkcml2ZXIgdGFrZXMgb3ZlciBpcyBhbiAKYXdmdWwgbG90IG1vcmUg
d29yay4gSSdtIGluY2xpbmVkIHRvIGJlIHByYWdtYXRpYyBoZXJlIGFuZCBzYXkgd2Ugc2hvdWxk
IApnZXQgdGhpbmdzIHdvcmtpbmcgYXQgYWxsIHdpdGggdGhlIHNpbXBsZSBieXBhc3MgU1RFL1My
Q1IgbWV0aG9kLCB0aGVuIApsb29rIGF0IGFkZGluZyB0aGUgaGlnaGVyLXNlY3VyaXR5IGVmZm9y
dCBvbiB0b3AuCgpSaWdodCBub3cgc3lzdGVtcyB0aGF0IG5lZWQgdGhpcyBhcmUgZWl0aGVyIGJy
b2tlbiAoYnV0IGVmZmVjdGl2ZWx5IApzZWN1cmUpIG9yIHVzaW5nIGRlZmF1bHQgYnlwYXNzIHdp
dGggU01NVXYyLiBQZW9wbGUgd2hvIHByZWZlciB0byAKbWFpbnRhaW4gc2VjdXJpdHkgb3ZlciBm
dW5jdGlvbmFsaXR5IGluIHRoZSBpbnRlcmltIGNhbiBtYWludGFpbiB0aGF0IApzdGF0dXMgcXVv
IGJ5IHNpbXBseSBjb250aW51aW5nIHRvIG5vdCBkZXNjcmliZSBhbnkgUk1Scy4KClJvYmluLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWls
aW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
