Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5D4F83C7
	for <lists.iommu@lfdr.de>; Thu,  7 Apr 2022 17:43:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75FF540CB9;
	Thu,  7 Apr 2022 15:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fz7vY7p93bD3; Thu,  7 Apr 2022 15:43:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6AD8A40CB0;
	Thu,  7 Apr 2022 15:43:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 371B1C0082;
	Thu,  7 Apr 2022 15:43:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E1FCC0012
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 15:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C82B81367
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 15:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YO8S_YWtQEhy for <iommu@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 15:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 391EB81311
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 15:43:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BB5A12FC;
 Thu,  7 Apr 2022 08:43:43 -0700 (PDT)
Received: from [10.1.39.18] (e122027.cambridge.arm.com [10.1.39.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 112223F73B;
 Thu,  7 Apr 2022 08:43:39 -0700 (PDT)
Message-ID: <83313d86-5ee4-4c61-f5a2-48aff4a5f091@arm.com>
Date: Thu, 7 Apr 2022 16:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 00/11] ACPI/IORT: Support for IORT RMR node
Content-Language: en-GB
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org
References: <20220404124209.1086-1-shameerali.kolothum.thodi@huawei.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220404124209.1086-1-shameerali.kolothum.thodi@huawei.com>
Cc: robin.murphy@arm.com, jon@solid-run.com, linuxarm@huawei.com,
 guohanjun@huawei.com, yangyicong@huawei.com, Sami.Mujawar@arm.com,
 will@kernel.org, wanghuiqiang@huawei.com
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

SGkgU2hhbWVlciwKCkkndmUgZ2l2ZW4gaXQgYSBzcGluIG9uIG15IEp1bm8gYm9hcmQgYW5kIHRo
ZSBFRklGQiB3b3JrcyBmaW5lIHdpdGggaXQuCkhvd2V2ZXIgSSBhbSBnZXR0aW5nIGEgd2Fybmlu
ZzoKCkFDUEk6IElPUlQ6IFtGaXJtd2FyZSBCdWddOiBSTVIgZGVzY3JpcHRvclsweGY4MGQwMDAw
XSB3aXRoIHplcm8gbGVuZ3RoLApjb250aW51ZSBhbnl3YXkKCldoaWNoIG9uIGV4YW1pbmF0aW9u
IG9mIHRoZSBJT1JUIHRhYmxlIGlzIGNvcnJlY3QgLSB0aGUgZmlybXdhcmUgZG9lcwppbmRlZWQg
c2VlbSB0byBoYXZlIGEgYnVnIGFuZCB0aGUgbGVuZ3RoIGluIHRoZSBJT1JUIHRhYmxlIGlzIDAs
CmhvcGVmdWxseSBJIGNhbiBnZXQgdGhhdCBmaXhlZC4gSG93ZXZlciBzaW5jZSBpdCAiYWxsIHdv
cmtzIiB0aGF0IHBvaW50cwpvdXQgdGhhdCB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbiBpc24n
dCBhY3R1YWxseSB1c2VkLiBJbnN0ZWFkIHRoZQpleGlzdGluZyBlbnRyaWVzIGZyb20gdGhlIFNN
TVUgYXJlIHJldXNlZCAoZXZlbiB0aG91Z2ggdGhleSBkb24ndCBtYXRjaAp0aGUgYWRkcmVzcy9z
aXplIHJlZ2lvbiBpbiB0aGUgUk1SKS4KCkknbSBub3Qgc3VyZSBpZiB0aGF0IG1hdHRlcnMgYnV0
IEkgdGhvdWdodCBpdCB3b3J0aCBwb2ludGluZyBvdXQgYXMgaXQncwpub3QgY3VycmVudGx5IHNw
ZWx0IG91dCB0aGF0IHRoZSBSTVIgZGVzY3JpcHRvcidzIGNvbnRlbnQgaXMgY3VycmVudGx5CmFj
dHVhbGx5IGlnbm9yZWQuCgpBbnl3YXksIEZXSVc6CgpUZXN0ZWQtYnk6IFN0ZXZlbiBQcmljZSA8
c3RldmVuLnByaWNlQGFybS5jb20+CgpTdGV2ZQoKT24gMDQvMDQvMjAyMiAxMzo0MSwgU2hhbWVl
ciBLb2xvdGh1bSB3cm90ZToKPiBIaQo+IAo+IHY4IC0tPiB2OQo+IMKgLSBBZHJlc3NlZCBjb21t
ZW50cyBmcm9tIFJvYmluIG9uIGludGVyZmFjZXMgYXMgZGlzY3Vzc2VkIGhlcmVbMF0uCj4gwqAt
IEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIExvcmVuem8uCj4gwqAKPiBUaG91Z2ggZnVuY3Rpb25h
bGx5IHRoZXJlIGFyZW4ndCBhbnkgbWFqb3IgY2hhbmdlcywgdGhlIGludGVyZmFjZXMgaGF2ZQo+
IGNoYW5nZWQgZnJvbSB2OCBhbmQgZm9yIHRoYXQgcmVhc29uIG5vdCBpbmNsdWRlZCB0aGUgVC1i
eSB0YWdzIGZyb20KPiBTdGV2ZSBhbmQgRXJpYyB5ZXQoTWFueSB0aGFua3MgZm9yIHRoYXQpLiBB
cHByZWNpYXRlIGl0IGlmIHlvdSBjb3VsZAo+IGdpdmUgdGhpcyBhIHNwaW4gYW5kIGxldMKgbWUg
a25vdy4KPiAKPiAoVGhlIHJldmlzZWQgQUNQSUNBIHB1bGwgcmVxdWVzdCBmb3IgSU9SVCBFLmQg
cmVsYXRlZCBjaGFuZ2VzIGlzCj4gaGVyZVsxXSBhbmQgdGhpcyBpcyBub3cgbWVyZ2VkIHRvIGFj
cGljYTptYXN0ZXIuKQo+IAo+IFBsZWFzZSB0YWtlIGEgbG9vayBhbmQgbGV0IG1lIGtub3cgeW91
ciB0aG91Z2h0cy4KPiAKPiBUaGFua3MsCj4gU2hhbWVlcgo+IFswXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1hcm0ta2VybmVsL2M5ODJmMWQ3LWM1NjUtNzY5YS1hYmFlLTc5Yzk2Mjk2
OWQ4OEBhcm0uY29tLwo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYWNwaWNhL2FjcGljYS9wdWxs
Lzc2NQo+IAo+IEZyb20gb2xkOgo+IFdlIGhhdmUgZmFjZWQgaXNzdWVzIHdpdGggMzQwOGlNUiBS
QUlEIGNvbnRyb2xsZXIgY2FyZHMgd2hpY2gKPiBmYWlsIHRvIGJvb3Qgd2hlbiBTTU1VIGlzIGVu
YWJsZWQuIFRoaXMgaXMgYmVjYXVzZSB0aGVzZQo+IGNvbnRyb2xsZXJzIG1ha2UgdXNlIG9mIGhv
c3QgbWVtb3J5IGZvciB2YXJpb3VzIGNhY2hpbmcgcmVsYXRlZAo+IHB1cnBvc2VzIGFuZCB3aGVu
IFNNTVUgaXMgZW5hYmxlZCB0aGUgaU1SIGZpcm13YXJlIGZhaWxzIHRvCj4gYWNjZXNzIHRoZXNl
IG1lbW9yeSByZWdpb25zIGFzIHRoZXJlIGlzIG5vIG1hcHBpbmcgZm9yIHRoZW0uCj4gSU9SVCBS
TVIgcHJvdmlkZXMgYSB3YXkgZm9yIFVFRkkgdG8gZGVzY3JpYmUgYW5kIHJlcG9ydCB0aGVzZQo+
IG1lbW9yeSByZWdpb25zIHNvIHRoYXQgdGhlIGtlcm5lbCBjYW4gbWFrZSBhIHVuaXR5IG1hcHBp
bmcgZm9yCj4gdGhlc2UgaW4gU01NVS4KPiAKPiBDaGFuZ2UgSGlzdG9yeToKPiAKPiB2NyAtLT4g
djgKPiAgIC0gUGF0Y2ggIzEgaGFzIHRlbXAgZGVmaW5pdGlvbnMgZm9yIFJNUiByZWxhdGVkIGNo
YW5nZXMgdGlsbAo+ICAgICB0aGUgQUNQSUNBIGhlYWRlciBjaGFuZ2VzIGFyZSBwYXJ0IG9mIGtl
cm5lbC4KPiAgIC0gTm8gZWFybHkgcGFyc2luZyBvZiBSTVIgbm9kZSBpbmZvIGFuZCBpcyBvbmx5
IHBhcnNlZCBhdCB0aGUKPiAgICAgdGltZSBvZiB1c2UuCj4gICAtIENoYW5nZXMgdG8gdGhlIFJN
UiBnZXQvcHV0IEFQSSBmb3JtYXQgY29tcGFyZWQgdG8gdGhlCj4gICAgIHByZXZpb3VzIHZlcnNp
b24uCj4gICAtIFN1cHBvcnQgZm9yIFJNUiBkZXNjcmlwdG9yIHNoYXJlZCBieSBtdWx0aXBsZSBz
dHJlYW0gSURzLgo+IAo+IHY2IC0tPiB2Nwo+ICAtZml4IHBvaW50ZWQgb3V0IGJ5IFN0ZXZlIHRv
IHRoZSBTTU1VdjIgU01SIGJ5cGFzcyBpbnN0YWxsIGluIHBhdGNoICM4Lgo+IAo+IHY1IC0tPiB2
Ngo+IC0gQWRkcmVzc2VkIGNvbW1lbnRzIGZyb20gUm9iaW4gJiBMb3JlbnpvLgo+ICAgOiBNb3Zl
ZCBpb3J0X3BhcnNlX3JtcigpIHRvIGFjcGlfaW9ydF9pbml0KCkgZnJvbQo+ICAgICBpb3J0X2lu
aXRfcGxhdGZvcm1fZGV2aWNlcygpLgo+ICAgOiBSZW1vdmVkIHVzZSBvZiBzdHJ1Y3QgaW9ydF9y
bXJfZW50cnkgZHVyaW5nIHRoZSBpbml0aWFsCj4gICAgIHBhcnNlLiBVc2luZyBzdHJ1Y3QgaW9t
bXVfcmVzdl9yZWdpb24gaW5zdGVhZC4KPiAgIDogUmVwb3J0IFJNUiBhZGRyZXNzIGFsaWdubWVu
dCBhbmQgb3ZlcmxhcCBlcnJvcnMsIGJ1dCBjb250aW51ZS4KPiAgIDogUmV3b3JrZWQgYXJtX3Nt
bXVfaW5pdF9ieXBhc3Nfc3RlcygpIChwYXRjaCAjIDYpLgo+IC0gVXBkYXRlZCBTTU1VdjIgYnlw
YXNzIFNNUiBjb2RlLiBUaGFua3MgdG8gSm9uIE4gKHBhdGNoICM4KS4KPiAtIFNldCBJT01NVSBw
cm90ZWN0aW9uIGZsYWdzKElPTU1VX0NBQ0hFLCBJT01NVV9NTUlPKSBiYXNlZAo+ICAgb24gVHlw
ZSBvZiBSTVIgcmVnaW9uLiBTdWdnZXN0ZWQgYnkgSm9uIE4uCj4gCj4gdjQgLS0+IHY1Cj4gIC1B
ZGRlZCBhIGZ3X2RhdGEgdW5pb24gdG8gc3RydWN0IGlvbW11X3Jlc3ZfcmVnaW9uIGFuZCByZW1v
dmVkCj4gICBzdHJ1Y3QgaW9tbXVfcm1yIChCYXNlZCBvbiBjb21tZW50cyBmcm9tIEpvZXJnL1Jv
YmluKS4KPiAgLUFkZGVkIGlvbW11X3B1dF9ybXJzKCkgdG8gcmVsZWFzZSBtZW0uCj4gIC1UaGFu
a3MgdG8gU3RldmUgZm9yIHZlcmlmeWluZyBvbiBTTU1VdjIsIGJ1dCBub3QgYWRkZWQgdGhlIFRl
c3RlZC1ieQo+ICAgeWV0IGJlY2F1c2Ugb2YgdGhlIGFib3ZlIGNoYW5nZXMuCj4gCj4gdjMgLS0+
djQKPiAtSW5jbHVkZWQgdGhlIFNNTVV2MiBTTVIgYnlwYXNzIGluc3RhbGwgY2hhbmdlcyBzdWdn
ZXN0ZWQgYnkKPiAgU3RldmUocGF0Y2ggIzcpCj4gLUFzIHBlciBSb2JpbidzIGNvbW1lbnRzLCBS
TVIgcmVzZXJ2ZSBpbXBsZW1lbnRhdGlvbiBpcyBub3cKPiAgbW9yZSBnZW5lcmljICAocGF0Y2gg
IzgpIGFuZCBkcm9wcGVkIHYzIHBhdGNoZXMgOCBhbmQgMTAuCj4gLVJlYmFzZSB0byA1LjEzLXJj
MQo+IAo+IFJGQyB2MiAtLT4gdjMKPiAgLURyb3BwZWQgUkZDIHRhZyBhcyB0aGUgQUNQSUNBIGhl
YWRlciBjaGFuZ2VzIGFyZSBub3cgcmVhZHkgdG8gYmUKPiAgIHBhcnQgb2YgNS4xM1swXS4gQnV0
IHRoaXMgc2VyaWVzIHN0aWxsIGhhcyBhIGRlcGVuZGVuY3kgb24gdGhhdCBwYXRjaC4KPiAgLUFk
ZGVkIElPUlQgRS5iIHJlbGF0ZWQgY2hhbmdlcyhub2RlIGZsYWdzLCBfRFNNIGZ1bmN0aW9uIDUg
Y2hlY2tzIGZvcgo+ICAgUENJZSkuCj4gIC1DaGFuZ2VkIFJNUiB0byBzdHJlYW0gaWQgbWFwcGlu
ZyBmcm9tIE06TiB0byBNOjEgYXMgcGVyIHRoZSBzcGVjIGFuZAo+ICAgZGlzY3Vzc2lvbiBoZXJl
WzFdLgo+ICAtTGFzdCB0d28gcGF0Y2hlcyBhZGQgc3VwcG9ydCBmb3IgU01NVXYyKFRoYW5rcyB0
byBKb24gTmV0dGxldG9uISkKPiAKPiBKb24gTmV0dGxldG9uICgxKToKPiAgIGlvbW11L2FybS1z
bW11OiBHZXQgYXNzb2NpYXRlZCBSTVIgaW5mbyBhbmQgaW5zdGFsbCBieXBhc3MgU01SCj4gCj4g
U2hhbWVlciBLb2xvdGh1bSAoMTApOgo+ICAgQUNQSS9JT1JUOiBBZGQgdGVtcG9yYXJ5IFJNUiBu
b2RlIGZsYWcgZGVmaW5pdGlvbnMKPiAgIGlvbW11OiBJbnRyb2R1Y2UgYSB1bmlvbiB0byBzdHJ1
Y3QgaW9tbXVfcmVzdl9yZWdpb24KPiAgIEFDUEkvSU9SVDogTWFrZSBpb3J0X2lvbW11X21zaV9n
ZXRfcmVzdl9yZWdpb25zKCkgcmV0dXJuIHZvaWQKPiAgIEFDUEkvSU9SVDogUHJvdmlkZSBhIGdl
bmVyaWMgaGVscGVyIHRvIHJldHJpZXZlIHJlc2VydmUgcmVnaW9ucwo+ICAgaW9tbXUvZG1hOiBJ
bnRyb2R1Y2UgYSBoZWxwZXIgdG8gcmVtb3ZlIHJlc2VydmVkIHJlZ2lvbnMKPiAgIEFDUEkvSU9S
VDogQWRkIHN1cHBvcnQgdG8gcmV0cmlldmUgSU9SVCBSTVIgcmVzZXJ2ZWQgcmVnaW9ucwo+ICAg
QUNQSS9JT1JUOiBBZGQgYSBoZWxwZXIgdG8gcmV0cmlldmUgUk1SIGluZm8gZGlyZWN0bHkKPiAg
IGlvbW11L2FybS1zbW11LXYzOiBJbnRyb2R1Y2Ugc3RydGFiIGluaXQgaGVscGVyCj4gICBpb21t
dS9hcm0tc21tdS12MzogUmVmYWN0b3IgYXJtX3NtbXVfaW5pdF9ieXBhc3Nfc3RlcygpIHRvIGZv
cmNlCj4gICAgIGJ5cGFzcwo+ICAgaW9tbXUvYXJtLXNtbXUtdjM6IEdldCBhc3NvY2lhdGVkIFJN
UiBpbmZvIGFuZCBpbnN0YWxsIGJ5cGFzcyBTVEUKPiAKPiAgZHJpdmVycy9hY3BpL2FybTY0L2lv
cnQuYyAgICAgICAgICAgICAgICAgICB8IDM2OSArKysrKysrKysrKysrKysrKystLQo+ICBkcml2
ZXJzL2lvbW11L2FwcGxlLWRhcnQuYyAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZl
cnMvaW9tbXUvYXJtL2FybS1zbW11LXYzL2FybS1zbW11LXYzLmMgfCAgODAgKysrKy0KPiAgZHJp
dmVycy9pb21tdS9hcm0vYXJtLXNtbXUvYXJtLXNtbXUuYyAgICAgICB8ICA1NCArKy0KPiAgZHJp
dmVycy9pb21tdS9kbWEtaW9tbXUuYyAgICAgICAgICAgICAgICAgICB8ICAxMSArLQo+ICBkcml2
ZXJzL2lvbW11L3ZpcnRpby1pb21tdS5jICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGluY2x1
ZGUvbGludXgvYWNwaV9pb3J0LmggICAgICAgICAgICAgICAgICAgfCAgMTggKy0KPiAgaW5jbHVk
ZS9saW51eC9kbWEtaW9tbXUuaCAgICAgICAgICAgICAgICAgICB8ICAgNSArCj4gIGluY2x1ZGUv
bGludXgvaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwo+ICA5IGZpbGVzIGNo
YW5nZWQsIDUwNSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdApp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
